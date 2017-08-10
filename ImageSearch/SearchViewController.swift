//
//  SearchViewController.swift
//  ImageSearch
//
//  Created by Andrew Ervin Gierke on 8/10/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Outlets 
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - Properties 
    
    var images: [Image] = [] {
        
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    //MARK: - CollectionView Datasource/Delegate 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Keys.colletionViewResultCell, for: indexPath) as? ImageCollectionViewCell else { return ImageCollectionViewCell() }
        
        return cell
        
    }
}
