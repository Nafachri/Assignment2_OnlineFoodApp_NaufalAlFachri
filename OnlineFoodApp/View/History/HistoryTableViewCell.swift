//
//  HIstoryTableViewCell.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 11/07/24.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

  @IBOutlet weak var foodQuantityLabel: UILabel!
  @IBOutlet weak var foodNameLabel: UILabel!
  @IBOutlet weak var totalPriceLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
