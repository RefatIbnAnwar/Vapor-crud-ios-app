//
//  AddUpdateViewModel.swift
//  Vapor-crud-ios-app
//
//  Created by Md Refat Hossain on 04/12/2024.
//

import SwiftUI

final class AddUpdateViewModel: ObservableObject {
    @Published var songTitle = ""
    
    var songId: UUID?
    
    var isUpdating: Bool {
        songId != nil
    }
    
    var buttonTitleString: String {
        songId != nil ? "Update Song" : "Add Song"
    }
    
    init() {
        
    }
    
    init(currentSong: Song) {
        self.songTitle = currentSong.title
        self.songId = currentSong.id
    }
    
    func addSong() async throws {
        let urlString = Constants.baseUrl + EndPoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let song = Song(id: nil, title: self.songTitle)
        try await HTTPClient.shared.send(to: url,
                                         object: song,
                                         httpMethod: HTTPMethods.POST.rawValue)
    }
    
    func addUpdateAction(completion: @escaping () -> Void ) {
        Task {
            do {
                if isUpdating {
                    //update
                } else {
                    try await addSong()
                }
            } catch {
                print("error \(error)")
            }
            completion()
        }
        
    }
}
