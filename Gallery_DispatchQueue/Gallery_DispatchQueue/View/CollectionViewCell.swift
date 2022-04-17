//
//  CollectionViewCell.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/17.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    let photoLoader: PhotoLoader = PhotoLoader()
    
    func config(url: String?, viewModel: MainViewModel) {
        photoLoader.load(url: url ?? "", dict: viewModel.storage) { loaded, data in
            if !loaded { viewModel.storage[url ?? "" ] = data }
            if let imageData = data {
                self.photoView.image = UIImage(data: imageData)
            }else {
                self.photoView.image = UIImage(named: Config.defaultImageName)!
            }
        }
    }
}
