//
//  SongListViewModel.swift
//  Vapor-crud-ios-app
//
//  Created by Md Refat Hossain on 01/12/2024.
//

import SwiftUI

class SongListViewModel: ObservableObject {
    @Published var songs = [Song]()
}
