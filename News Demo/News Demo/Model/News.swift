//
//  News.swift
//  News Demo
//
//  Created by Harindra Pittalia on 16/02/23.
//

import Foundation

struct QuestionModel: Codable {
    let code: Int
    let data: DataModel
    let message: String
    let extra: [String]
}

// MARK: - DataClass
struct DataModel: Codable {
    let id, facebookID, name, gender: String?
    let profileImage, authToken, longLivedToken: String?

    enum CodingKeys: String, CodingKey {
        case id
        case facebookID = "facebook_id"
        case name, gender
        case profileImage = "profile_image"
        case authToken = "auth_token"
        case longLivedToken = "long_lived_token"
    }
}




// MARK: - News
struct News: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
