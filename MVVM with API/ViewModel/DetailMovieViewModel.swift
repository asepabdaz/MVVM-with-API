//
//  DetailMovieViewModel.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 10/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit

class DetailMovieViewModel {
    private let movieModel: ModelDetailMovie
    
    init(movieModel: ModelDetailMovie) {
        self.movieModel = movieModel
    }
    
    public var titleMovie: String {
        return movieModel.title
    }
    
    public var secondaryTitleMovie: String {
        return "\(movieModel.rate)\n\(movieModel.language)"
    }
    
    public var imageThumbnail: String {
//        let image = UIImage().getImageData(urlImage: movieModel.imageTumbnail)
        return movieModel.imageTumbnail
    }
    
    public var descpriton: String {
        return movieModel.description
    }
}
