//
//  SearchBar.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/18.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var showCancelButton: Bool
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")

                TextField(
                    "도착역",
                    text: $searchText,
                    onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    },
                    onCommit: {}
                ).foregroundColor(.primary)

                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .opacity(searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)

            if showCancelButton  {
                Button("Cancel") {
                        UIApplication.shared.endEditing(true)
                        self.showCancelButton = false
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
        .padding()
        .navigationBarHidden(showCancelButton)
        .animation(.default)
    }
}

struct SearchBar_Previews: PreviewProvider {
    
    @State var searchText: String = ""
    @State var showCancelButton: Bool = false
    
    static var previews: some View {
        Text("asd")
    }
}
