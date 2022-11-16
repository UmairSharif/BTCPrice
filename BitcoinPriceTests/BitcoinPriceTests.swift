//
//  BitcoinPriceTests.swift
//  BitcoinPriceTests
//
//  Created by Umair  on 16/11/2022.
//

import XCTest
@testable import BitcoinPrice

final class BitcoinPriceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessParser() throws {
        let json =  """
                    {
                        "time": {
                            "updated": "Nov 16, 2022 11:47:00 UTC",
                            "updatedISO": "2022-11-16T11:47:00+00:00",
                            "updateduk": "Nov 16, 2022 at 11:47 GMT"
                        },
                        "disclaimer": "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org",
                        "chartName": "Bitcoin",
                        "bpi": {
                            "USD": {
                                "code": "USD",
                                "symbol": "&#36;",
                                "rate": "16,709.5350",
                                "description": "United States Dollar",
                                "rate_float": 16709.535
                            },
                            "GBP": {
                                "code": "GBP",
                                "symbol": "&pound;",
                                "rate": "13,962.3537",
                                "description": "British Pound Sterling",
                                "rate_float": 13962.3537
                            },
                            "EUR": {
                                "code": "EUR",
                                "symbol": "&euro;",
                                "rate": "16,277.5267",
                                "description": "Euro",
                                "rate_float": 16277.5267
                            }
                        }
                    }
                    """.data(using: .utf8)!
        let currencies = try! JSONDecoder().decode(BTCPrice.self, from: json)
        XCTAssertNotNil(currencies)
    }
    
    func testCurrenciesParser() throws {
        let json =  """
                    {
                        "time": {
                            "updated": "Nov 16, 2022 11:47:00 UTC",
                            "updatedISO": "2022-11-16T11:47:00+00:00",
                            "updateduk": "Nov 16, 2022 at 11:47 GMT"
                        },
                        "disclaimer": "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org",
                        "chartName": "Bitcoin",
                        "bpi": {
                            "USD": {
                                "code": "USD",
                                "symbol": "&#36;",
                                "rate": "16,709.5350",
                                "description": "United States Dollar",
                                "rate_float": 16709.535
                            },
                            "GBP": {
                                "code": "GBP",
                                "symbol": "&pound;",
                                "rate": "13,962.3537",
                                "description": "British Pound Sterling",
                                "rate_float": 13962.3537
                            },
                            "EUR": {
                                "code": "EUR",
                                "symbol": "&euro;",
                                "rate": "16,277.5267",
                                "description": "Euro",
                                "rate_float": 16277.5267
                            }
                        }
                    }
                    """.data(using: .utf8)!
        let currencies = try! JSONDecoder().decode(BTCPrice.self, from: json)
        XCTAssertNotNil(currencies)
        XCTAssertEqual(currencies.rate, BTCPrice.mock.rate)
    }
    
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
