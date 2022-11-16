//
//  BTCPrice.swift
//  BitcoinPrice
//
//  Created by Umair  on 16/11/2022.
//

/*
 {
     "time": "",
     "disclaimer": "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org",
     "chartName": "Bitcoin",
     "bpi": {
         "USD": {
             "code": "USD",
             "symbol": "&#36;",
             "rate": "16,636.5331",
             "description": "United States Dollar",
             "rate_float": 16636.5331
         },
         "GBP": {
             "code": "GBP",
             "symbol": "&pound;",
             "rate": "13,901.3540",
             "description": "British Pound Sterling",
             "rate_float": 13901.354
         },
         "EUR": {
             "code": "EUR",
             "symbol": "&euro;",
             "rate": "16,206.4122",
             "description": "Euro",
             "rate_float": 16206.4122
         }
     }
 }
 */

import Foundation

struct BTCPrice: Codable {
    let code: String?
    let symbol: String?
    let rate: String?
    let description: String?
    let rate_float: Double?
    
    init(code: String?, symbol: String?, rate: String?, description: String?, rate_float: Double?) {
        self.code = code
        self.symbol = symbol
        self.rate = rate
        self.description = description
        self.rate_float = rate_float
    }
    
    private enum RootKeys: String, CodingKey {
        case bpi
    }
    
    private enum CurrencyKeys: String, CodingKey {
        case USD
    }
    
    private enum CurrencyValueKeys: String, CodingKey {
        case code
        case symbol
        case rate
        case description
        case rate_float
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        let bpiContainer = try container.nestedContainer(keyedBy: CurrencyKeys.self, forKey: .bpi)
        let currencyContainer = try bpiContainer.nestedContainer(keyedBy: CurrencyValueKeys.self, forKey: .USD)
        self.code = try currencyContainer.decodeIfPresent(String.self, forKey: .code)
        self.symbol = try currencyContainer.decodeIfPresent(String.self, forKey: .symbol)
        self.rate = try currencyContainer.decodeIfPresent(String.self, forKey: .rate)
        self.description = try currencyContainer.decodeIfPresent(String.self, forKey: .description)
        self.rate_float = try currencyContainer.decodeIfPresent(Double.self, forKey: .rate_float)
    }
}

extension BTCPrice {
    static var mock: BTCPrice {
        return BTCPrice(code:"EUR", symbol:"&euro;", rate:"16,709.5350", description:"Euro", rate_float:16709.5350)
    }
}
