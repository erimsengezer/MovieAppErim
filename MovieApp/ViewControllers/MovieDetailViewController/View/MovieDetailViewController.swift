//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by erimsengezer on 13.02.2024.
//  Copyright (c) 2024 All rights reserved.
//

import UIKit
import Kingfisher

protocol MovieDetailViewProtocol: AnyObject {
    var viewModel: MovieDetailViewModelProtocol { get }
    
    func updateUI(uiModel: MovieDetailUIModel)
    func presentAlert(title: String, message: String, preferredStyle: UIAlertController.Style)
    func showLoading()
    func hideLoading()
}

final class MovieDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    // MARK: - Public Properties
    let viewModel: MovieDetailViewModelProtocol

    // MARK: Constants
    
    // MARK: - Initializers
    init(viewModel: MovieDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: .main)
    }

    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        viewModel.fetchMovieDetail()
    }
}

extension MovieDetailViewController: MovieDetailViewProtocol {
    func updateUI(uiModel: MovieDetailUIModel) {
        configureNavigationBar(title: uiModel.originalName)
        let path = uiModel.posterPath
        let urlString = "https://image.tmdb.org/t/p/w500\(path)"
        if let url = URL(string: urlString) {
            movieImageView.kf.setImage(with: url,
                                             placeholder: nil,
                                             options: nil,
                                             completionHandler: nil)
        }
        movieTitleLabel.text = uiModel.originalName
        overviewTextView.text = "\(uiModel.overview)"
    }
    
    private func configureNavigationBar(title: String) {
        self.title = title
    }
    
    func showLoading() {
        self.showSpinner()
    }
    
    func hideLoading() {
        self.removeSpinner()
    }
    
    func presentAlert(title: String, message: String, preferredStyle: UIAlertController.Style) {
        self.showAlert(title: title, message: message, preferredStyle: preferredStyle)
    }
}
