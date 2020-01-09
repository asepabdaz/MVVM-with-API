//
//  MovieViewModel.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 09/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit

protocol MovieViewModelProtocol {
    
    var movieDidChanges: ((Bool, Bool) -> Void)? { get set }
    
    func fetchMovieList()
}

class MovieViewModel: MovieViewModelProtocol {
    var movieDidChanges: ((Bool, Bool) -> Void)?
    
    var movie: [Movie]? {
        didSet{
            self.movieDidChanges!(true, false)
        }
    }
    
    func fetchMovieList() {
        self.movie = [Movie]()
        //TODO: fetch Movie
    }
    
    
}
