//
//  AppURL.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 09/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit
/**
  
 */
struct Domain{
    
    /**
        **urlDomain** adalah url utama yang akan kita gunakan  untuk mengambil data API dari server **THE MOVIE DB**

        ~~~
        URL yang akan kita gunakan adalah
     
        https://api.themoviedb.org/
     
        ~~~
    */
    static let urlDomain = "https://api.themoviedb.org/"

    /**
        variable **imageThumbnail** digunakan untuk mengambil data image pada server.
        Dijadikan terpisah karena untuk pengambilan **asset** berupa image, server menbuat url yang berbeda

        ~~~
        untuk menggunakanya dibutuhkan nama dari image tersebut seperti contoh:
        name Image:
     
        "xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg"

        imageAsset:
     
        let imageThumbnail = "http://image.tmdb.org/t/p/w185/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg"
     
        ~~~
    */
    static let imageThumbnail = "https://image.tmdb.org/t/p/w185/"
    
}
struct APIData {
    static let movies = "3/discover/movie?api_key=dd3c1218e66fe26635068418d849fbb6"
    static let searchQuery = "3/search/multi?api_key=dd3c1218e66fe26635068418d849fbb6&query="
}
extension Domain{
    
    /**
        function yang akan kita gunakan untuk mengambil  **URL** server
     */
    static func baseUrl() -> String {
        return Domain.urlDomain
    }
}

