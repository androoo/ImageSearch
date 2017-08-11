//
//  ImageController.swift
//  ImageSearch
//
//  Created by Andrew Ervin Gierke on 8/10/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class ImageContoller {

    static func fetchImages(withApiKey apiKey: String, andSearchTerm searchTerm: String, forPage page: Int, completion: @escaping (_ images: [Image]) -> Void) {
        
        // Make sure we have a url and set up parameters for endpoint 
        
        guard let url = Keys.baseURL else { completion([]); return }
        let urlParameters = ["page": "\(page)", "consumer_key": "\(Keys.apiKey)", "term": "\(searchTerm)"]
        
        NetworkController.performRequest(forURL: url, withMethod: .get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            if let error = error {
                NSLog(error.localizedDescription)
            }
            
            // Convert returned data into string
            
            guard let data = data,
                let stringFromData = String(data: data, encoding: .utf8) else {
                    NSLog("Could not get any data")
                    completion([]); return
            }
            
            // Serialize JSON into dictionary
            
            guard let dictionaryFromString = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? JSONDictionary else {
                NSLog("Could not serialse \(stringFromData)")
                completion([]); return
            }
            
            // Convert into results dictionary 
            
            guard let results = dictionaryFromString["photos"] as? [JSONDictionary] else { print("Couldn't get results."); completion([]); return }
            
            var images = [Image]()
            
            let group = DispatchGroup()
            
            // Set Image Object's UIImage
            
            for imageDictionary in results {
                
                group.enter()
                let newImage = Image(dictionary: imageDictionary)
                
                if let newImage = newImage {
                    
                        ImageContoller.getImage(atURL: newImage.imagePath, completion: { (image) in
                            
                            DispatchQueue.main.async {
                                newImage.image = image
                                group.leave()
                            }
                        })
                    images.append(newImage)
                } else {
                    group.leave()
                }
                
            }
            
            group.notify(queue: DispatchQueue.main, execute: {
                
                completion(images)
            })
            
        }
    }
    
    
    //MARK: - Convert ImagePath URL into UIImage 
    
    static func getImage(atURL urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let imageUrl = URL(string: urlString) else { completion(nil); return }
        
        NetworkController.performRequest(forURL: imageUrl, withMethod: .get) { (data, error) in
            
            if let error = error {
                NSLog(error.localizedDescription)
            }
            
            guard let data = data,
                let image = UIImage(data: data) else {
                    completion(nil)
                    return
            }
            DispatchQueue.main.async {
                
                completion(image)
            }
        }
    }
}










