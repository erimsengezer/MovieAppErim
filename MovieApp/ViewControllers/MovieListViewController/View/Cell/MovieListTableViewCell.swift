//
//  MovieListTableViewCell.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//

import UIKit

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
    
    func configureCell(itemModel: Movie) {
        self.titleLabel.text = itemModel.original_name
    }
}
