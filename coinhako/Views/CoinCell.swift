//
//  CoinCell.swift
//  coinhako
//
//  Created by Macbook on 22/04/2022.
//

import UIKit
import SDWebImage

class CoinCell: UITableViewCell {

    @IBOutlet weak var sellPrice: UILabel!
    @IBOutlet weak var buyPrice: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var counterCurrency: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet var lines: [UIView]!
    
    var coin: DataCoin?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setup() {
        self.selectionStyle = .default
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor.init(named: "Selected")
        self.selectedBackgroundView = selectedView
        self.lines.forEach { $0.alpha = 0.4 }
    }
    
    func setData(obj: DataCoin) {
        self.coin = obj
        self.fullName.text = obj.name
        self.currency.text = obj.base
        self.counterCurrency.text = obj.counter
        self.buyPrice.text = "\(obj.buyPrice)"
        self.sellPrice.text = "\(obj.sellPrice)"
        if let iurl = URL.init(string: obj.icon) {
            self.icon.sd_setImage(with: iurl, placeholderImage: .init(named: "icon-placeholder"), options: [], context: nil)
        }
        
    }
}
