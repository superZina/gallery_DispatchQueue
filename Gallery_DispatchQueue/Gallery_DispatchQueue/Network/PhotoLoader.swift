//
//  PhotoLoader.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/16.
//

import Foundation

// 사진 한장씩 받고, 이미지 로드 후 처리하는 클래스
// 사진 한장 당 클래스 하나
// 1. 이미지 로드 함
// 2. 로드가 끝난다면 딕셔너리에 이미지 저장
// 2개의 디스패치 큐 존재 : 이미지 로드 작업을 하는 디스패치 큐와, 로드작업이 끝난 후 처리 작업을 하는 디스패치 큐
class PhotoLoader {
    let workingQueue: DispatchQueue = DispatchQueue.global()
    let completionQueue: DispatchQueue = DispatchQueue.global()
    
    func loadImage(from url: String, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: url) else {
            completionQueue.async {
                completion(nil)
            }
            return
        }
        
        workingQueue.async { [weak self] in
            let data = try? Data(contentsOf: url)
            
            self?.completionQueue.async {
                completion(data)
            }
        }
    }
}
