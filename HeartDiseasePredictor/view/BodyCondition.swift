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
                        .foregroundColor(Color("headline"))
                        .fontWeight(.bold)
                        .padding([.leading, .bottom])
                        .accessibilityLabel("Health Condition")
                    
                }.frame(alignment: .center)
                
                HStack{
                    IntegerPickerFormField(select: $global.MentalHealth, startIndex: 0, endIndex: 30 , header: "How many days (in the last 30 days) you have mental breakdowns? ")
                    
                }
                
                
                HStack{
                    IntegerPickerFormField(select: $global.SleepTime, startIndex: 1, endIndex: 24 , header: "In average, how many hours do you sleep regularly?")
                }
                
                HStack{
                    Text("HEALTH HISTORY")
                        .font(.headline)
                        .foregroundColor(Color("headline"))
                        .fontWeight(.bold)
                        .padding([.leading, .bottom])
                        .accessibilityLabel("Health History")
                    
                }.frame(alignment: .center)
                
                VStack{
                    Text("Do you have a stroke history?")
                        .accessibilityLabel("do you have a diabetic history?")
                    
                    HStack{
                        Spacer()
                        ZStack{
                            HStack{
                                if(global.isStroke == false){
                                    Spacer()
                                }
                                Rectangle()
                                    .foregroundColor(Color("primary"))
                                    .frame(width:150).accessibilityLabel(global.isStroke ? "yes" : "no")
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
                            }
                            .font(.system(size: 30))
                            
                        }.frame(width: 300, height: 70)
                            .cornerRadius(10)
                        Spacer()
                    }
                    .onTapGesture {
                        withAnimation {
                            global.isStroke.toggle()
                        }
                    }
                }.padding(.horizontal)
                    .font(.body)
                
                Spacer().frame(height: 20)
                
                VStack{
                    Text("Do you have a diabetic history?")
                        .accessibilityLabel("do you have a diabetic history?")
                    
                    HStack{
                        Spacer()
                        ZStack{
                            HStack{
                                if(global.isDiabetic == false){
                                    Spacer()
                                }
                                Rectangle()
                                    .foregroundColor(Color("primary"))
                                    .frame(width:150).accessibilityLabel(global.isDiabetic ? "yes" : "no")
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
                            }
                            .font(.system(size: 30))
                            
                        }.frame(width: 300, height: 70)
                            .cornerRadius(10)
                        Spacer()
                    }
                    .onTapGesture {
                        withAnimation {
                            global.isDiabetic.toggle()
                        }
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
                        .foregroundColor(.white)
                        .background(Circle().fill(Color("primary")))
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
                        .foregroundColor(.white)
                        .background(Circle().fill(Color("primary")))
                        .accessibilityAddTraits([.isButton])
                        .accessibilityLabel("click to fill daily lifestyle information")
                }
                
            }
            .padding()
            
        }
        .ignoresSafeArea()
    }
}

struct BodyCondition2_Previews: PreviewProvider {
    static var previews: some View {
        BodyCondition()
    }
}
