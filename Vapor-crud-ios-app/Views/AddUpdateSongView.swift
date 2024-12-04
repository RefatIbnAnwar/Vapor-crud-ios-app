//
//  AddUpdateSongView.swift
//  Vapor-crud-ios-app
//
//  Created by Md Refat Hossain on 04/12/2024.
//

import SwiftUI

struct AddUpdateSongView: View {
    
    @ObservedObject var viewmodel: AddUpdateViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("Song Title", text: $viewmodel.songTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button {
                viewmodel.addUpdateAction {
                    presentationMode.wrappedValue.dismiss()
                }
            } label: {
                viewmodel.isUpdating ? Text("Update") : Text("Add")
            }
            
        }
    }
}

#Preview {
    AddUpdateSongView(viewmodel: AddUpdateViewModel())
}
