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
    
    func loadProducts() async {
        do {
            viewState = .loading
            try productsDataService.fetchProducts {
                self.viewState = .success(self.productsDataService.products)
            }
        } catch {
            viewState = .failed(error)
        }
    }
    
    func loadproductsv2() {
        Task {
            await MainActor.run {
                debugPrint(">>> Request is LOADING")
                viewState = .loading
            }
            do {
                try productsDataService.fetchProducts {
                    debugPrint(">>> Request retrieved data successfully from API (Count: \(self.productsDataService.products.count))")
                    self.viewState = .success(self.productsDataService.products)
                }
            } catch {
                await MainActor.run {
                    debugPrint(">>> Request failed to retrieve data from API (error: \(error))")
                    viewState = .failed(error)
                }
            }
        }
    }
}
