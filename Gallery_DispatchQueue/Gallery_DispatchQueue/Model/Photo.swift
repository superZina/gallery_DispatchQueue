//
//  Photo.swift
//  Gallery_DispatchQueue
//
//  Created by 이진하 on 2022/04/14.
//

import Foundation

struct Photo: Codable {
    let id: String?
    let createdAt, updatedAt: Date?
    let width, height: Int?
    let color, blurHash: String?
    let likes: Int?
    let likedByUser: Bool?
    let description: String?
    let user: User?
    let urls: URLs?
    let currentUserCollections: [CurrentUserCollection?]?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height, color
        case blurHash = "blur_hash"
        case likes
        case likedByUser = "liked_by_user"
        case description
        case user
        case urls
        case currentUserCollections = "current_user_collections"
    }
}

// MARK: - User
struct User: Codable {
    let id, username, name: String?
    let portfolioURL: String?
    let bio, location: String?
    let totalLikes, totalPhotos, totalCollections: Int?
    let instagramUsername, twitterUsername: String?
    let profileImage: ProfileImage?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id, username, name
        case portfolioURL = "portfolio_url"
        case bio, location
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case totalCollections = "total_collections"
        case instagramUsername = "instagram_username"
        case twitterUsername = "twitter_username"
        case profileImage = "profile_image"
        case links
    }
}

// MARK: - Links
struct Links: Codable {
    let linksSelf, html, photos, likes, download: String?
    let portfolio: String?
    let downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, download
        case downloadLocation = "download_location"
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String?
}

//MARK: - URLs
struct URLs: Codable {
    let raw, full, regular, small, thumb: String?
    
    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
    }
}

//MARK: - CurrentUserCollection

struct CurrentUserCollection: Codable {
    let id: Int?
    let title: String?
    let publishedAt, lastCollectedAt, updatedAt: Date?
    let coverPhoto, user: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case publishedAt = "published_at"
        case lastCollectedAt = "last_collected_at"
        case updatedAt = "updated_at"
        case coverPhoto = "cover_photo"
        case user
    }
}
