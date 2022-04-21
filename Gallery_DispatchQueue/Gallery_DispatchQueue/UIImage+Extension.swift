//
//  UIImage+Extension.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/21.
//

import Foundation
import UIKit


class CustomImageView: UIImageView {
   
    private var isLoaded: Bool = false
    private let defaultImage = UIImage(named: Config.defaultImageName)!
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        self.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        return indicator
    }()
    
    var isLoading: Bool {
        get { return indicator.isAnimating }
        set {
            if newValue {
                showIndicator()
            } else {
                hideIndicator()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setImage(from data: Data?) {
        DispatchQueue.main.async {
            if let imageData = data {
                self.image = UIImage(data: imageData)
            }else {
                self.image = self.defaultImage
            }
        }
    }
    
    func showIndicator() {
        DispatchQueue.main.async {
            self.indicator.isHidden = true
            self.indicator.startAnimating()
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            self.indicator.isHidden = false
            self.indicator.stopAnimating()
        }
    }
}
