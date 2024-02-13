//
//  UIViewController+Extensions.swift
//  MovieApp
//
//  Created by erimsengezer on 13.02.2024.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, preferredStyle: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let action = UIAlertAction(title: title, style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
