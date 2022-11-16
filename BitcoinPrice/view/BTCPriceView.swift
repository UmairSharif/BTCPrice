//
//  BTCPriceView.swift
//  BitcoinPrice
//
//  Created by Umair  on 16/11/2022.
//

import SwiftUI

struct BTCPriceView: View {
    
    @ObservedObject var viewModel: BTCPriceViewModel
    
    init(viewModel: BTCPriceViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack (alignment: .center) {
            Spacer()
            VStack(alignment: .center, spacing: 23.0) {
                Image("title-image")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Text("Hey there! The current price of bitcoin is below")
                    .font(Font.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            Text("Price")
                .font(Font.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(.black)
            if viewModel.isLoading {
                Text("Loading...")
                    .font(Font.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            } else {
                Text(viewModel.getPrice)
                    .font(Font.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Button {
                Task {
                    await self.viewModel.fetchBTCPrice()
                }
            } label: {
                Text("Refresh Price")
                    .font(Font.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width - 60, height: 49, alignment: .center)
            .disabled(viewModel.isLoading)
            .background(
                Capsule()
                    .fill(viewModel.isLoading ? Color("primary-color").opacity(0.20) :  Color("primary-color"))
                            .shadow(color: .gray, radius: 1, x: 1, y: 1)
                )
            
            Spacer()
        }
        .task {
            await self.viewModel.fetchBTCPrice()
        }
        .padding(.horizontal, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("app-bg"))
    }
}

struct BTCPriceView_Previews: PreviewProvider {
    static var previews: some View {
        BTCPriceView(viewModel: BTCPriceViewModel(service: BTCService()))
    }
}
