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
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
     
        mainViewModel.getPhotoList { error in
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainViewModel.numberOfItemsInSection(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        let url = mainViewModel.cellForUrlAt(indexPath: indexPath)
        cell.config(url: url, viewModel: self.mainViewModel)
        return cell
    }
}
