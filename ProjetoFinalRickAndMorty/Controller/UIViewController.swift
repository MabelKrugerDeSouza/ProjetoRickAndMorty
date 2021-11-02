//
//  UIViewController.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 29/10/21.
//
import UIKit

extension UIViewController {

    func displayAlert(with title: String, message: String, okText: String = "OK", cancelText: String = "") {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okText, style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))

        if cancelText != "" {
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                self.dismiss(animated: true, completion: nil)
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
}
