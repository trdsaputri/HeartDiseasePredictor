//
//  HelpActiveButton.swift
//  NC1-HeartDiseasePredictor
//
//  Created by Theresia Saputri on 11/05/22.
//

import SwiftUI

struct HelpActiveButton: View {
    @State var helpActive = false
    var body: some View {
        Button{
            self.helpActive.toggle()
        }label:{
            Label("", systemImage: "questionmark.circle.fill")
                .labelStyle(.iconOnly)
                .foregroundColor(.gray)
        }
        .alert("Being Active", isPresented: $helpActive, actions: {}, message:{Text("Answer YES if your regulary taking exercise, being physically active at work, or pysically moving around to perform your daily task")})
    }
}

struct HelpActiveButton_Previews: PreviewProvider {
    static var previews: some View {
        HelpActiveButton()
    }
}
