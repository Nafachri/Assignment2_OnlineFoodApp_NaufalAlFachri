//
//  ViewController.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 08/07/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  let orderFoodService = OrderFoodService()
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.register(UINib(nibName: "FoodListTableViewCell", bundle: nil), forCellReuseIdentifier: "food_cell")
    
    orderFoodService.getFoodList {[weak self] result in
      self?.tableView.reloadData()
    }
    
    
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return orderFoodService.listOfFood.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "food_cell", for: indexPath) as! FoodListTableViewCell
    cell.foodNameLabel.text = orderFoodService.listOfFood[indexPath.row].name
    cell.foodDescLabel.text = orderFoodService.listOfFood[indexPath.row].description
    cell.foodPriceLabel.text = "\(formatToIDR(orderFoodService.listOfFood[indexPath.row].price)!) "
    return cell
  }
  
  let cartService = CartService()
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    cartService.addItem(cartItem: CartItem(food: orderFoodService.listOfFood[indexPath.row], amount: 1))
    tableView.deselectRow(at: indexPath, animated: true)
    
  }
  
  func formatToIDR(_ amount: Double) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "id_ID")
    
    return formatter.string(from: NSNumber(value: amount))
  }
  
  
  @IBAction func cartButtonHandler(_ sender: UIButton) {
    let cartDetailView = CartDetailViewController(cartService: cartService)
    self.navigationController?.pushViewController(cartDetailView, animated: true)
  }
  
}

