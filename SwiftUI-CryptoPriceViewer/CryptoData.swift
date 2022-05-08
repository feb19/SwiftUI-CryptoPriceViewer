//
//  CryptoData.swift
//  SwiftUI-CryptoPriceViewer
//
//  Created by Nobuhiro Takahashi on 2022/05/08.
//

import Foundation

/**
 {
 "status":"success",
 "data":{
 "stats":{
 "total":13904,
 "totalCoins":13904,
 "totalMarkets":26630,
 "totalExchanges":179,
 "totalMarketCap":"1670264107452",
 "total24hVolume":"92286031179"
 },
 "coins":[
 {
 "uuid":"Qwsogvtv82FCd",
 "symbol":"BTC",
 "name":"Bitcoin",
 "color":"#f7931A",
 "iconUrl":"https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg",
 "marketCap":"655780256855",
 "price":"34453.30199000262",
 "listedAt":1330214400,
 "tier":1,
 "change":"-3.99",
 "rank":1,
 "sparkline":[],
 "lowVolume":false,
 "coinrankingUrl":"https://coinranking.com/coin/Qwsogvtv82FCd+bitcoin-btc",
 "24hVolume":"25272104288",
 "btcPrice":"1"
 },
 {
 "uuid":"razxDUgYGNAdQ",
 "symbol":"ETH",
 "name":"Ethereum",
 "color":"#3C3C3D",
 "iconUrl":"https://cdn.coinranking.com/rk4RKHOuW/eth.svg",
 "marketCap":"305930877016",
 "price":"2542.7336985903344",
 "listedAt":1438905600,
 "tier":1,
 "change":"-4.95",
 "rank":2,
 "sparkline":[
 "2675.2069252744304000000000",
 "2670.3561203409260000000000",
 "2667.3036581964650000000000",
 "2677.2658803810846000000000",
 "2688.8880969753473000000000",
 "2687.7887479256270000000000",
 "2694.6255427619153000000000",
 "2690.1441813977995000000000",
 "2686.2842194978684000000000",
 "2679.9270112319177000000000",
 "2687.9210731121343000000000",
 "2696.1122429666230000000000",
 "2692.1982687825570000000000",
 "2687.7429512999660000000000",
 "2694.8722239470303000000000",
 "2688.4057291713048000000000",
 "2678.9660520855040000000000",
 "2654.0079376521826000000000",
 "2623.5590076081794000000000",
 "2638.3669801790725000000000",
 "2633.2544143065525000000000",
 "2619.7433496353788000000000",
 "2569.0665611644713000000000",
 "2541.0795941838946000000000",
 "2553.2445646782394000000000",
 "2541.7686338048410000000000",
 "2542.7336985903344000000000"
 ],
 "lowVolume":false,
 "coinrankingUrl":"https://coinranking.com/coin/razxDUgYGNAdQ+ethereum-eth",
 "24hVolume":"15157807720",
 "btcPrice":"0.0738023223239434"
 },
 {
 "uuid":"HIVsRcGKkPFtW",
 "symbol":"USDT",
 "name":"Tether USD",
 "color":"#22a079",
 "iconUrl":"https://cdn.coinranking.com/mgHqwlCLj/usdt.svg",
 "marketCap":"83523058004",
 "price":"1.0036732821822723",
 "listedAt":1420761600,
 "tier":1,
 "change":"0.37",
 "rank":3,
 "sparkline":[
 "1.0000000000000000000000",
 "1.0037683120445708000000",
 "1.0036010800897925000000",
 "1.0037287111157040000000",
 "1.0036258211193363000000",
 "1.0035558425609965000000",
 "1.0034871034410915000000",
 "1.0035449175534434000000",
 "1.0034279085843676000000",
 "1.0035217447119180000000",
 "1.0037277486757243000000",
 "1.0035120209988815000000",
 "1.0034465999217625000000",
 "1.0033404911080872000000",
 "1.0033543389910782000000",
 "1.0032540017066898000000",
 "1.0033634881567743000000",
 "1.0032724169252176000000",
 "1.0034305068724720000000",
 "1.0037741444911440000000",
 "1.0030165140158970000000",
 "1.0029785766422608000000",
 "1.0031509492237018000000",
 "1.0034108896986740000000",
 "1.0037727827494014000000",
 "1.0033308860287027000000",
 "1.0036732821822723000000"
 ],
 "lowVolume":false,
 "coinrankingUrl":"https://coinranking.com/coin/HIVsRcGKkPFtW+tetherusd-usdt",
 "24hVolume":"55818496973",
 "btcPrice":"0.000029131410466071"
 },
 ...
 */

struct CryptoDataContainer: Decodable {
    let status: String
    let data: CryptoData
}

struct CryptoData: Decodable {
    let coins: [Coin]
}

struct Coin: Decodable, Hashable {
    let name: String
    let price: String
    let uuid: String
}
