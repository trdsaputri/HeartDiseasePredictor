//
//  DailyLifestyle.swift
//  NC1-HeartDiseasePredictor
//
//  Created by Theresia Saputri on 13/05/22.
//

import SwiftUI

struct DailyLifestyle: View {
    @ObservedObject var global = UserInfo.global
    @State var resultModal = false
    
    var body: some View {
        VStack{
            Text("DAILY LIFESTYLE")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
                .accessibilityLabel("daily lifestyle form")
            
            ScrollView{
                HStack{
                    Toggle("Do you smoke? ",isOn: $global.isSmoking)
                        .padding(.horizontal)
                        .accessibilityLabel("do you smoke?")
                        
                    if global.isSmoking {
                        Text("yes")
                            .padding(.horizontal)
                            .accessibilityLabel("yes")
                        }
                    else{
                        Text("no")
                            .padding(.horizontal)
                            .accessibilityLabel("no")
                    }
                }.padding([.top, .leading, .trailing])
                    .toggleStyle(SwitchToggleStyle(tint: Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
                
                HStack{
                    Toggle("Do you drink alcohol? ",isOn: $global.isDrinking)
                        .padding(.horizontal)
                        .accessibilityLabel("do you drink alcohol?")
                        
                    if global.isDrinking {
                        Text("yes")
                            .padding(.horizontal)
                            .accessibilityLabel("yes")
                        }
                    else{
                        Text("no")
                            .padding(.horizontal)
                            .accessibilityLabel("no")
                    }
                }.padding(.horizontal)
                    .toggleStyle(SwitchToggleStyle(tint: Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
                
                HStack{
                    
                    Toggle("Do you usually take exercise? ", isOn: $global.isExercise)
                        .padding(.horizontal)
                        .accessibilityLabel("do you usually take exercise")
                        
                    if global.isExercise {
                        Text("yes")
                            .padding(.horizontal)
                            .accessibilityLabel("yes")
                        }
                    else{
                        Text("no")
                            .padding(.horizontal)
                            .accessibilityLabel("no")
                    }
                    
                }.padding(.horizontal)
                    .toggleStyle(SwitchToggleStyle(tint: Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
                
                HStack{
                    
                    Toggle("Do you pysically move around to perform your daily task? ", isOn: $global.isWorkActive)
                        .padding(.horizontal)
                        .accessibilityLabel("Do you pysically move around to perform your daily task?")
                        
                    if global.isWorkActive {
                        Text("yes")
                            .padding(.horizontal)
                            .accessibilityLabel("yes")
                        }
                    else{
                        Text("no")
                            .padding(.horizontal)
                            .accessibilityLabel("no")
                    }
                    
                }.padding(.horizontal)
                    .toggleStyle(SwitchToggleStyle(tint: Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
                
                AnalyzisResult()
                    .padding(.horizontal)
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
                        //.accessibilityLabel("click to go back to the body condition form")
                }.accessibilityLabel("click to go back to the body condition form")
                
                Spacer()
                
            }
            .padding()
            
        }
    }
}

struct DailyLifestyle2_Previews: PreviewProvider {
    static var previews: some View {
        DailyLifestyle()
    }
}
