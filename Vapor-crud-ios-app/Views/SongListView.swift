//
//  SongListView.swift
//  Vapor-crud-ios-app
//
//  Created by Md Refat Hossain on 01/12/2024.
//

import SwiftUI

struct SongListView: View {
    
    @StateObject var viewModel: SongListViewModel = SongListViewModel()
    
    @State var modal: ModalType? = nil
    
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
            .toolbar {
                Button{
                    // Add song
                } label: {
                    Label("Add Song", systemImage: "plus.circle")
                }
            }
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
        .sheet(item: $modal, onDismiss: {
            // dismiss
        }){ modal in
            switch modal {
            case .add:
                Text("add song")
            case .update(let song):
                Text("update song")
            }
        }
    }
}

#Preview {
    SongListView()
}
