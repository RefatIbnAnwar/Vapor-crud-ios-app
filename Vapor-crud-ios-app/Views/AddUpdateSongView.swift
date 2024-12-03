//
//  AddUpdateSongView.swift
//  Vapor-crud-ios-app
//
//  Created by Md Refat Hossain on 04/12/2024.
//

import SwiftUI

struct AddUpdateSongView: View {
    
    @ObservedObject var viewmodel: AddUpdateViewModel
    
    var body: some View {
        VStack {
            TextField("Song Title", text: $viewmodel.songTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button {
                
            } label: {
                Text("")
            }
            
        }
    }
}

#Preview {
    AddUpdateSongView()
}
