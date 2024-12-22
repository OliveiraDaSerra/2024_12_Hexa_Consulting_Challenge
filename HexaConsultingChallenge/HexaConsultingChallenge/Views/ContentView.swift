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
        ZStack {
            switch viewModel.viewState {
            case .loading:
                ProgressView()
            case .success(let products):
                NavigationStack {
                    List {
                        ForEach(products, id: \.id) { product in
                            HStack(
                                alignment: .center,
                                spacing: 20.0
                            ) {
                                NavigationLink {
                                    DetailView(productDetails: product)
                                } label: {
                                    ThumbnailView(
                                        product: product,
                                        thumbnailSize: .init(
                                            width: 44.0,
                                            height: 44.0
                                        )
                                    )
                                    
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
                            .id(product.id)
                        }
                    }
                    .refreshable {
                        viewModel.loadProducts()
                    }
                    .navigationTitle(
                        Text("Products")
                    )
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
    }
}

#Preview {
    ContentView()
}
