//
//  FoodListResponse.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 08/07/24.
//

import Foundation

struct FoodListResponse: Responseable {
  
  struct Food: Codable, Hashable {
    let id: String = UUID().uuidString
    let name: String
    let price: Double
    let description: String
  }
    
  let data: [Food]
  let message: String
  let success: Bool
}
