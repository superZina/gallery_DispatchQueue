//
//  ConfigViewController.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/14.
//

import UIKit

enum Config {
    static let BaseURL: String = "https://api.unsplash.com"
    static let AccessKey: String = "a1pGowXaV_6vYhgTzTsyvO_yAC-Tscnx_4oiQUUsKv8"
    static let SecretKey: String = "ZIMTwCwrypcajRNRUJXK_5HlA8HkXJ5-933gr8o7fcE"
    static let AuthorizationHeader: [String: String] = [ "Authorization" : AccessKey ]
    static let defaultImageName: String = "default"
}
