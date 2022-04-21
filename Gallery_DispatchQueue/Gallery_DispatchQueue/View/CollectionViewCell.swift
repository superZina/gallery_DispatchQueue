//
//  CollectionViewCell.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/17.
//

import UIKit

var imageCache = [String: UIImage]()


class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoView: CustomImageView!
    private let defaultImage = UIImage(named: Config.defaultImageName)!
    
    func config(indexPath: IndexPath, viewModel: MainViewModel) {
        photoView.image = nil
        photoView.isLoading = true
        
        viewModel.load(indexPath: indexPath) { data in
            self.photoView.setImage(from: data)
            self.photoView.isLoading = false
//            DispatchQueue.main.async {
//                if let imageData = data {
//                    self.photoView.image = UIImage(data: imageData)
//                }else {
//                    self.photoView.image = self.defaultImage
//                }
//            }
        }
    }
}
