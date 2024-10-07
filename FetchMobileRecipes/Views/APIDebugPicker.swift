//
//  APIDebugPicker.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/6/24.
//

import SwiftUI

struct APIDebugPicker: View {
    @Binding var selectedEndpointIdx: Int
    var body: some View {
        HStack {
            Text("Debug: ")
                .font(.headline.weight(.bold))
            Picker("Debug mode", selection: $selectedEndpointIdx) {
                Text("Valid").tag(Endpoint.valid.numIdx)
                Text("Invalid").tag(Endpoint.invalid.numIdx)
                Text("Empty").tag(Endpoint.empty.numIdx)
                Text("Random").tag(-1)
            }
            
        }
        .pickerStyle(.segmented)
        .padding(.horizontal, 20)
    }
}

#Preview {
    APIDebugPicker(selectedEndpointIdx: .constant(Endpoint.valid.numIdx))
}
