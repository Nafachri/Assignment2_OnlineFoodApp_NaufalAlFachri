//
//  PaymentViewController.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 10/07/24.
//

import UIKit

class PaymentViewController: UIViewController {
  
  @IBOutlet weak var foodItemLabel: UILabel!
  @IBOutlet weak var totalAmountLabel: UILabel!
  let cartService: CartService
  init(cartService: CartService) {
    self.cartService = cartService
    super.init(nibName: "PaymentViewController", bundle: nil)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    override func viewDidLoad() {
        super.viewDidLoad()

      updateTotalPriceLabel()
      updateFoodItemsLabel()
    }
  
  
  func formatToIDR(_ amount: Double) -> String? {
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency
      formatter.locale = Locale(identifier: "id_ID")

      return formatter.string(from: NSNumber(value: amount))
  }
  
  func updateTotalPriceLabel() {
      var overallTotal: Double = 0

      cartService.listOfCart.forEach { cartItem in
          let itemTotal = cartItem.food.price * Double(cartItem.amount)
          overallTotal += itemTotal
      }

      totalAmountLabel.text = formatToIDR(overallTotal)
  }
  
  
  func updateFoodItemsLabel() {
      var itemsText: String = ""

      cartService.listOfCart.forEach { cartItem in
          itemsText += "\(cartItem.food.name) : \(cartItem.amount)\n"
      }

      foodItemLabel.text = itemsText.trimmingCharacters(in: 
          .whitespacesAndNewlines)
  }
  
  @IBAction func payButtonHandler(_ sender: UIButton) {
    HistoryService.shared.addItem(setOfCart: Set(cartService.listOfCart))
    cartService.removeAllItem()
    let historyView = HistoryViewController(nibName: "HistoryViewController", bundle: nil)
    self.navigationController?.pushViewController(historyView, animated: true)
  }
  
}
