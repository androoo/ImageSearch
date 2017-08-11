//
//  FooterTableViewCell.swift
//  ImageSearch
//
//  Created by Andrew Ervin Gierke on 8/10/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class FooterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var usernameIcon: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var clockIcon: UIImageView!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var cameraIcon: UIImageView!
    @IBOutlet weak var cameraLabel: UILabel!
    
    
    //MARK: - Properties
    
    var item: Image? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Methods 
    
    func updateViews() {
        guard let item = item else { return }
        
        usernameLabel.text = item.username
        clockLabel.text = item.date
        cameraLabel.text = item.camera
        usernameLabel.textColor = UIColor.appLightGrey
        clockLabel.textColor = UIColor.appLightGrey
        cameraLabel.textColor = UIColor.appLightGrey
    }

}
