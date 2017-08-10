//
//  Image.swift
//  ImageSearch
//
//  Created by Andrew Ervin Gierke on 8/10/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class Image {
    var name: String
    var description: String
    var camera: String
    var date: String
    var username: String
    var imagePath: String
    var image: UIImage?
    
    init(name: String, description: String, camera: String, date: String, username: String, imagePath: String) {
        self.name = name
        self.description = description
        self.camera = camera
        self.date = date
        self.camera = camera
        self.username = username
        self.imagePath = imagePath
    }
}

extension Image {
    convenience init?(dictionary: JSONDictionary) {
        guard let name = dictionary[Keys.nameKey] as? String,
            let description = dictionary[Keys.descriptionKey] as? String,
            let camera = dictionary[Keys.cameraKey] as? String,
            let date = dictionary[Keys.dateKey] as? String,
            let imagePath = dictionary[Keys.imageKey] as? String,
            let userDict = dictionary[Keys.userInfoKey] as? [String: Any],
            let username = userDict[Keys.usernameKey] as? String else { return nil }
        
        self.init(name: name, description: description, camera: camera, date: date, username: username, imagePath: imagePath)
    }
}
