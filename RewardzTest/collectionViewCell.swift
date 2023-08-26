//
//  collectionViewCell.swift
//  RewardzTest
//
//  Created by madhuri alshi on 25/08/23.
//

import Foundation
import UIKit
class collectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

class CategoryCollectionViewCell :UICollectionViewCell{
    @IBOutlet weak var filterLabel: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
