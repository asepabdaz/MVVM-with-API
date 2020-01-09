//
//  MoveAPIService.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 09/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit

class MovieAPIService: NSObject, Requestable {
    
    static let instance = MovieAPIService()
    
    public var movies: [Movie]?
    
    func prepare(callback: @escaping([Movie]?, Bool) -> Void) {
        let filePath = Bundle.main.url(forResource: "movie", withExtension: "json")
        
        let originalContents = try? Data(contentsOf: filePath!)
        let movies = try? JSONDecoder().decode([Movie].self, from: originalContents!)
        
        callback(movies!, false)
    }
    
    func fetchMovies(callBack: @escaping Handler) {
        request(method: .get, url: Domain.baseUrl() + APIData.movies) { (results) in
            
            callBack(results)
        }
    }
}
