//
//  MyStockApp.swift
//  MyStock
//
//  Created by Vaibhav on 05/05/23.
//

import SwiftUI

@main
struct StocksApp: App {
    
    @StateObject var appVM = AppViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                
            MainListView()
            }
            .environmentObject(appVM)
        }
    }
}
