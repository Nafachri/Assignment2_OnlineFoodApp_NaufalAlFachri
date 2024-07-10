//
//  CartDetailTableViewCell.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 10/07/24.
//

import UIKit
protocol CartDetailTableViewCellDelegate {
  func cartDetailCellMinusClick(_ indexPath: IndexPath)
  func cartDetailCellPlusClick(_ indexPath: IndexPath)
}
class CartDetailTableViewCell: UITableViewCell {

  @IBOutlet weak var foodNameLabel: UILabel!
  @IBOutlet weak var foodDescription: UILabel!
  @IBOutlet weak var foodPriceLabel: UILabel!
  
  @IBOutlet weak var amount: UILabel!
  
  
  
  

  
  var indexPath: IndexPath!
  var delegate: CartDetailTableViewCellDelegate?
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  
  @IBAction func minusClick() {
    delegate?.cartDetailCellMinusClick(indexPath)
  }
  
  @IBAction func plusClick() {
    delegate?.cartDetailCellPlusClick(indexPath)
  }
    
}
