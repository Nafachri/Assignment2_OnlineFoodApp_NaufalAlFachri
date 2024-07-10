//
//  CartDetailViewController.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 10/07/24.
//

import UIKit

class CartDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
  let cartService: CartService
  init(cartService: CartService) {
    self.cartService = cartService
    super.init(nibName: "CartDetailViewController", bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
      
      tableView.dataSource = self
      tableView.delegate = self
      
      tableView.register(UINib(nibName: "CartDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "cart_cell")
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonHandler))
    
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Checkout", style: .plain, target: self, action: #selector(nextButtonHandler))

    }
  
  @objc func backButtonHandler(){
    self.navigationController?.popViewController(animated: true)
    print("button clicked")
  }
  
  @objc func nextButtonHandler(){
    print("button clicked")
  }

  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cartService.listOfCart.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cart_cell", for: indexPath) as! CartDetailTableViewCell
    let cartItem = cartService.listOfCart[indexPath.row].food
    cell.foodNameLabel.text = cartItem.name
    cell.foodDescription.text = cartItem.description
    cell.foodPriceLabel.text = "\(formatToIDR(cartItem.price)!)"
    cell.amount.text =    "\(cartService.listOfCart[indexPath.row].amount)"
    cell.delegate = self
    cell.indexPath = indexPath
    return cell
  }
  
  func formatToIDR(_ amount: Double) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "id_ID")
    
    return formatter.string(from: NSNumber(value: amount))
  }
}

extension CartDetailViewController: CartDetailTableViewCellDelegate {
  func cartDetailCellMinusClick(_ indexPath: IndexPath) {
    guard cartService.listOfCart.count > indexPath.row else { return }
    var cartItem = cartService.listOfCart[indexPath.row]
    
    if cartItem.amount <= 1 {
      cartService.removeItem(at: indexPath.row)
      tableView.reloadData()
    } else {
      cartItem.amount = cartItem.amount - 1
      cartService.listOfCart[indexPath.row] = cartItem
      tableView.reloadData()
    }
  }
  
  func cartDetailCellPlusClick(_ indexPath: IndexPath) {
//    guard cartService.listOfCart.count < indexPath.row else { return }
//    var amountItem = cartService.listOfCart[indexPath.row].amount
//    amountItem = amountItem + 1
    var cartItem = cartService.listOfCart[indexPath.row]
    
    cartItem.amount = cartItem.amount + 1
    cartService.listOfCart[indexPath.row] = cartItem
    tableView.reloadData()
  }
  
  
}
