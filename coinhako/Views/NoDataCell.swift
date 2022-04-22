//
//  NoDataCell.swift
//  coinhako
//
//  Created by Macbook on 22/04/2022.
//

import UIKit

class NoDataCell: UITableViewCell {
    
    @IBOutlet weak var textCenter: UILabel!

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
        self.selectionStyle = .none
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        self.textCenter.alpha = 0.5
    }
    
}
