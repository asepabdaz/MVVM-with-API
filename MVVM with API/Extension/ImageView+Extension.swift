//
//  ImageView+Extension.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 10/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit


//let imageCache = NSCache<AnyObject, AnyObject>()

enum ImageSize {
    case original
    case thumbnail
}

extension UIImageView{
    //load image async from inaternet
    func loadFromURL(urlImage :String, indicator: UIActivityIndicatorView){
        
        let urlwithPercent = urlImage.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        
        let urlRequest = URLRequest(url: URL(string: Domain.imageThumbnail + urlwithPercent!)!)
        URLSession.shared.dataTask(with: urlRequest) {data, _, _ in
            if data != nil {
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    if imageToCache != nil {
                        self.image = imageToCache
                    }
                    indicator.stopAnimating()
                    indicator.isHidden = true
                }
            }
        }.resume()
        
    }
    
}
