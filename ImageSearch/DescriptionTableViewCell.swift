//
//  DescriptionTableViewCell.swift
//  ImageSearch
//
//  Created by Andrew Ervin Gierke on 8/10/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    var item: Image? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func updateViews() {
        
        guard let item = item else { return }
        
        descriptionLabel.text = item.description
        
    }
    

}
