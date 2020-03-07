//
//  ContentView.swift
//  H4X0R
//
//  Created by Adrian Cabrera on 07/03/2020.
//  Copyright © 2020 Adrian Cabrera. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    let mainURL =  "https://hn.algolia.com/api/v1/search?tags=front_page"
    
    var body: some View {
        NavigationView {
            List(networkManager.posts, rowContent: { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            })
                .navigationBarTitle("H4X0R NEWS")
        }
        .onAppear {
            self.networkManager.fetchData(urlString: self.mainURL)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
