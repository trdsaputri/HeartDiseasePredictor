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
            
            
            
//            Text("PREDICTION RESULT")
//                .font(.title)
//                .fontWeight(.bold)
//                .padding(.bottom)
//                .accessibilityLabel("prediction result")
            
            VStack {
                ZStack{
                    VStack{
                        Rectangle().frame(width:200, height: 2.7 * heartPercentage).foregroundColor(.white).onAppear {
                            withAnimation(.easeInOut(duration: 2)) {
                                heartPercentage = global.confident
                            }
                        }
                    }.frame(height:270, alignment: .bottom)
                    
                    //Insert image here!
                    Image(global.imageState == "happy" ? "goodheart" : "badheart")
                }.frame(alignment: .bottom).accessibilityLabel("Confident Level: \(global.confident) %")
                
                Text("\(global.confident, specifier: "%.2f")% Chance")
                    .font(.body)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .accessibilityLabel("Confident Level: \(global.confident, specifier: "%.2f") %")
                
                Text(global.result)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .accessibilityLabel(global.result)
                
                Spacer().frame(height: 20)
                
                Text(global.notes)
                    .font(.body)
                    .foregroundColor(.white)
                    //.padding()
                    .multilineTextAlignment(.center)
                    //.background(Color(hue: 0.588, saturation: 0.022, brightness: 0.959))
//                    .cornerRadius(15)
                    .accessibilityLabel("Your result is : \(global.notes)")
            }
            .padding(.horizontal, 50)
            
            
            Spacer()
            
            Button("< Return"){
                showResultModal = false
            }
            .padding(.init(top: 10, leading: 18, bottom: 10, trailing: 18))
            .background(.white, in: Capsule())
            .foregroundColor(global.imageState == "happy" ? Color("headline") : Color("bad"))
            .fontWeight(.bold)
            
            Spacer().frame(height: 40)
            
            Text("Disclaimer: \nThe result is not 100% indicate your health condition. Please consult with your doctor for further validation")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(.white.opacity(0.8))
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .accessibilityLabel("Disclaimer: The result is not 100% indicate your health condition. Please consult with your doctor for further validation")
        }
        .background(global.imageState == "happy" ? Color("primary") : Color("bad"))
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
