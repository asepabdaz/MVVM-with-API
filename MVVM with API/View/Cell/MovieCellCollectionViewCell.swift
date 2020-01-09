//
//  MovieCellCollectionViewCell.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 09/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit

class MovieCellCollectionViewCell: UICollectionViewCell {
    static let identifier = "test"
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var MovieactivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var movieImageView: UIImageView!
    
    
    var movieItem: Movie? {
        didSet{
            if let movie = movieItem {
                self.movieImageView.loadFromURL(urlImage: movie.poster_path ?? "", indicator: MovieactivityIndicator)
                self.movieImageView.contentMode = .scaleToFill
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
