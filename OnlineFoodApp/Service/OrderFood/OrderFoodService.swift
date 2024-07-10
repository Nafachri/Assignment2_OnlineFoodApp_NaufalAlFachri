//
//  OrderFoodService.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 08/07/24.
//

import Foundation

class OrderFoodService {
  var listOfFood:[FoodListResponse.Food] = []
  
  let foodListService: FoodListServiceable
  
  init(foodListService: FoodListServiceable = FoodListService()) {
    self.foodListService = foodListService
  }
  
  func getFoodList(onComplete: @escaping (Result<[FoodListResponse.Food],PCError>) -> Void) {
    foodListService.getFoodList { [weak self] result in
      switch result {
      case .success(let foodList):
        self?.listOfFood = foodList.data
        onComplete(.success(foodList.data))
      case .failure(let error):
        onComplete(.failure(error))
      }
    }
  }
}
