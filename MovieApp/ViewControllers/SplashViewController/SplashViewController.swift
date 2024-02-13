//
//  SplashViewController.swift
//  MovieApp
//
//  Created by erimsengezer on 13.02.2024.
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [weak self] in
            self?.pushToListViewController()
        })
    }

    private func pushToListViewController() {
        guard let viewController: UIViewController = MovieListBuilder.generate() else { return }
        let navigationController = UINavigationController(rootViewController: viewController)
        
        guard let appDelegate = UIApplication.shared.delegate else { return }
        guard let window: UIWindow = appDelegate.window! else { return }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.activityIndicator.stopAnimating()
    }
}
