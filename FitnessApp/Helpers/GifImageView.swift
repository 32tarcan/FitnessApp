//
//  GifImageView.swift
//  FitnessApp
//
//  Created by Sakans on 23.08.2024.
//

import SwiftUI
import WebKit

struct GifImageView: UIViewRepresentable {
    private let url: URL

    init(url: URL) {
        self.url = url
    }

    func makeUIView(context: Context) -> WKWebView {
        let webview = WKWebView()
        let request = URLRequest(url: url)
        webview.load(request)
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Burada güncelleme işlemi yapılabilir ama GIF'ler genellikle güncellenmez
    }
}
