//
//  HeroTableViewCell.swift
//  ImageSearch
//
//  Created by Andrew Ervin Gierke on 8/10/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
    
    //MARK: - Properties 
    
    var item: Image? {
        didSet {
            updateViews()
        }
    }
    
    
    @IBOutlet weak var heroImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var heroImage: UIImageView!
    
    func updateViews() {
        
        guard let item = item else {
            return
        }
        heroImage.image = item.image
        
    }

}
