//
//  CoinViewModel.swift
//  coinhako
//
//  Created by Macbook on 21/04/2022.
//

import Foundation
import Alamofire
import UIKit

class CoinViewModel {
    
    var coinDidUpdate: (() -> Void)?
    
    private let coinService: CoinServices
    private let looper: PriceRealTime
    
    private let getCoinQueue: OperationQueue
    private let semaphore: DispatchSemaphore

    private var coins = [DataCoin]()
    
    var countCoin: Int {
        return coins.count
    }
    
    init(coinService: CoinServices) {
        self.coinService = coinService
    
        self.getCoinQueue = OperationQueue()
        self.getCoinQueue.maxConcurrentOperationCount = 1
        self.semaphore = DispatchSemaphore(value: 0)
        
        self.looper = PriceRealTime()
        self.looper.start { [weak self] in
            guard let _ = self else {
                return
            }
            self?.getCoins(counterCurrency: "USD")
        }
   
    }
    
    func getCoins(counterCurrency: String) {
        self.getCoinQueue.addOperation { [weak self] in
            guard let self = self else {
                return
            }
            self.coinService.getCoins(counterCurrency: counterCurrency) { [weak self] response, error, success in
                if let ierror = error {
                    print(ierror.localizedDescription)
                    return
                }
                if let listCoin = response?.data {
                    self?.coins = listCoin
                    DispatchQueue.main.async {
                        self?.coinDidUpdate?()
                    }
                }
                self?.semaphore.signal()
            }
            self.semaphore.wait()
        }
        
    }
    
    
    
    //MARK: - Public Actions
    func getCoin(index: Int) -> DataCoin? {
        if self.coins.isEmpty == true {
            return nil
        }
        return self.coins[index]
    }

    func refreshCoin() {
        self.getCoins(counterCurrency: "USD")
    }
    
    
    
}
