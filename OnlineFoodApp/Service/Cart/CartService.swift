//
//  CartService.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 08/07/24.
//

import Foundation

class CartService {
  private var _listOfCart = Set<CartItem>() {
    didSet {
      listOfCart = Array(_listOfCart)
    }
  }
  
  var listOfCart: [CartItem] = []
  
  func addItem(cartItem: CartItem) {
    _listOfCart.insert(cartItem)
  }
  
  func removeItem(at index: Int){
      let item = listOfCart[index]
    _listOfCart.remove(item)
  }
  
  func removeAllItem(){
    _listOfCart.removeAll()
  }
}
