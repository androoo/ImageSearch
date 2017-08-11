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
    
    var page: Int = 1
    var searchTerm: String?
    var shouldShowSearchResult = false 
    var isLoading = false
    
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
        
        let image = images[indexPath.row]
        cell.image = image 
        
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
        guard let keyword = self.searchTerm else { return }
        images = []
        fetch(imagesWithkeyword: keyword)
        if !shouldShowSearchResult {
            shouldShowSearchResult = true
            collectionView.reloadData()
        }
    }
    
    func didTapOnCancelButton() {
        
    }
    
    func didChangeSearchText(searchText: String) {
        self.searchTerm = searchText
    }
    
    
    //MARK: - API Methods 
    
    func fetch(imagesWithkeyword keyword: String) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        ImageContoller.fetchImages(withApiKey: Keys.apiKey, andSearchTerm: keyword, forPage: self.page) { (images) in
            DispatchQueue.main.async {
                
                self.images = images
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.collectionView.reloadData()
                
            }
            self.page += 1
        }
    }
    
    
    //MARK: - Infinite Scroll 
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let searchTerm = searchTerm else { return }
        
        if indexPath.row == self.images.count - 1 && !isLoading {
            
            self.isLoading = true
            
            ImageContoller.fetchImages(withApiKey: Keys.apiKey, andSearchTerm: searchTerm, forPage: page, completion: { (images) in
                
                self.page += 1
                self.isLoading = false
                self.images.append(contentsOf: images)
                
                DispatchQueue.main.async {
                    
                    self.collectionView.reloadData()
                }
            })
        }
    }
    
    //MARK: - Navigation 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Keys.toImageDetailSegue {
            
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first,
                let destinationVC = segue.destination as? ImageDetailViewController else { return }
            
            let image = self.images[indexPath.row]
            destinationVC.image = image
            
        }
    }
    
}










