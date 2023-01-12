//
//  Result.swift
//  NC1-HeartDiseasePredictor
//
//  Created by Theresia Saputri on 09/05/22.
//

import SwiftUI

struct Result: View {
    @ObservedObject var global = UserInfo.global
    @State var heartPercentage = 0.0
    @Binding var showResultModal:Bool
    var body: some View {
        VStack{
            
            
            
            Text("PREDICTION RESULT")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
                .accessibilityLabel("prediction result")
            
            ScrollView{
                ZStack{
                    VStack{
                        //Insert image here!
                    }
                    VStack{
                        Rectangle().frame(width:150, height: 2 * heartPercentage).foregroundColor(.white).onAppear {
                            withAnimation(.easeInOut(duration: 2)) {
                                heartPercentage = global.confident
                            }
                        }
                    }
                }.frame(width: 150, height: 200, alignment: .bottom).background(.blue).accessibilityLabel("Confident Level: \(global.confident) %")
                
                Text("\(global.confident, specifier: "%.2f")% Chance")
                    .font(.body)
                    .accessibilityLabel("Confident Level: \(global.confident, specifier: "%.2f") %")
                
                Text(global.result)
                    .font(.body)
                    .foregroundColor(resultColor(color: global.resultColor))
                    .accessibilityLabel(global.result)
                
                Spacer()
                
                Text(global.notes)
                    .font(.body)
                    .fontWeight(.medium)
                    //.padding()
                    .multilineTextAlignment(.center)
                    //.background(Color(hue: 0.588, saturation: 0.022, brightness: 0.959))
                    .cornerRadius(15)
                    .accessibilityLabel("Your result is : \(global.notes)")
                Spacer()
            }.padding(.horizontal)
            
            
            Spacer()
            
            Button("< return"){
                showResultModal = false
            }.background(.blue).foregroundColor(.white)
            
            Spacer()
            
            Text("Disclaimer: \nThe result is not 100% indicate your health condition. Please consult with your doctor for further validation")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(Color.gray)
                .padding(.horizontal)
                .accessibilityLabel("Disclaimer: The result is not 100% indicate your health condition. Please consult with your doctor for further validation")
        }
    }
}

func resultColor (color: Int) -> Color{
    if (color == 1){
        return Color.red
    }
    else{
        return  Color.blue
    }
}

struct Result_Previews: PreviewProvider {
    @State static var showResultModal = true
    
    static var previews: some View {
        Result(showResultModal: $showResultModal)
    }
}
