import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  let historyService = HistoryService.shared
  var cartItems: [CartItem] = []


  override func viewDidLoad() {
        super.viewDidLoad()
    
    
    tableView.dataSource = self
    tableView.delegate = self

    tableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "history_cell")
    


    tableView.reloadData()

    }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return historyService.listOfHistory.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "history_cell", for: indexPath) as? HistoryTableViewCell else {
          return UITableViewCell()
      }
      
      if indexPath.row < historyService.listOfHistory.count {
          let setOfCart = historyService.listOfHistory[indexPath.row]
          let cartItemsArray = Array(setOfCart)
          
          // Clear previous cell content
          cell.foodNameLabel.text = ""
          cell.totalPriceLabel.text = ""
          cell.foodQuantityLabel.text = ""
          
          // Iterate over each cart item in cartItemsArray
          for cartItem in cartItemsArray {
              // Assuming your cell has labels to display cart item properties
            cell.foodNameLabel.text! += "\(cartItem.food.name)\n"
            cell.totalPriceLabel.text! += "\(formatToIDR(cartItem.food.price)!) x \(cartItem.amount) = \(formatToIDR(cartItem.food.price * Double(cartItem.amount))!)\n"
            cell.foodQuantityLabel.text! += "qty: \(cartItem.amount)\n"
          }
      } else {
          print("Index out of range: indexPath.row \(indexPath.row) exceeds listOfHistory count \(historyService.listOfHistory.count)")
      }
      
      return cell
  }
  
  func formatToIDR(_ amount: Double) -> String? {
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency
      formatter.locale = Locale(identifier: "id_ID")

      return formatter.string(from: NSNumber(value: amount))
  }
}
