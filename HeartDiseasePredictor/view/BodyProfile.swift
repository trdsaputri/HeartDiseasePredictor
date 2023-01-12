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
    //            Text("Body Profile")
    //                .font(.title)
    //                .fontWeight(.bold)
    //                .padding(.bottom)
    //                .accessibilityLabel("Body Profile Form")
                
                ScrollView{
                    PickerFormField(select: $global.Sex, list: sexs, header: "Sex")
                    
                    PickerFormField(select: $global.age, list: ages, header: "Age")
                    
                    PickerFormField(select: $global.race, list: races, header: "Race")
                    
    //                HStack{
    //                    Text("Race         ")
    //                        .font(.body)
    //                        .multilineTextAlignment(.leading)
    //                        .padding(.leading)
    //                        .accessibilityLabel("Race")
    //
    //                    Menu {
    //                        Picker(selection: $global.race) {
    //                            ForEach(races, id: \.self) {
    //                                Text($0)
    //                            }
    //                        } label: {}
    //                    } label: {
    //                        Text(global.race)
    //                            .fontWeight(.medium)
    //                            .frame(height: 44)
    //                            .font(.body)
    //                            .accessibilityLabel("please choose your race")
    //                    }
    //
    //                    Spacer()
    //
    //                }
    //                .padding(.bottom)
                    
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
                            .foregroundColor(Color.black)
                            .background(Circle().fill(Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
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

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
