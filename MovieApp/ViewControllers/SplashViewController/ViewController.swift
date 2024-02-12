//
//  ViewController.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak self] in
            self?.pushToListViewController()
        })
    }

    private func pushToListViewController() {
        guard let viewController: UIViewController = MovieListBuilder.generate() else { return }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: false)
    }

}

