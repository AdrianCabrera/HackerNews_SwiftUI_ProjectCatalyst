//
//  WebView.swift
//  H4X0R
//
//  Created by Adrian Cabrera on 07/03/2020.
//  Copyright © 2020 Adrian Cabrera. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        if let safeString = urlString,
            let url = URL(string: safeString){
            let request = URLRequest(url:url)
            uiView.load(request)
        }
    }
}
