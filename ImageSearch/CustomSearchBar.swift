//
//  CustomSearchBar.swift
//  ImageSearch
//
//  Created by Andrew Ervin Gierke on 8/10/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    //MARK: - Properties

    var preferredFont: UIFont!
    var preferredTextColor: UIColor!
    
    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        
        super.init(frame: frame)
        self.frame = frame
        preferredTextColor = textColor
        preferredFont = font
        searchBarStyle = UISearchBarStyle.default
        isTranslucent = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // This is super hacky and I would never ship this. The correct way to implement a custom search would be to actually build the whole thing, which is how I would do it with enough time.
    
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0] as UIView
        
        for i in 0 ..< searchBarView.subviews.count {
            if searchBarView.subviews[i].isKind(of: UITextField.self) {
                index = i
            }
        }
        return index
    }
    
    override func draw(_ rect: CGRect) {
        
        if let index = indexOfSearchFieldInSubviews() {
            let searchField: UITextField = (subviews[0]).subviews[index] as! UITextField
            
            var bounds: CGRect
            bounds = searchField.frame
            bounds.size.height = 35 //(set height to whatever)
            searchField.bounds = bounds
            searchField.borderStyle = UITextBorderStyle.roundedRect
            searchField.backgroundColor = UIColor.clear
            searchField.layer.cornerRadius = frame.size.height / 2 - 4.0
            searchField.layer.masksToBounds = true
            searchField.frame = CGRect(x: 0.0, y: frame.size.height / 2 - 20.0, width: frame.size.width - 86.0, height: 36.0)
            
            searchField.font = preferredFont
            searchField.textColor = preferredTextColor
            searchField.leftView = nil
            searchField.rightView = nil
            searchField.clearButtonMode = .never
            
            searchField.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
            
            searchField.backgroundColor = UIColor.clear
            
        }
        super.draw(rect)
    }

}













