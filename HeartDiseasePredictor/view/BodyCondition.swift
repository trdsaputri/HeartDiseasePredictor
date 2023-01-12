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
                ZStack{
                    
                }
                VStack{
                    Text("Do you have a diabetic history?")
                    HStack{
                        Spacer().frame(width: 70)
                        ZStack{
                            HStack{
                                if(global.isDiabetic == false){
                                    Spacer()
                                }
                                Rectangle()
                                    .onTapGesture {
                                        withAnimation {
                                            global.isDiabetic.toggle()
                                        }
                                    }
                                    .foregroundColor(.green)
                                    .frame(width: 100, height: 100).accessibilityLabel(global.isDiabetic ? "yes" : "no")
                                if(global.isDiabetic == true){
                                    Spacer()
                                }
                            }
                            HStack{
                                Spacer()
                                Text("YES").fontWeight(global.isDiabetic ? .bold : .regular)
                                Spacer()
                                Text("NO").fontWeight(global.isDiabetic ? .regular : .bold)
                                Spacer()
                            }.opacity(0.5)
                        }.background(.red)
                        Spacer().frame(width: 70)
                    }
                }.padding(.horizontal)
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
        .onAppear{
            print("debug height: \(global.height)")
            print("debug weight: \(global.weight)")
            print("debug age: \(global.age)")
            print("debug gender: \(global.Sex)")
        }
    }
}

struct BodyCondition2_Previews: PreviewProvider {
    static var previews: some View {
        BodyCondition()
    }
}
