//
//  BTCPriceViewModel.swift
//  BitcoinPrice
//
//  Created by Umair  on 16/11/2022.
//

import Foundation

@MainActor
class BTCPriceViewModel: ObservableObject {
    
    @Published var data: BTCPrice?
    @Published var isLoading = false
    
    let service: BTCServiceable
    
    init(service: BTCServiceable) {
        self.service = service
    }
    
    func fetchBTCPrice() async {
        Task(priority: .background) {
            isLoading = true
            do {
                let price = try await service.getBTCPrice()
                data = price
                isLoading = false
                print("price fetched")
            } catch {
                print("Request failed with error: \(error)")
                isLoading = false
            }
        }
    }
    
    var getPrice: String {
        if let value = data?.rate {
            return "$\(value)"
        }
        return ""
    }
}

