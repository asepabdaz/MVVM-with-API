//
//  DetailMovieViewController.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 10/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRateAndLanguage: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var MovieDescriptionLabel: UILabel!
    @IBOutlet weak var FavoriteButton: UIButton!
    
    var viewModel: DetailMovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitleLabel.text =  viewModel?.titleMovie
        movieRateAndLanguage.text = viewModel?.secondaryTitleMovie
        movieImageView.loadFromURL(urlImage: viewModel!.imageThumbnail, indicator: UIActivityIndicatorView())
        movieImageView.contentMode = .scaleToFill
        MovieDescriptionLabel.text = viewModel?.descpriton
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
