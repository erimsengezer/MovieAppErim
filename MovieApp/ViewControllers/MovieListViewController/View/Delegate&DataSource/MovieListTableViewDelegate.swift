//
//  MovieListTableViewDelegate.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//

import UIKit

protocol MovieListTableViewDelegateOutput: AnyObject {
    func didSelectRow(indexPath: IndexPath)
}

class MovieListTableViewDelegate: NSObject {
    weak var output: MovieListTableViewDelegateOutput?
}

extension MovieListTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.didSelectRow(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
