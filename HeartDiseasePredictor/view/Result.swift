//
//  Result.swift
//  NC1-HeartDiseasePredictor
//
//  Created by Theresia Saputri on 09/05/22.
//

import SwiftUI

struct Result: View {
    @ObservedObject var global = UserInfo.global
    
    var body: some View {
        VStack{
            Text("PREDICTION RESULT")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
                .accessibilityLabel("prediction result")
            
            ScrollView{
                Image(global.imageState)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .padding()
                    .accessibilityLabel("\(global.imageState) icon")
                
                Text(global.result)
                    .font(.body)
                    .foregroundColor(resultColor(color: global.resultColor))
                    .accessibilityLabel(global.result)
                
                Text("Confident Level: \(global.confident) %")
                    .font(.body)
                    .accessibilityLabel("Confident Level: \(global.confident) %")
                
                HStack{
                    Text("Result: ")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.top)
                        .accessibilityLabel("Here is your result")

                    Spacer()
                }
                
                Text(global.notes)
                    .font(.body)
                    .fontWeight(.medium)
                    //.padding()
                    .multilineTextAlignment(.leading)
                    //.background(Color(hue: 0.588, saturation: 0.022, brightness: 0.959))
                    .cornerRadius(15)
                    .accessibilityLabel(global.notes)
                Spacer()
            }.padding(.horizontal)
            
            
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
    static var previews: some View {
        Result()
    }
}
