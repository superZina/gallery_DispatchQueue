//
//  CollectionViewCell.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/17.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func config(indexPath: IndexPath, viewModel: MainViewModel) {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
        
        viewModel.load(indexPath: indexPath) { data in
            if let imageData = data {
                self.photoView.image = UIImage(data: imageData)
            }else {
                self.photoView.image = UIImage(named: Config.defaultImageName)!
            }
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    override func prepareForReuse() {
        
        self.photoView.image = nil
        super.prepareForReuse()
    }
}
