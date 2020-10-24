//
//  UserDetailViewModel.swift
//  githubapp
//
//  Created by AlbertStanley on 17/10/20.
//

import Foundation


class UserDetailViewModel: ObservableObject {
    @Published var tabIndex = 0
    // MARK: - User state
    @Published private var userData: User
    @Published var isLoading = false

    // MARK: - Repo state
    @Published var repoList: [Repository] = []
    @Published var isRepoLoading = false
    
    // MARK: - Repo state
    @Published var followersList: [User] = []
    @Published var isFollowersLoading = false
    
    init(user: User) {
        self.userData = user
        requestUserData(url: user.url)
    }
    
    func getUserData() -> User {
        return userData
    }
    
    func requestUserData(url: String) {
        isLoading = true
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) {(data, _, err) in
            guard let jsonData = data else {return}
            do {
                let dResult = try JSONDecoder().decode(User.self, from: jsonData)
                DispatchQueue.main.async {
                    self.userData = dResult
                    self.isLoading = false
                }
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func requestRepoListData(){
        isRepoLoading = true
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: userData.repos_url)!) {(data, _, err) in
            guard let jsonData = data else {return}
            do {
                let dResult = try JSONDecoder().decode(Repositories.self, from: jsonData)
                DispatchQueue.main.async {
                    self.repoList = dResult
                    self.isRepoLoading = false
                }
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func requestFollowersData() {
        isRepoLoading = true
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: userData.followers_url)!) {(data, _, err) in
            guard let jsonData = data else {return}
            do {
                let dResult = try JSONDecoder().decode(Users.self, from: jsonData)
                DispatchQueue.main.async {
                    self.followersList = dResult
                    self.isFollowersLoading = false
                }
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
