//
//  HomeViewModel.swift
//  githubapp
//
//  Created by AlbertStanley on 17/10/20.
//

import Foundation

class HomeViewModel : ObservableObject {
   
    @Published private var usersList : [User] = []
    @Published private var userLoading: Bool = true
    
    private let pageNumber: Int = 1
    
    func getUserList() -> [User] {
        return usersList
    }
    
    func getLoadingStatus() -> Bool {
        return userLoading
    }
    
    init() {
        requestUserList(url: "\(API_URL)users")
    }
    
    func requestUserList(url: String) {
        self.userLoading = true
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) {(data, _, err) in
            guard let jsonData = data else {return}
            do {
                let dResult = try JSONDecoder().decode(Users.self, from: jsonData)
                DispatchQueue.main.async {
                    self.usersList += dResult
                    self.userLoading = false
                }
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
