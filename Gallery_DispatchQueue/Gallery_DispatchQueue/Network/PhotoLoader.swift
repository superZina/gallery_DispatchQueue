//
//  PhotoLoader.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/16.
//

import Foundation
import UIKit

// 사진 한장씩 받고, 이미지 로드 후 처리하는 클래스
// 사진 한장 당 클래스 하나
// 1. 이미지 로드 함
// 2. 로드가 끝난다면 딕셔너리에 이미지 저장
// 2개의 디스패치 큐 존재 : 이미지 로드 작업을 하는 디스패치 큐와, 로드작업이 끝난 후 처리 작업을 하는 디스패치 큐
class PhotoLoader {
    let workingQueue: DispatchQueue = DispatchQueue.global()
    
    // Data를 로드하는 함수
    func load(url: String, dict: [String: Data], completion: @escaping (Bool, Data?) -> ()) {
        // 이미지가 캐싱 되어있는지 확인
        let loaded = containImageData(url: url , in: dict)
        
        //이미 캐싱 되어있다면
        if loaded {
            completion(loaded, dict[url])
        } else {
            loadData(from: url) { data in
                completion(loaded, data)
            }
        }
    }
    
    // url로 이미지가 있는지 없는지 확인
    // 있다면 true 반환 없다면 캐싱해서 저장하기
    func containImageData(url: String, in dict: [String: Data]) -> Bool {
        return dict.contains(where: { $0.key == url })
    }
    
    // 이미지 로드하는 함수
    func loadData(from url: String, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        workingQueue.async {
            URLSession.shared.dataTask(with: url) { data, response, error in
                completion(data)
            }.resume()
        }
    }
}
