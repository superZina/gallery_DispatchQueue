//
//  MainVIewModel.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/14.
//

import Foundation
//  View가 필요로 하는 데이터만을 소유한다

class MainViewModel {
    
    var storage: [String: Data] = [:]
    private var photoList: [Photo] = []
    private let apiManager: APIManager = APIManager()
    
    func getPhotoList(completion: @escaping (Error?) -> ()) {
        apiManager.getPhotoList { [weak self] (error, list) in
            //TODO: error != nil 일경우 에러메세지 띄워줌
            if list != nil {
                self?.photoList.append(contentsOf: list!)
            }
            completion(error)
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return photoList.count
    }
    
//    func cellForImageDataAt(indexPath: IndexPath, @escaping (Data) -> ()) -> Data? {
//        let photoLodaer = PhotoLoader()
//        let url = photoList[indexPath.item].urls?.raw ?? ""
//
//        let data = photoLodaer.load(url: url, dict: storage) { [weak self] cached, data in
//            // 사진이 캐시되지 않으면 저장소에 저장함.
//            if !cached && data != nil {
//                self?.storage[url] = data
//            }
//        }
//        return data
//    }
    func cellForUrlAt(indexPath: IndexPath) -> String? {
        let urlString = photoList[indexPath.item].urls?.raw
        return urlString
    }
}
