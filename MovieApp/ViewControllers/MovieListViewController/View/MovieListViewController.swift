//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//  Copyright (c) 2024 All rights reserved.
//

import UIKit

protocol MovieListViewProtocol: AnyObject {
    var viewModel: MovieListViewModelProtocol { get }
    
    func update(uiModel: MoviesUIModel)
    func printErim(string: String)
}

final class MovieListViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var movieListTableView: UITableView!
    
    // MARK: - Public Properties
    let viewModel: MovieListViewModelProtocol
    
    // MARK: - Private Properties
    private var tableViewDelegate: MovieListTableViewDelegate?
    private var tableViewDataSource: MovieListTableViewDataSource?

    
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
        viewModel.fetchAllMovies()
        configureTableView()
        configureNavigationBar()
    }
}

// MARK: - MovieListViewProtocol

extension MovieListViewController: MovieListViewProtocol {
    func configureNavigationBar() {
        self.title = "Movie List"
    }
    
    func configureTableView() {
        let movieCell = UINib(nibName: MovieListTableViewCell.cellIdentifier, bundle: nil)
        self.movieListTableView.register(movieCell, forCellReuseIdentifier: MovieListTableViewCell.cellIdentifier)
        
        self.tableViewDelegate = MovieListTableViewDelegate()
        self.tableViewDataSource = MovieListTableViewDataSource()
        
        movieListTableView.delegate = self.tableViewDelegate
        movieListTableView.dataSource = self.tableViewDataSource
        
        self.tableViewDelegate?.output = self
    }
    
    func update(uiModel: MoviesUIModel) {
        self.tableViewDataSource?.update(uiModel: uiModel)
        self.movieListTableView.reloadData()
    }
    
    func printErim(string: String) {
        print(string)
    }
}

// MARK: - MovieListTableViewDelegateOutput

extension MovieListViewController: MovieListTableViewDelegateOutput {
    func didSelectRow(indexPath: IndexPath) {
        print("Selected Row: \(indexPath.row)")
    }
}
