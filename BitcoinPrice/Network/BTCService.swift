//
//  BTCService.swift
//  BitcoinPrice
//
//  Created by Umair  on 16/11/2022.
//

import Foundation

enum BTCServiceError: Error {
    case invalidURL
    case missingData
}

protocol BTCServiceable {
    func getBTCPrice() async throws -> BTCPrice
}

struct BTCService: BTCServiceable {
    
    func getBTCPrice() async throws -> BTCPrice {
        guard let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json") else {
            throw BTCServiceError.invalidURL
        }
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(BTCPrice.self, from: data)
        print("response: \(response)")
        return response
    }
}
