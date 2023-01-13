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
            HStack(alignment: .bottom) {
                Text("Daily Lifestyle")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .accessibilityLabel("Daily Lifestyle")
                Spacer()
            }
            .padding()
            .frame(height: 133, alignment: .bottom)
            .background(Rectangle().fill(Color("primary")))

            
            ScrollView{
                VStack{
                    Text("Do you smoke?")
                        .accessibilityLabel("do you smoke?")

                    HStack{
                        Spacer()
                        ZStack{
                            HStack{
                                if(global.isSmoking == false){
                                    Spacer()
                                }
                                Rectangle()
                                    .foregroundColor(Color("primary"))
                                    .frame(width:150).accessibilityLabel(global.isSmoking ? "yes" : "no")
                                    .cornerRadius(10)
                                if(global.isSmoking == true){
                                    Spacer()
                                }
                            }.background(Color(hex: 0xE9F9FB))
                            HStack{
                                Spacer()
                                Text("YES").fontWeight(.bold)
                                    .foregroundColor(global.isSmoking ? .white : .gray)
                                Spacer().frame(width: 100)
                                Text("NO").fontWeight(.bold)
                                    .foregroundColor(global.isSmoking ? .gray : .white)

                                Spacer()
                            }
                                .font(.system(size: 30))
                        
                        }.frame(width: 300, height: 70)
                            .cornerRadius(10)
                        Spacer()
                    }
                    .onTapGesture {
                        withAnimation {
                            global.isSmoking.toggle()
                        }
                    }
                }.padding(.horizontal)
                
                Spacer().frame(height: 20)
                
                VStack{
                    Text("Do you drink alcohol?")
                        .accessibilityLabel("do you drink alcohol?")

                    HStack{
                        Spacer()
                        ZStack{
                            HStack{
                                if(global.isDrinking == false){
                                    Spacer()
                                }
                                Rectangle()
                                    .foregroundColor(Color("primary"))
                                    .frame(width:150).accessibilityLabel(global.isDrinking ? "yes" : "no")
                                    .cornerRadius(10)
                                if(global.isDrinking == true){
                                    Spacer()
                                }
                            }.background(Color(hex: 0xE9F9FB))
                            HStack{
                                Spacer()
                                Text("YES").fontWeight(.bold)
                                    .foregroundColor(global.isDrinking ? .white : .gray)
                                Spacer().frame(width: 100)
                                Text("NO").fontWeight(.bold)
                                    .foregroundColor(global.isDrinking ? .gray : .white)

                                Spacer()
                            }
                                .font(.system(size: 30))
                        
                        }.frame(width: 300, height: 70)
                            .cornerRadius(10)
                        Spacer()
                    }
                    .onTapGesture {
                        withAnimation {
                            global.isDrinking.toggle()
                        }
                    }
                }.padding(.horizontal)
                
                Spacer().frame(height: 20)
                
                VStack{
                    Text("Do you usually excercise?")
                        .accessibilityLabel("do you usually excercise?")

                    HStack{
                        Spacer()
                        ZStack{
                            HStack{
                                if(global.isExercise == false){
                                    Spacer()
                                }
                                Rectangle()
                                    .foregroundColor(Color("primary"))
                                    .frame(width:150).accessibilityLabel(global.isExercise ? "yes" : "no")
                                    .cornerRadius(10)
                                if(global.isExercise == true){
                                    Spacer()
                                }
                            }.background(Color(hex: 0xE9F9FB))
                            HStack{
                                Spacer()
                                Text("YES").fontWeight(.bold)
                                    .foregroundColor(global.isExercise ? .white : .gray)
                                Spacer().frame(width: 100)
                                Text("NO").fontWeight(.bold)
                                    .foregroundColor(global.isExercise ? .gray : .white)

                                Spacer()
                            }
                                .font(.system(size: 30))
                        
                        }.frame(width: 300, height: 70)
                            .cornerRadius(10)
                        Spacer()
                    }
                    .onTapGesture {
                        withAnimation {
                            global.isExercise.toggle()
                        }
                    }
                }.padding(.horizontal)
                
                Spacer().frame(height: 20)
                
                VStack{
                    Text("Do you physically move around to perform your daily task?")
                        .accessibilityLabel("do you physically move around to perform your daily task?")
                        .multilineTextAlignment(.center)

                    HStack{
                        Spacer()
                        ZStack{
                            HStack{
                                if(global.isWorkActive == false){
                                    Spacer()
                                }
                                Rectangle()
                                    .foregroundColor(Color("primary"))
                                    .frame(width:150).accessibilityLabel(global.isWorkActive ? "yes" : "no")
                                    .cornerRadius(10)
                                if(global.isWorkActive == true){
                                    Spacer()
                                }
                            }.background(Color(hex: 0xE9F9FB))
                            HStack{
                                Spacer()
                                Text("YES").fontWeight(.bold)
                                    .foregroundColor(global.isWorkActive ? .white : .gray)
                                Spacer().frame(width: 100)
                                Text("NO").fontWeight(.bold)
                                    .foregroundColor(global.isWorkActive ? .gray : .white)

                                Spacer()
                            }
                                .font(.system(size: 30))
                        
                        }.frame(width: 300, height: 70)
                            .cornerRadius(10)
                        Spacer()
                    }
                    .onTapGesture {
                        withAnimation {
                            global.isWorkActive.toggle()
                        }
                    }
                }.padding(.horizontal)
                
                Spacer().frame(height: 20)
                
//                HStack{
//                    Toggle("Do you smoke? ",isOn: $global.isSmoking)
//                        .padding(.horizontal)
//                        .accessibilityLabel("do you smoke?")
//
//                    if global.isSmoking {
//                        Text("yes")
//                            .padding(.horizontal)
//                            .accessibilityLabel("yes")
//                        }
//                    else{
//                        Text("no")
//                            .padding(.horizontal)
//                            .accessibilityLabel("no")
//                    }
//                }.padding([.top, .leading, .trailing])
//                    .toggleStyle(SwitchToggleStyle(tint: Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
//
//                HStack{
//                    Toggle("Do you drink alcohol? ",isOn: $global.isDrinking)
//                        .padding(.horizontal)
//                        .accessibilityLabel("do you drink alcohol?")
//
//                    if global.isDrinking {
//                        Text("yes")
//                            .padding(.horizontal)
//                            .accessibilityLabel("yes")
//                        }
//                    else{
//                        Text("no")
//                            .padding(.horizontal)
//                            .accessibilityLabel("no")
//                    }
//                }.padding(.horizontal)
//                    .toggleStyle(SwitchToggleStyle(tint: Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
//
//                HStack{
//
//                    Toggle("Do you usually take exercise? ", isOn: $global.isExercise)
//                        .padding(.horizontal)
//                        .accessibilityLabel("do you usually take exercise")
//
//                    if global.isExercise {
//                        Text("yes")
//                            .padding(.horizontal)
//                            .accessibilityLabel("yes")
//                        }
//                    else{
//                        Text("no")
//                            .padding(.horizontal)
//                            .accessibilityLabel("no")
//                    }
//
//                }.padding(.horizontal)
//                    .toggleStyle(SwitchToggleStyle(tint: Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
//
//                HStack{
//
//                    Toggle("Do you pysically move around to perform your daily task? ", isOn: $global.isWorkActive)
//                        .padding(.horizontal)
//                        .accessibilityLabel("Do you pysically move around to perform your daily task?")
//
//                    if global.isWorkActive {
//                        Text("yes")
//                            .padding(.horizontal)
//                            .accessibilityLabel("yes")
//                        }
//                    else{
//                        Text("no")
//                            .padding(.horizontal)
//                            .accessibilityLabel("no")
//                    }
//
//                }.padding(.horizontal)
//                    .toggleStyle(SwitchToggleStyle(tint: Color(hue: 0.59, saturation: 0.471, brightness: 0.968)))
                
                AnalyzisResult()
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
                        .foregroundColor(.white)
                        .background(Circle().fill(Color("primary")))
                        .accessibilityAddTraits([.isButton])
                        //.accessibilityLabel("click to go back to the body condition form")
                }.accessibilityLabel("click to go back to the body condition form")
                
                Spacer()
                
            }
            .padding()
            
        }.ignoresSafeArea()
    }
}

struct DailyLifestyle2_Previews: PreviewProvider {
    static var previews: some View {
        DailyLifestyle()
    }
}
