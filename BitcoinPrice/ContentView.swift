//
//  ContentView.swift
//  BitcoinPrice
//
//  Created by Umair  on 16/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            BTCPriceView(viewModel: BTCPriceViewModel(service: BTCService()))
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
