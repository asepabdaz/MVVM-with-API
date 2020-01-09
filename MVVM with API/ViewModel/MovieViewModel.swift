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
            self.movieDidChanges?(true, false)
        }
    }
    
    func fetchMovieList() {
        self.movie = [Movie]()
        //MARK: fetch Movie
        
        MovieAPIService.instance.fetchMovies { result in
            
            switch result{
        
            case .success(let data):
                let mappedModel = try? JSONDecoder().decode(MovieResponseModel.self, from: data!) as MovieResponseModel
                
                self.movie = mappedModel?.movie ?? []
                
                break
            case .failure(let error):
                print(error.description)
            }
        }
    }
    
    
}
