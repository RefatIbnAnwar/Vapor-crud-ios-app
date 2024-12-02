//
//  SongListView.swift
//  Vapor-crud-ios-app
//
//  Created by Md Refat Hossain on 01/12/2024.
//

import SwiftUI

struct SongListView: View {
    
    @StateObject var viewModel: SongListViewModel = SongListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.songs) {
                    song in
                    Button {
                        print("Selected") 
                    } label: {
                        Text(song.title)
                            .font(.title3)
                            .foregroundColor(Color(.label))
                    }
                }
            }
            .navigationTitle(Text("Songs"))
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchSongs()
                }
                catch {
                    print("error \(error)")
                }
            }
        }
    }
}

#Preview {
    SongListView()
}
