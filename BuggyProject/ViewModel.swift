//
//  ViewModel.swift
//  BuggyProject
//
//  Created by Rolfe, Paul on 10/9/19.
//  Copyright © 2019 IntrepidPursuits. All rights reserved.
//

import Foundation
import UIKit

enum FetchError: Error {
    case unknown
}

class ViewModel {

    var searches: [String] = []
    var string: String?

    func fetchImage(completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let request = imgurURLRequest() else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data,_,_ in
            guard let data = data, let image = UIImage(data: data) else {
                completion(.failure(FetchError.unknown))
                return
            }
            completion(.success(image))
        }
        task.resume()
    }

    func imgurURLRequest() -> URLRequest? {
        // sample: WPOBwNC, u3qrQrH
        let urlBaseString = "http://i.imgur.com/"
        let fileExtension = ".png"

        if let id = string {
            let urlString = urlBaseString + id + fileExtension
            if let url = URL(string: urlString) {
                return URLRequest(url: url)
            }
        }
        return nil
    }

    func isValidString(_ stringToCheck: String?) -> Bool {
        string = stringToCheck
        guard let realString = stringToCheck else { return false }
        let stringLength = realString.count
        return stringLength > 4 && stringLength < 7
    }
}
