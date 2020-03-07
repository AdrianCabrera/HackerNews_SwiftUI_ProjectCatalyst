//
//  DetailView.swift
//  H4X0R
//
//  Created by Adrian Cabrera on 07/03/2020.
//  Copyright © 2020 Adrian Cabrera. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
