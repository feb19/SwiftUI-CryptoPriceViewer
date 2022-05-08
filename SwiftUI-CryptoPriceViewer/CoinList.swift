//
//  CoinList.swift
//  SwiftUI-CryptoPriceViewer
//
//  Created by Nobuhiro Takahashi on 2022/05/08.
//

import SwiftUI
import Combine

struct CoinList: View {
    @ObservedObject private var viewModel = CoinListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.coinViewModels, id: \.uuid) { coinViewModel in
                Text(coinViewModel.displayText)
            }
            .onAppear {
                self.viewModel.fetchCoins()
            }
            .navigationBarTitle("Coins")
        }
    }
}

struct CoinList_Previews: PreviewProvider {
    static var previews: some View {
        CoinList()
    }
}

class CoinListViewModel: ObservableObject {
    private let cryptoService = CryptoService()
    @Published var coinViewModels = [CoinViewModel]()

    var cancellable: AnyCancellable?

    func fetchCoins() {
        cancellable = cryptoService.fetchCoins().sink(receiveCompletion: { _ in

        }, receiveValue: { container in
            self.coinViewModels = container.data.coins.map({ CoinViewModel(coin: $0) })
            print(self.coinViewModels)
        })
    }
}

struct CoinViewModel: Hashable {
    private let coin: Coin

    var name: String {
        return coin.name
    }

    var uuid: String {
        return coin.uuid
    }

    var formattedPrice: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "ja_JP")
        numberFormatter.currencyCode = "JPY"
        guard let price = Double(coin.price),
              let formattedPrice = numberFormatter.string(from: NSNumber(value: price))
        else { return "" }
        return formattedPrice
    }

    var displayText: String {
        return "\(name) - \(formattedPrice)"
    }

    init(coin: Coin) {
        self.coin = coin
    }
}
