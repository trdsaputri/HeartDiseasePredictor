//
//  ContentView.swift
//  HeartDiseasePredictor
//
//  Created by Theresia Saputri on 09/01/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var global = UserInfo.global
    @State private var selection: Int = 0
    
    
    var body: some View {
        TabView(selection: $global.selectionPage){
            BodyProfile().tag(0)
            BodyCondition().tag(1)
            DailyLifestyle().tag(2)
        }
        .preferredColorScheme(.light)
        .edgesIgnoringSafeArea(.top)
        .tabViewStyle(.page)
        .accessibilityLabel("swipe to move to other form")
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

