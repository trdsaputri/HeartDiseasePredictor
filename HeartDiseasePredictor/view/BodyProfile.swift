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
        VStack{
            Text("BODY PROFILE")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
                .accessibilityLabel("Body Profile Form")
            
            ScrollView{
                HStack{
                    VStack{
                        HStack{
                            Text("Sex")
                                .font(.body)
                                .padding(.leading)
                                .accessibilityLabel("Sex")
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        HStack{
                            Section{
                                Picker(selection: $global.Sex, label: Text("Sex")) {
                                    ForEach(sexs, id: \.self) {
                                        Text($0).tag($0)
                                    }
                                }.accessibilityLabel("please choose your sex")
                                    .accentColor(.blue)
                            }
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color(hex:0xE9F9FB))
                                )
                            .padding(.init(top: 0, leading: 15, bottom: 5, trailing: 15))

                
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                                        
                    Spacer()
                    
                }.padding(.bottom)
                
                VStack{
                    HStack{
                        Text("Age")
                            .font(.body)
                            .padding(.leading)
                            .accessibilityLabel("Age")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        Section {
                            Picker(selection: $global.age) {
                                ForEach(ages, id: \.self) {
                                    Text($0)
                                }
                            } label: {}
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color(hex:0xE9F9FB))
                            )
                        .padding(.init(top: 0, leading: 15, bottom: 5, trailing: 15))
                    
                    
                    Spacer()
                }.padding(.bottom)
                
                HStack{
                    Text("Race         ")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        .accessibilityLabel("Race")
                    
                    Menu {
                        Picker(selection: $global.race) {
                            ForEach(races, id: \.self) {
                                Text($0)
                            }
                        } label: {}
                    } label: {
                        Text(global.race)
                            .fontWeight(.medium)
                            .frame(height: 44)
                            .font(.body)
                            .accessibilityLabel("please choose your race")
                    }
                    
                    Spacer()
                    
                }
                .padding(.bottom)
                
                HStack{
                    Text("Weight (kg)  ")
                        .font(.body)
                        .padding(.leading)
                        .accessibilityLabel("Weight in kilogram")
                    
                    Spacer()
                }
                
                HStack{
                    TextField("kilograms", text: $global.weight)
                        .font(.body)
                        .padding(.leading)
                        .frame(width: 375)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.blue)
                        .keyboardType(.decimalPad)
                        .accessibilityLabel("Please fill out your weight in kilogram")
                    
                    Spacer()
                }
                .padding(.bottom)

                
                HStack{
                    Text("Height (cm)  ")
                        .font(.body)
                        .padding(.leading)
                        .accessibilityLabel("height in centimeters")
                    Spacer()
                }
                
                HStack{
                    TextField("centimeters", text: $global.height)
                        .font(.body)
                        .padding(.leading)
                        .frame(width: 375)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.blue)
                        .keyboardType(.decimalPad)
                        .accessibilityLabel("please fill out your height in centimeters")
                    
                    Spacer()
                }
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
