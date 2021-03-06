//
//  MainVIewModel.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/14.
//

import Foundation
import UIKit
//  View가 필요로 하는 데이터만을 소유한다

class MainViewModel {
    //스크롤할때 버벅거림
    //어디가 느려지는지 확인해보기
    
    private var storage: [String: Data] = [:]
    private var photoList: [Photo] = []
    private var loaderList: [PhotoLoader] = []
    private let apiManager: APIManager = APIManager()
    private let completionQueue = DispatchQueue.main
    
    func getPhotoList(completion: @escaping (Error?) -> ()) {
        apiManager.getPhotoList { [weak self] (error, list) in
            //TODO: error != nil 일경우 에러메세지 띄워줌
            if list != nil {
                self?.loaderList.append(contentsOf: Array<PhotoLoader>(repeating: PhotoLoader(), count: list!.count))
                self?.loaderList.append(contentsOf: Array<PhotoLoader>(repeating: PhotoLoader(), count: list!.count))
                self?.photoList.append(contentsOf: list!)
                self?.photoList.append(contentsOf: list!)
            }
            completion(error)
        }
    }
    
    // cell 에서 이미지 로드하는 함수.
    // storage에 데이터가 없다면 캐싱 후 completion 수행
    func load(indexPath: IndexPath, completion: @escaping (Data?) -> ()) {
        let url = photoList[indexPath.item].urls?.thumb ?? ""
        let photoLoader = loaderList[indexPath.item]
        
        photoLoader.load(url: url, dict: storage) { loaded, data in
            if !loaded && data != nil { self.storage[url] = data }
            
            self.completionQueue.async {
                completion(data)
            }
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return photoList.count
    }
    
    func urlStringAt(indexPath: IndexPath) -> String {
        return photoList[indexPath.item].urls?.thumb ?? ""
    }
}
