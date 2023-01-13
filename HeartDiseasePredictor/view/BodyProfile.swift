//
//  BodyProfile2.swift
//  NC1-HeartDiseasePredictor
//
//  Created by Theresia Saputri on 13/05/22.
//

import SwiftUI

struct BodyProfile: View {

    @ObservedObject var global = UserInfo.global

    
    let sexs = ["Male","Female"]
    
    let ages = ["18-24", "25-29", "30-34", "35-39", "40-44", "45-49", "50-54", "55-59", "60-64", "65-69", "70-74", "80 or older"]
    
    let races = ["White", "Black", "Asian", "American Native", "Hispanic", "Other"]
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Body Profile")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .frame(height: 133, alignment: .bottom)
            .background(Rectangle().fill(Color("primary")))
            
            VStack{
                
                ScrollView{
                    PickerFormField(select: $global.Sex, list: sexs, header: "Sex")
                    
                    PickerFormField(select: $global.age, list: ages, header: "Age")
                    
                    PickerFormField(select: $global.race, list: races, header: "Race")
                    
                    TextFormFieldCustom(value: $global.weight, header: "Weight (kg)  ", placeHolder: "kilograms", accessLabel: "Weight in kilogram")
                    
                    TextFormFieldCustom(value: $global.height, header: "Height (cm)  ", placeHolder: "centimeters", accessLabel: "height in centimeters")
                    
    //                HStack{
    //                    Text("Weight (kg)  ")
    //                        .font(.body)
    //                        .padding(.leading)
    //                        .accessibilityLabel("Weight in kilogram")
    //
    //                    Spacer()
    //                }
    //
    //                HStack{
    //                    TextField("kilograms", text: $global.weight)
    //                        .font(.body)
    //                        .padding(.leading)
    //                        .frame(width: 375)
    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
    //                        .foregroundColor(.blue)
    //                        .keyboardType(.decimalPad)
    //                        .accessibilityLabel("Please fill out your weight in kilogram")
    //
    //                    Spacer()
    //                }
    //                .padding(.bottom)
    //
    //
    //                HStack{
    //                    Text("Height (cm)  ")
    //                        .font(.body)
    //                        .padding(.leading)
    //                        .accessibilityLabel("height in centimeters")
    //                    Spacer()
    //                }
    //
    //                HStack{
    //                    TextField("centimeters", text: $global.height)
    //                        .font(.body)
    //                        .padding(.leading)
    //                        .frame(width: 375)
    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
    //                        .foregroundColor(.blue)
    //                        .keyboardType(.decimalPad)
    //                        .accessibilityLabel("please fill out your height in centimeters")
    //
    //                    Spacer()
    //                }
                }
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button(action: {
                                        withAnimation (.easeInOut(duration: 1.0)) {
                                            global.selectionPage = global.selectionPage + 1
                                        }
                    }) {
                        Image(systemName: "arrow.right")
                            .padding()
                            .font(.body)
                            .foregroundColor(.white)
                            .background(Circle().fill(Color("primary")))
                            .accessibilityAddTraits([.isButton])
                            .accessibilityLabel("click to fill body condition information")
                    }
                    
                }
                .padding()
            }
        }.ignoresSafeArea()
    }

}

struct BodyProfile_Previews: PreviewProvider {
    static var previews: some View {
        BodyProfile()
    }
}


