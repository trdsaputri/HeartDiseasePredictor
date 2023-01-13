//
//  DropdownMenu.swift
//  HeartDiseasePredictor
//
//  Created by Alfredo Junio on 13/01/23.
//

import SwiftUI

struct DropdownMenu: View {
    
    @State private var isExpanded = false
    @State private var selectedNum = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            DisclosureGroup("Select Sex", isExpanded: $isExpanded) {
                VStack {
                    ForEach(1...5, id:\.self) {num in
                        Text("\(num)")
                            .font(.body)
                            .foregroundColor(.black)
                            .onTapGesture {
                                selectedNum = num
                                self.isExpanded.toggle()
                            }
                    }
                }
            }
            .accentColor(.black)
            .font(.body)
            .padding()
            .background(Color("form"))
        }
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu()
    }
}
