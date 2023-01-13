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
    
    
    @State private var isExpanded = false
    
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(header)
                    .font(.body)
                Spacer()
            }
//           
            
            DisclosureGroup("\(select)", isExpanded: $isExpanded) {
                ScrollView{
                    VStack(spacing: 8) {
                        ForEach(startIndex...endIndex, id:\.self) {num in
                            Text("\(num)")
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .onTapGesture {
                                    self.select = num
                                    withAnimation{
                                        self.isExpanded.toggle()
                                    }
                                }
                        }
                    }
                }.frame(maxHeight: 150)
            }
            .tint(.black)
            .padding(.init(top: 12, leading: 12, bottom: 12, trailing: 12))
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 4)
                .fill(Color("form")))
            
            
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
