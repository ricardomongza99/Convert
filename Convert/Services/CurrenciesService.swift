//
//  CurrenciesService.swift
//  Convert
//
//  Created by Ricardo Montemayor on 13/03/22.
//

import Foundation

final class CurrenciesService {
    static let shared = CurrenciesService()
    
    func fetchCurrencies() async -> [Unit] {
        let url = URL(string: "https://api.frankfurter.app/latest")!
        let urlRequest = URLRequest(url: url)
        print("Fetching currency rates...")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpsResponse = response as? HTTPURLResponse,
                  httpsResponse.statusCode == 200 else {
                      return []
                  }
            let json = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
            var rates = json["rates"] as! [String: Double]
            rates["EUR"] = 1
            var units = [Unit]()
            for (key, value) in rates.sorted(by: { $0.0 < $1.0 }) {
                let unit = UnitCurrency(symbol: key, value: value)
                units.append(Unit(name: "\(CurrencyFlag.dict[key] ?? "") \(key)", unit: unit))
            }
            print("Fetched")
            return units
            
        } catch {
            print("Not fetched")
            return []
        }
    }
}
