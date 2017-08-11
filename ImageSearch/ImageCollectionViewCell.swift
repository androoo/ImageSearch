//
//  ImageCollectionViewCell.swift
//  ImageSearch
//
//  Created by Andrew Ervin Gierke on 8/10/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties 
    
    var image: Image? {
        didSet {
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    //MARK: - Outlets 
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var imageDescriptionLabel: UILabel!

    
    func updateViews() {
        cellImageView.image = image?.image
        imageDescriptionLabel.text = image?.description
        cellImageView.layer.cornerRadius = 4
        cellImageView.layer.masksToBounds = true
        imageDescriptionLabel.textColor = .appDarkGrey
    }
    
}
