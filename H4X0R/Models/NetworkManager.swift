//
//  NetworkManager.swift
//  H4X0R
//
//  Created by Adrian Cabrera on 07/03/2020.
//  Copyright © 2020 Adrian Cabrera. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(urlString:String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data,response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
