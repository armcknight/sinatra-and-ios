//
//  ViewController.swift
//  sinatra-and-ios
//
//  Created by Andrew McKnight on 9/25/18.
//  Copyright © 2018 Two Ring Software. All rights reserved.
//

import Keys
import UIKit

class ViewController: UIViewController {
    private let session = URLSession(configuration: .default)
    private let label = UILabel(frame: .zero)
    private let activityIndicator = UIActivityIndicatorView(style: .gray)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        view.addSubview(activityIndicator)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        [label, activityIndicator].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        }
        
        let url = URL(string: SinatraAndIosKeys().endpoint)!
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                
                if let error = error {
                    self.label.text = String(describing: error)
                    return
                }
                
                guard let data = data else {
                    self.label.text = "no data in response"
                    return
                }
                
                do {
                    let sushi = try JSONDecoder().decode(Sushi.self, from: data)
                    self.label.text = sushi.types.joined(separator: "\n")
                } catch {
                    self.label.text = "unable to decode response due to error: \(String(describing: error))"
                }
            }
        }
        task.resume()
    }
}

