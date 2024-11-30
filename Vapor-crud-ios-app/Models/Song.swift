//
//  Song.swift
//  Vapor-crud-ios-app
//
//  Created by Md Refat Hossain on 01/12/2024.
//


import Foundation

struct Song : Identifiable, Codable {
    let id: UUID?
    var title: String
}
