//
//  MovieListTableViewDataSource.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//

import UIKit

class MovieListTableViewDataSource: NSObject {
    private var uiModel: MoviesUIModel?
    
    func update(uiModel: MoviesUIModel) {
        self.uiModel = uiModel
    }
}

extension MovieListTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiModel?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.cellIdentifier, for: indexPath) as? MovieListTableViewCell,
              let itemModel = uiModel?.getItemModel(indexPath: indexPath) else { return UITableViewCell() }
        cell.configureCell(itemModel: itemModel)
        
        return cell
    }
}
