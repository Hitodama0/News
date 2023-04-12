//
//  ArticleStruct.swift
//  News
//
//  Created by Biagio Ricci on 12/04/23.
//

import Foundation

//Headline

struct Result: Hashable, Codable {
    let section: String
    let subsection: String
    let title: String
    let abstract: String
    let url: String
    let multimedia: [Multimedia]
}

struct Multimedia: Codable, Hashable {
    let url: String
}

struct Response: Codable {
    let status: String
    let num_results: Int
    let results: [Result]
}


// Search

struct ArticleResponse: Codable {
    let response: Docs
}

struct Docs: Codable {
    let docs: [Article]
}

struct Article: Codable {
    let abstract: String
    let snippet: String
    let web_url: String
    let lead_paragraph: String
    let multimedia: [Multimedia]
}


//Movies

struct ReviewsResponse: Codable {
    let results: [MovieReview]
}

struct MovieReview: Codable {
    let display_title: String
    let mpaa_rating: String
    let summary_short: String
    let publication_date: String
    let link: LinkStruct
}

struct LinkStruct: Codable {
    let url: String
    let suggested_link_text: String
}
