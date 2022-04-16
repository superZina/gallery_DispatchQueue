//
//  ViewController.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/14.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    let mainViewModel = MainViewModel()

    //MARK: - IBOutlets
    
//    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("==========APITest===========")
        APIManager().getPhotoList { error, photoList in          
        }
    }
}

//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return mainViewModel.numberOfItemsInSection(section: section)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//}
