//
//  APIManager.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/14.
//

import Foundation

class APIManager {
    
    // 최초에 사진 리스트를 받아오는 함수.
    // 비동기로 작동해야하고
    // 받아온 이후에 컴플리션 핸들러로 사진 배열을 넘겨줘야 한다.
    func getPhotoList(completionHandler: @escaping (Error, [Photo]) -> ()) {
        let url = URL(string: "\(Config.BaseURL)")
        let urlSessionConfig = URLSessionConfiguration.default
        urlSessionConfig.httpAdditionalHeaders = 
        
        
        URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
    }
}
