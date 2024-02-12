//
//  MovieListTableViewCell.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//

import UIKit
import Kingfisher

class MovieListTableViewCell: UITableViewCell {
   
    // MARK: - Constants
    static let cellIdentifier = "MovieListTableViewCell"
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(itemModel: MovieItemModel) {
        titleLabel.text = itemModel.originalName
        
        if let path = itemModel.backdropPath {
            let urlString = "https://image.tmdb.org/t/p/w500\(path)"
            if let url = URL(string: urlString) {
                movieImageView.kf.setImage(with: url,
                                                 placeholder: nil,
                                                 options: nil,
                                                 completionHandler: nil)
            }
        }
    }
}
