//
//  UIViewController.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 29/10/21.
//

import Foundation
import UIKit
#if DEBUG
import SwiftUI
#endif

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
#if DEBUG
    @available(iOS 13, *)
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }

    @available(iOS 13, *)
    func showPreview() -> some View {
        Preview(viewController: self)
    }
#endif
}
