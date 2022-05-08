//
//  CryptoService.swift
//  SwiftUI-CryptoPriceViewer
//
//  Created by Nobuhiro Takahashi on 2022/05/08.
//

import Combine
import Foundation

// https://developers.coinranking.com/api/documentation/coins#get-coins

final class CryptoService {
    var components: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coinranking.com"
        components.path = "/v2/coins"
        components.queryItems = [
            URLQueryItem(name: "base", value: "JPY"),
            URLQueryItem(name: "timePeriod", value: "24h")
        ]
        return components
    }
    
    func fetchCoins() -> AnyPublisher<CryptoDataContainer, Error> {
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .map { $0.data }
            .decode(type: CryptoDataContainer.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
