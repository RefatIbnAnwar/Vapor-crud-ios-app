//
//  ModalType.swift
//  Vapor-crud-ios-app
//
//  Created by Md Refat Hossain on 03/12/2024.
//


enum ModalType: Identifiable {
    var id: String {
        switch self {
        case .add: return "add"
        case .update: return "update"
        }
    }
    case add
    case update(Song)
}
