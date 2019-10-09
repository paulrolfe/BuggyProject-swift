//
//  ViewController.swift
//  BuggyProject
//
//  Created by Benjamin Wu on 1/6/16.
//  Copyright © 2016 IntrepidPursuits. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var goButton: UIButton!
    @IBOutlet var validImageView: UIView!
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        validImageView.backgroundColor = UIColor.red
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChange(_:)), name: UITextField.textDidChangeNotification , object: self.textField);
    }

    // MARK: Actions
    @IBAction func goButtonTapped() {
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let image):
                self?.imageView.image = image
            default:
                self?.imageView.image = nil
            }
        }
    }

    @IBAction func searchesTapped() {
    }

    // MARK: Helpers

    func navigateToSearches() {
        let search = SearchesViewController(searches: viewModel.searches)
        present(search, animated: true, completion: nil)
    }

    @objc func textFieldDidChange(_ notification: Notification) {
        if viewModel.isValidString(textField.text) {
            validImageView.backgroundColor = UIColor.green

        } else {
            validImageView.backgroundColor = UIColor.red
        }
    }
}

