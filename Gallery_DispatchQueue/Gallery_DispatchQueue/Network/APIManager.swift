//
//  APIManager.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/14.
//

import Foundation

class APIManager {
    // MARK: - Errors
    enum ServerError: Error {
        case unknown
    }

    enum NetworkError: Error {
        case disconnected
    }
}

extension APIManager {
    
    // 최초에 사진 리스트를 받아오는 함수.
    // 비동기로 작동해야하고
    // 받아온 이후에 컴플리션 핸들러로 사진 배열을 넘겨줘야 한다.
    func getPhotoList(completionHandler: @escaping (Error?, [Photo]?) -> ()) {
        
        guard let url = URL(string: "\(Config.BaseURL)/photos?client_id=\(Config.AccessKey)") else {
            completionHandler(NetworkError.disconnected, nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil { completionHandler(NetworkError.disconnected, nil) }
            
            switch (response as? HTTPURLResponse)?.statusCode ?? 500 {
            case 200:
                let photoList = self.decoded(data: data)
                if photoList != nil {
                    completionHandler(nil, photoList!)
                    print("===============urls================")
                    photoList?.forEach({ photo in
                        print(photo.urls?.raw!)
                    })
                }else{
                    completionHandler(ServerError.unknown, nil)
                }
            default:
                completionHandler(ServerError.unknown, nil)
            }
        }
        task.resume()
    }
    
    // Data를 디코딩하여 Photo 배열로 리턴하는 디코딩 함수.
    func decoded(data: Data?) -> [Photo]? {
        let decoder = JSONDecoder()
        do {
            guard let photoData = data else { return nil }
            let photoList = try decoder.decode([Photo].self, from: photoData)
            return photoList
        } catch {
            return nil
        }
    }
}



