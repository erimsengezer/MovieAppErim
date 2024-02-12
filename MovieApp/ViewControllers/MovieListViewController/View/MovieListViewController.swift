//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//  Copyright (c) 2024 AITales IOS Development Team. All rights reserved
//

import UIKit

protocol MovieListViewProtocol: AnyObject {
    var viewModel: MovieListViewModelProtocol { get }
}

final class MovieListViewController: UIViewController {

    // MARK: - IBOutlets
    
    // MARK: - Public Properties
    let viewModel: MovieListViewModelProtocol

    // MARK: Constants
    
    // MARK: - Initializers
    init(viewModel: MovieListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: .main)
    }

    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MovieListViewController: MovieListViewProtocol {
    
}
