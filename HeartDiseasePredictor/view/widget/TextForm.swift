//
//  TextForm.swift
//  HeartDiseasePredictor
//
//  Created by Alfredo Junio on 12/01/23.
//

import SwiftUI

struct TextFormFieldCustom: View {
    @Binding var value: String
    @FocusState private var focusTextField: Bool
    var header: String
    var placeHolder: String
    var accessLabel: String
    
    var body: some View {
        VStack(spacing: 8) {
            HStack{
                Text(header)
                    .font(.body)
                    .accessibilityLabel(accessLabel)
                Spacer()
            }
            HStack {
                TextField(placeHolder, text: $value)
                    .font(.body)
                    .keyboardType(.decimalPad)
                    .focused($focusTextField)
                    .accessibilityLabel("Please fill out this field")
            }
            .padding(.init(top: 15, leading: 14, bottom: 15, trailing: 12))
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 4)
                .fill(Color("form")))
            .onTapGesture {
                focusTextField = false
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
