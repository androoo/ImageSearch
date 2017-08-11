//
//  ImageDetailViewController.swift
//  ImageSearch
//
//  Created by Andrew Ervin Gierke on 8/10/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties 
    
    var image: Image? {
        didSet {
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    //MARK: - Outlets 
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    //MARK: - Helper functions 
    
    func updateViews() {
        
        
        
    }
    
    
    //MARK: - Tableview Datasource/Delegate 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.heroTableViewCell, for: indexPath) as? HeroTableViewCell else { return HeroTableViewCell() }
            
            cell.item = self.image
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.descriptionTableViewCell, for: indexPath) as? DescriptionTableViewCell else { return DescriptionTableViewCell() }
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.footerTableViewCell, for: indexPath) as? FooterTableViewCell else { return FooterTableViewCell() }
            
            return cell
            
        default:
            let cell = UITableViewCell()
            cell.separatorInset.left = 900
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return self.view.layer.frame.width
        case 1: return 250
        case 2: return 76
        default: return 200
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
    
    
}








