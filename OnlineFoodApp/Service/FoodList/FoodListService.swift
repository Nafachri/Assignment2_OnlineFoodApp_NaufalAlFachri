//
//  APIService.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 08/07/24.
//

import Foundation
import Alamofire

class FoodListService {
  
  func getFood(completion: @escaping (Result) -> Void) {
      AF.request("http://localhost:3002/menu/", method: .get, encoding: URLEncoding.default).responseData { response in
        switch response.result {
        case .success(let data):
          let decoder = JSONDecoder()
          do {
            let response = try decoder.decode(MenuResponse.self, from: data)
            completion(.success(response.data))
          } catch {
            completion(.failure(error))
          }

        case .failure(let error):
          completion(.failure(error))
        }
      }
    }
}


