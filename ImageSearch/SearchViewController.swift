//
//  SearchViewController.swift
//  ImageSearch
//
//  Created by Andrew Ervin Gierke on 8/10/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CustomSearchControllerDelegate {
    
    //MARK: - Outlets 
    
    @IBOutlet weak var collectionView: UICollectionView!
    var customSearchController: CustomSearchController!
    let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    //MARK: - Properties 
    
    var images: [Image] = [] {
        
        didSet {
            collectionView.reloadData()
        }
    }
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    
    //MARK: - View lifecycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCustomSearchController()
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        flowLayout.itemSize = CGSize(width: screenWidth / 2 - 22, height: screenWidth/2 + 16)
        flowLayout.minimumInteritemSpacing = 16
        flowLayout.minimumLineSpacing = 36
        collectionView!.collectionViewLayout = flowLayout
        
    }
    
    
    //MARK: - CollectionView Datasource/Delegate 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Keys.colletionViewResultCell, for: indexPath) as? ImageCollectionViewCell else { return ImageCollectionViewCell() }
        
        return cell
        
    }
    
    //MARK: - Configure Custom Search 
    
    func configureCustomSearchController() {
        
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRect(x: 0.0, y: 0.0, width: Double(self.view.frame.width), height: 75.0), searchBarFont: UIFont(name: "Helvetica", size: 18.0)!, searchBarTextColor: UIColor.blue, searchBarTintColor: .purple)
        
        customSearchController.customSearchBar.placeholder = "Search for images...                          "
        customSearchController.customSearchDelegate = self
        self.navigationItem.titleView = customSearchController.customSearchBar
        
    }
    
    // Custom Search Delegate Methods 
    
    func didStartSearching() {
        
    }
    
    func didTapOnSearchButton() {
        
    }
    
    func didTapOnCancelButton() {
        
    }
    
    func didChangeSearchText(searchText: String) {
        
    }
}










