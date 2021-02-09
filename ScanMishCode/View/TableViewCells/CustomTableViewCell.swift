//
//  CustomTableViewCell.swift
//  ScanMishCode
//
//  Created by JJ on 08/02/21.
//  Copyright © 2021 John. All rights reserved.
//


import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(info: Cart) {
        productNameLbl.text = info.productName
        //productImageView.image = UIImage(named: info.optionsImage)
        
    }

}
