//
//  BodyCondition2.swift
//  NC1-HeartDiseasePredictor
//
//  Created by Theresia Saputri on 13/05/22.
//

import SwiftUI

struct BodyCondition: View {
    @ObservedObject var global = UserInfo.global
    let mentalhealthdays = [0,1,2,3,4,5,6,7,8,9,10]
    var body: some View {
        VStack{
            HStack(alignment: .bottom) {
                Text("Body Condition")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .accessibilityLabel("Body Condition")
                Spacer()
            }
            .padding()
            .frame(height: 133, alignment: .bottom)
            .background(Rectangle().fill(Color("primary")))
            
            
            ScrollView{
                
                HStack{
                    Text("HEALTH CONDITION")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding([.top, .leading, .bottom])
                        .accessibilityLabel("Health Condition")
                    
                }.frame(width: .infinity ,alignment: .center)
                
                HStack{
                    IntegerPickerFormField(select: $global.MentalHealth, startIndex: 0, endIndex: 30 , header: "How many days (in the last 30 days) you have mental breakdowns? ")

//                    Text("how many days (in the last 30 days) you have mental breakdowns? ")
//                        .multilineTextAlignment(.leading)
//                        .padding(.leading)
//                        .accessibilityLabel("how many days (in the last 30 days) you have mental breakdowns?")
//
//                    Spacer()
//
//                    Menu {
//                        Picker(selection: $global.MentalHealth) {
//                            ForEach(0...30, id: \.self) {
//                                            Text("\($0)")
//                                        }
//                        } label: {}
//                    } label: {
//                        Text("\(global.MentalHealth)")
//                            .fontWeight(.medium)
//                            .frame(width: 80, height: 50)
//                            .font(.body)
//                            .accessibilityLabel("please choose how many days in the last 30 days you have mental breakdowns")
//                    }
                }
                
                
                HStack{
                    IntegerPickerFormField(select: $global.MentalHealth, startIndex: 1, endIndex: 24 , header: "In average, how many hours do you sleep regularly?")
                    
//                    Text("In average, how many hours do you sleep regularly?")
//                        .multilineTextAlignment(.leading)
//                        .padding(.leading)
//                        .accessibilityLabel("In average, how many hours do you sleep regularly?")
//
//                    Spacer()
//
//                    Menu {
//                        Picker(selection: $global.SleepTime) {
//                            ForEach(1...24, id: \.self) {
//                                            Text("\($0)")
//                                        }
//                        } label: {}
//                    } label: {
//                        Text("\(global.SleepTime)")
//                            .fontWeight(.medium)
//                            .frame(width: 80, height: 50)
//                            .font(.body)
//                            .accessibilityLabel("please choose the average hours of your sleep time")
//                    }
                }.padding(.bottom)

                HStack{
                    Text("HEALTH HISTORY")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding([.leading, .bottom])
                        .accessibilityLabel("Health History")

                }.frame(width: .infinity ,alignment: .center)
                
                VStack{
                    Text("Do you have a stroke history?")
                        .accessibilityLabel("do you have a diabetic history")

                    HStack{
                        Spacer()
                        ZStack{
                            HStack{
                                if(global.isStroke == false){
                                    Spacer()
                                }
                                Rectangle()
                                    .foregroundColor(Color("primary"))
                                    .frame(width:150, height: .infinity).accessibilityLabel(global.isStroke ? "yes" : "no")
                                    .cornerRadius(10)
                                if(global.isStroke == true){
                                    Spacer()
                                }
                            }.background(Color(hex: 0xE9F9FB))
                            HStack{
                                Spacer()
                                Text("YES").fontWeight(.bold)
                                    .foregroundColor(global.isStroke ? .white : .gray)
                                Spacer().frame(width: 100)
                                Text("NO").fontWeight(.bold)
                                    .foregroundColor(global.isStroke ? .gray : .white)

                                Spacer()
                            }.onTapGesture {
                                withAnimation {
                                    global.isStroke.toggle()
                                }
                            }
                                .font(.system(size: 30))
                        
                        }.frame(width: 300, height: 70)
                            .cornerRadius(10)
                        Spacer()
                    }
                }.padding(.horizontal)
                    .font(.body)

                
//                HStack{
//                    Toggle("Do you have stroke history? ",isOn: $global.isStroke)
//                        .accessibilityLabel("do you have stroke history")
//                        .font(.body)
//
//                    if global.isStroke {
//                        Text("yes")
//                            .padding(.horizontal)
//                            .font(.body)
//                            .accessibilityLabel("yes")
//                        }
//                    else{
//                        Text("no")
//                            .padding(.horizontal)
//                            .font(.body)
//                            .accessibilityLabel("no")
//                    }
//                }.padding([.leading, .bottom, .trailing])
//                    .toggleStyle(SwitchToggleStyle(tint: Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
//                    .accessibilityLabel("do you have stroke history")
                
                Spacer().frame(height: 30)
                
                VStack{
                    Text("Do you have a diabetic history?")
                        .accessibilityLabel("do you have a diabetic history")

                    HStack{
                        Spacer()
                        ZStack{
                            HStack{
                                if(global.isDiabetic == false){
                                    Spacer()
                                }
                                Rectangle()
                                    .foregroundColor(Color("primary"))
                                    .frame(width:150, height: .infinity).accessibilityLabel(global.isDiabetic ? "yes" : "no")
                                    .cornerRadius(10)
                                if(global.isDiabetic == true){
                                    Spacer()
                                }
                            }.background(Color(hex: 0xE9F9FB))
                            HStack{
                                Spacer()
                                Text("YES").fontWeight(.bold)
                                    .foregroundColor(global.isDiabetic ? .white : .gray)
                                Spacer().frame(width: 100)
                                Text("NO").fontWeight(.bold)
                                    .foregroundColor(global.isDiabetic ? .gray : .white)

                                Spacer()
                            }.onTapGesture {
                                withAnimation {
                                    global.isDiabetic.toggle()
                                }
                            }
                                .font(.system(size: 30))
                        
                        }.frame(width: 300, height: 70)
                            .cornerRadius(10)
                        Spacer()
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
            
        }.ignoresSafeArea()
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
