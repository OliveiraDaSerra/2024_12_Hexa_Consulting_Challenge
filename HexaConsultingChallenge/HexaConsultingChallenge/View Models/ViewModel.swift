//
//  ViewModel.swift
//  HexaConsultingChallenge
//
//  Created by Nuno Oliveira on 22/12/2024.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published private(set) var viewState: ViewState<[ProductModel]> = .idle
    private var productsDataService = ProductsDataService()
    
    func loadProducts() {
        Task {
            await MainActor.run {
                viewState = .loading
            }
            do {
                try productsDataService.fetchProducts {
                    self.viewState = .success(self.productsDataService.products)
                }
            } catch {
                await MainActor.run {
                    viewState = .failed(error)
                }
            }
        }
    }
}
