//
//  Photo.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/14.
//

import Foundation

struct Photo: Codable {
    let width: Int?
    let height: Int?
    let blur_hash: String?
    let user: User?
    let urls: ImageURL?
}
struct User: Codable {
    let username: String?
    let name: String?
}
struct ImageURL: Codable {
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
    let thumb: String?
}
