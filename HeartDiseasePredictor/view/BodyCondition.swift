//
//  BodyCondition2.swift
//  NC1-HeartDiseasePredictor
//
//  Created by Theresia Saputri on 13/05/22.
//

import SwiftUI

struct BodyCondition: View {
    @ObservedObject var global = UserInfo.global
    
    var body: some View {
        VStack{
            Text("BODY CONDITION")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
                .accessibilityLabel("body condition form")
            
            ScrollView{
                
                HStack{
                    Text("Health Condition")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding([.top, .leading, .bottom])
                        .accessibilityLabel("Health Condition")

                    Spacer()
                }
                
                HStack{
                    Text("how many days (in the last 30 days) you have mental breakdowns? ")
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        .accessibilityLabel("how many days (in the last 30 days) you have mental breakdowns?")
                    
                    Spacer()
                    
                    Menu {
                        Picker(selection: $global.MentalHealth) {
                            ForEach(0...30, id: \.self) {
                                            Text("\($0)")
                                        }
                        } label: {}
                    } label: {
                        Text("\(global.MentalHealth)")
                            .fontWeight(.medium)
                            .frame(width: 80, height: 50)
                            .font(.body)
                            .accessibilityLabel("please choose how many days in the last 30 days you have mental breakdowns")
                    }
                }
                
                
                HStack{
                    Text("In average, how many hours do you sleep regularly?")
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        .accessibilityLabel("In average, how many hours do you sleep regularly?")
                    
                    Spacer()
                    
                    Menu {
                        Picker(selection: $global.SleepTime) {
                            ForEach(1...24, id: \.self) {
                                            Text("\($0)")
                                        }
                        } label: {}
                    } label: {
                        Text("\(global.SleepTime)")
                            .fontWeight(.medium)
                            .frame(width: 80, height: 50)
                            .font(.body)
                            .accessibilityLabel("please choose the average hours of your sleep time")
                    }
                }.padding(.bottom)

                HStack{
                    Text("Health History")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding([.leading, .bottom])
                        .accessibilityLabel("Health History")

                    Spacer()
                }
                
                HStack{
                    Toggle("Do you have stroke history? ",isOn: $global.isStroke)
                        .accessibilityLabel("do you have stroke history")
                        .font(.body)
                        
                    if global.isStroke {
                        Text("yes")
                            .padding(.horizontal)
                            .font(.body)
                            .accessibilityLabel("yes")
                        }
                    else{
                        Text("no")
                            .padding(.horizontal)
                            .font(.body)
                            .accessibilityLabel("no")
                    }
                }.padding([.leading, .bottom, .trailing])
                    .toggleStyle(SwitchToggleStyle(tint: Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
                    .accessibilityLabel("do you have stroke history")
                
                HStack{
                    Toggle("Do you have diabetic history? ",isOn: $global.isDiabetic)
                        .accessibilityLabel("do you have diabetic history")
                        .font(.body)
                        
                    if global.isDiabetic {
                        Text("yes")
                            .padding(.horizontal)
                            .font(.body)
                            .accessibilityLabel("yes")
                        }
                    else{
                        Text("no")
                            .padding(.horizontal)
                            .font(.body)
                            .accessibilityLabel("no")
                        
                    }
                }.padding(.horizontal)
                    .toggleStyle(SwitchToggleStyle(tint:  Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
                    .font(.body)
                
            }
            
            Spacer()
            
            HStack{
                Button(action: {
                                    withAnimation (.easeInOut(duration: 1.0)) {
                                        global.selectionPage = global.selectionPage - 1
                                    }
                }) {
                    Image(systemName: "arrow.left")
                        .padding()
                        .font(.body)
                        .foregroundColor(Color.black)
                        .background(Circle().fill(Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
                        .accessibilityAddTraits([.isButton])
                        .accessibilityLabel("click to go back to the body profile form")
                }
                
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
                        .accessibilityLabel("click to fill daily lifestyle information")
                }
                
            }
            .padding()
            
        }
    }
}

struct BodyCondition2_Previews: PreviewProvider {
    static var previews: some View {
        BodyCondition()
    }
}
