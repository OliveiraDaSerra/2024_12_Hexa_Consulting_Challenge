//
//  ContentView.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                switch viewModel.viewState {
                case .loading:
                    ProgressView()
                case .success(let products):
                    List {
                        ForEach(products) { product in
                            HStack(
                                alignment: .center,
                                spacing: 20.0
                            ) {
                                if let thumbnail = product.thumbnail {
                                    AsyncImage(url: URL(string: thumbnail)) { image in
                                        image
                                            .thumbnailStyle()
                                    } placeholder: {
                                        ProgressView()
                                            .frame(
                                                width: 44.0,
                                                height: 44.0
                                            )
                                    }
                                } else {
                                    Image(systemName: "questionmark.app.dashed")
                                        .thumbnailStyle()
                                }
                                
                                VStack(
                                    alignment: .leading,
                                    spacing: 4.0
                                ) {
                                    TitleValue(
                                        title: "Title:",
                                        value: product.title ?? ""
                                    )
                                    
                                    TitleValue(
                                        title: "Rating:",
                                        value: "\(product.rating ?? 0.0)"
                                    )
                                }
                            }
                        }
                    }
                    .refreshable {
                        viewModel.loadProducts()
                    }
                case .failed:
                    Text("Error")
                case .idle:
                    EmptyView()
                }
            }
            .task {
                viewModel.loadProducts()
            }
            .animation(
                .default,
                value: viewModel.viewState
            )
            .navigationTitle(
                Text("Products")
            )
        }
    }
}

#Preview {
    ContentView()
}
