//
//  APIService.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 08/07/24.
//

import Foundation
import Alamofire

protocol FoodListServiceable {
  func getFoodList(onComplete: @escaping (Result<FoodListResponse,PCError>) -> Void)
}

class FoodListService: FoodListServiceable {
  
  let requestor: Requestable
  let baseAPI = "http://localhost:3001"
  
  init(requestor: Requestable = NetworkRequest()) {
    self.requestor = requestor
  }
  
  func getFoodList(onComplete: @escaping (Result<FoodListResponse,PCError>) -> Void) {
    requestor.request("\(baseAPI)/food", method: .get, params: [:], onComplete: onComplete)
  }
}


