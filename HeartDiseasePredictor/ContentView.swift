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
