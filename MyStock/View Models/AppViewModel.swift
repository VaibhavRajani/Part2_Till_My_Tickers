//
//  AppViewModel.swift
//  MyStock
//
//  Created by Vaibhav on 05/05/23.
//

import Foundation
import SwiftUI
import XCAStocksAPI

@MainActor
class AppViewModel: ObservableObject {
    @Published var tickers: [Ticker] = []
    var emptyTickersText = "Search & add symbol to see stock quotes"
    @Published var subtitleText: String
    var titleText = "XCA Stocks"
    var attributionText = "Powered by Yahoo! finance API"

    private let subtitleDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "d MMM"
        return df
    }()
    
    init() {
       self.subtitleText = subtitleDateFormatter.string(from: Date())
    }
    
    func removeTickers(atOffsets offsets: IndexSet) {
        tickers.remove(atOffsets: offsets)
    }
    
    func isAddedToMyTickers(ticker: Ticker) -> Bool {
       tickers.first { $0.symbol == ticker.symbol } != nil
   }
   
   func toggleTicker(_ ticker: Ticker) {
       if isAddedToMyTickers(ticker: ticker) {
           removeFromMyTickers(ticker: ticker)
       } else {
           addToMyTickers(ticker: ticker)
       }
   }
   
   private func addToMyTickers(ticker: Ticker) {
       tickers.append(ticker)
   }
   
   private func removeFromMyTickers(ticker: Ticker) {
       guard let index = tickers.firstIndex(where: { $0.symbol == ticker.symbol }) else { return }
       tickers.remove(at: index)
   }
       
    
    func openYahooFinance() {
       let url = URL(string: "https://finance.yahoo.com")!
       guard UIApplication.shared.canOpenURL(url) else { return }
       UIApplication.shared.open(url)
   }
    
}

