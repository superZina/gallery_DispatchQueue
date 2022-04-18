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
        let urlString = url ?? ""
        viewModel.load(from: urlString, photoLoder: self.photoLoader) { data in
            if let imageData = data {
                self.photoView.image = UIImage(data: imageData)
            }else {
                self.photoView.image = UIImage(named: Config.defaultImageName)!
            }
        }
    }
    
    override func prepareForReuse() {
        
    }
}
