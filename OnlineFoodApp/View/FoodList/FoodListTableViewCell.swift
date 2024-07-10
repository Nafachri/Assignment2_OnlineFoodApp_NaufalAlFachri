//
//  FoodListTableViewCell.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 09/07/24.
//

import UIKit

class FoodListTableViewCell: UITableViewCell {

  @IBOutlet weak var foodPriceLabel: UILabel!
  @IBOutlet weak var foodDescLabel: UILabel!
  @IBOutlet weak var foodNameLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
