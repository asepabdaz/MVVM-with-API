//
//  MovieViewController.swift
//  MVVM with API
//
//  Created by Asep Abdaz on 09/01/20.
//  Copyright © 2020 Asep Abdaz. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    weak var coordinator2: FavoriteCoordinator?
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    let viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        regiester()
        prepareViewModelObserver()
        
    }
    
    // MARK: - Observer collectionView
    
    func regiester() {
        self.movieCollectionView.delegate = self
        self.movieCollectionView.dataSource = self
        self.movieCollectionView.register(UINib(nibName: "\(MovieCellCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "MovieViewCell")
    }
}

extension MovieViewController {
    
    func fetcMovieList() {
        viewModel.fetchMovieList()
    }
    
    func prepareViewModelObserver() {
        self.viewModel.movieDidChanges = { (finish, error) in
            if !error {
                self.reloadTableView()
            }
        }
    }
    func reloadTableView() {
        self.movieCollectionView.reloadData()
    }
}
extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movie?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieViewCell", for: indexPath) as? MovieCellCollectionViewCell {
            let movie = viewModel.movie![indexPath.row]
            cell.movieItem = movie
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let coordinator = coordinator {
            let movie = viewModel.movie![indexPath.row]
            let model = ModelDetailMovie(titleMovie: movie.title!, rateMovie: movie.vote_average!, languageMovie: movie.original_language!.uppercased(), imageTumbnailMovie: movie.poster_path!, buttonStatusMovie: true, descpritionMovie: movie.overview!)
            let viewModel = DetailMovieViewModel(movieModel: model)
            //General list movie
            coordinator.detailCollectionView(model: viewModel)
            
        }else if coordinator2 != nil{
            
        }
    }
    
}
extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  5
        return CGSize(width: collectionView.frame.size.width/2 - padding, height: collectionView.frame.size.height/2)
    }
}

