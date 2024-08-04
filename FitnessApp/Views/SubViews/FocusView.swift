//
//  FocusView.swift
//  FitnessApp
//
//  Created by Sakans on 4.08.2024.
//

import SwiftUI

struct FocusView: View {
    var body: some View {
        VStack {
            Text("Focus Muscle")
                .bold()
                .font(.largeTitle)
            Image("chest")
                .resizable()
                .frame(width: 200, height: 300)
                .cornerRadius(15)
        }
    }
}

#Preview {
    FocusView()
}
