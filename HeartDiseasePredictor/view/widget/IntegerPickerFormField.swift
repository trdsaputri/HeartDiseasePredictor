//
//  PickerForm.swift
//  HeartDiseasePredictor
//
//  Created by Alfredo Junio on 12/01/23.
//

import SwiftUI

struct IntegerPickerFormField: View {
    @Binding var select: Int
    var startIndex: Int
    var endIndex: Int

    var header: String
    
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(header)
                    .font(.body)
                Spacer()
            }
            HStack {
                Picker(selection: $select,
                       label:
                        Text(header)
                    .accessibilityLabel("please choose your \(header)")){
                        ForEach(startIndex...endIndex, id: \.self) {
                            Text(String($0))
                                .foregroundColor(.gray)
                                .tag($0)
                        }
                    }
                    .tint(.black)
                
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(.init(top: 12, leading: 0, bottom: 12, trailing: 12))
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 4)
                .fill(Color("form")))
            
            
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
