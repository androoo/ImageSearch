//
//  Keys.swift
//  ImageSearch
//
//  Created by Andrew Ervin Gierke on 8/10/17.
//  Copyright © 2017 And. All rights reserved.
//

import Foundation

struct Keys {

    //MARK: - API Keys 
    
    static let apiKey = "v8bSCng1eLEtZ3JZZAdCMURq4BuHLT708HuocfWZ"
    static let baseURL = URL(string: "https://api.500px.com/v1/photos/search")
    
    //MARK: - Dictionary Keys 
    
    static let nameKey = "name"
    static let descriptionKey = "description"
    static let cameraKey = "camera"
    static let dateKey = "created_at"
    static let imageKey = "image_url"
    static let userInfoKey = "user"
    static let usernameKey = "username"
    
    //MARK: - Storyboard Keys 
    
    static let colletionViewResultCell = "resultCell"
    static let toImageDetailSegue = "toImageDetail"
    static let heroTableViewCell = "heroCell"
    static let descriptionTableViewCell = "descriptionCell"
    static let footerTableViewCell = "footerCell"
    
}

typealias JSONDictionary = [String: Any]
