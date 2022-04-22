//
//  coinhakoTests.swift
//  coinhakoTests
//
//  Created by Macbook on 19/04/2022.
//

import XCTest
@testable import coinhako

class coinhakoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        guard let path = Bundle.main.path(forResource: "coins-test", ofType: "json") else {
            return
        }
        guard let idata = try? Data(contentsOf: .init(fileURLWithPath: path)) else {
            return
        }
        do {
            let tt = try Parser.json(fromData: idata, toType: ListCoinResponse.self)
            XCTAssertNotNil(tt)
            print("\(tt)")
        } catch {
            print(error)
        }
        
    }
    
    func testInvalidJson() {
        let str = """
{
    "data": [
        {
            "base": "LTC",
            "counter": "USD",
            "buy_price": "107.437",
            "sell_price": "106.896",
            "icon": "https://cdn.coinhako.com/assets/wallet-ltc-e4ce25a8fb34c45d40165b6f4eecfbca2729c40c20611acd45ea0dc3ab50f8a6.png",
            "name": "Litecoin"
        },
"""
        guard let data = str.data(using: .utf8) else {
            return
        }
        var obj: ListCoinResponse?
        do {
            obj = try Parser.json(fromData: data, toType: ListCoinResponse.self)
        } catch {
            print(error)
        }
        XCTAssertNil(obj)
    }
    
    func testCoinsEmpty() {
        let str = """
        {
            "data": []
        }
"""
        guard let data = str.data(using: .utf8) else {
            return
        }
        var obj: ListCoinResponse?
        do {
            obj = try Parser.json(fromData: data, toType: ListCoinResponse.self)
        } catch {
            print(error)
        }
        if let iobj = obj {
            XCTAssertTrue(iobj.data.isEmpty, "Expected: coins is empty")
        } else {
            XCTAssertNotNil(obj)
        }
        
    }
    
    func testJsonFieldMissing() {
        let str = """
        {
           success: false,
            message: "Something went wrong!"
        }
"""
        guard let data = str.data(using: .utf8) else {
            return
        }
        var obj: ListCoinResponse?
        do {
            obj = try Parser.json(fromData: data, toType: ListCoinResponse.self)
        } catch {
            print(error)
        }
        if let coins = obj?.data {
            XCTAssertTrue(coins.isEmpty, "Expected: coins is empty")
        } else {
            XCTAssertNil(obj)
        }
    }
    
    func testMockupData() {
        let network = MockupServiceAPI.init()
        let service = CoinServices.init(service: network)
        let vm = CoinViewModel.init(coinService: service)
        vm.getCoins(counterCurrency: "USD")
        vm.coinDidUpdate = {
            XCTAssertTrue(vm.countCoin != 0, "Expected: Coins is not empty")
            let obj = vm.getCoin(index: 0)
            XCTAssertNotNil(obj)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
