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
                    Text("Sex           ")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading])
                        .accessibilityLabel("Sex")
                    
                    Menu {
                        Picker(selection: $global.Sex) {
                            ForEach(sexs, id: \.self) {
                                Text($0)
                            }
                        } label: {}
                    } label: {
                        Text(global.Sex)
                            .fontWeight(.medium)
                            .frame(height: 44)
                            .font(.body)
                            .padding(.top)
                            .accessibilityLabel("please choose your sex")
                    }
                    
                    Spacer()
                }.padding(.bottom)
                
                HStack{
                    Text("Age           ")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        .accessibilityLabel("Age")

                    Menu {
                        Picker(selection: $global.age) {
                            ForEach(ages, id: \.self) {
                                Text($0)
                            }
                        } label: {}
                    } label: {
                        Text(global.age)
                            .fontWeight(.medium)
                            .frame(height: 44)
                            .font(.body)
                            .accessibilityLabel("please choose your age")
                            
                    }
                    
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
