//
//  AnalyzisResult.swift
//  NC1-HeartDiseasePredictor
//
//  Created by Theresia Saputri on 09/05/22.
//

import SwiftUI
import CoreML

struct AnalyzisResult: View {
    @State var showResultModal = false
    @ObservedObject var global = UserInfo.global
    
    func Prediction(){
                
        let model: HeartDiseaseClassifierV3 = {
            do {
                let config = MLModelConfiguration()
                return try HeartDiseaseClassifierV3(configuration: config)
            } catch {
                print(error)
                fatalError("Couldn't create Heart Disease Classifier")
            }
        }()

        let AgeCategory = global.age
        let Race = global.race
        let Sex = global.Sex
        let MentalHealth = Double(global.MentalHealth)
        let SleepTime = Double(global.SleepTime)
        
        var bmi: Double{
            guard let weight = Double(global.weight) else{
                return 0.0
            }
            
            guard let height = Double(global.height) else{
                return 0.0
            }
            
            return Double((weight / height / height) * 10000)
        }
        
        var Diabetic: String{
            if global.isDiabetic{
                return "Yes"
            }else{
                return "No"
            }
        }
        
        var Smoking: String{
            if global.isSmoking{
                return "Yes"
            }else{
                return "No"
            }
        }
        
        var Drinking: String{
            if global.isDrinking{
                return "Yes"
            }else{
                return "No"
            }
        }
        
        var Stroke: String{
            if global.isStroke{
                return "Yes"
            }else{
                return "No"
            }
        }
        
        var PhysicalHealth: String{
            if global.isExercise || global.isWorkActive{
                return "Yes"
            }else{
                return "No"
            }
        }
        
        guard let predictionOutput = try? model.prediction(BMI: bmi, AgeCategory: AgeCategory, Race: Race, Sex: Sex, Stroke: Stroke, Diabetic: Diabetic, PhysicalActivity: PhysicalHealth, Smoking: Smoking, Drinking: Drinking, MentalHealth: MentalHealth, SleepTime: SleepTime)
        else {
            fatalError("Unexpected runtime error.")
        }
        
        
        global.HearthDisease = predictionOutput.HeartDisease
        let confidence = predictionOutput.HeartDiseaseProbability[predictionOutput.HeartDisease]
        
        global.confident = (confidence ?? 0 ) * 100
        
        if global.HearthDisease == "Yes" {
            global.imageState = "sad"
            global.result = "THERE IS A POTENTIAL HEART DISEASE"
            global.resultColor = 1
            
            global.notes = "Unfortunately you have high risk of getting or having heart related disease.\n This result indicates that you have issue with your body weight, or having some unhealthy habits. \nTo validate the result, you should contact your doctor or nearest health center."
            
        }
        
        else{
            global.imageState = "happy"
            global.result = "THERE IS NO POTENTIAL HEART DISEASE"
            global.resultColor = 2
            
            if global.confident < 80{
                global.notes = "Congratulations! You have low risk of having heart disease. \nHowever, based on some of your information, you have some condition or habit that may increase the potential. \nTherefore, you should make sure you have healthy habit."
            }
            else{
                global.notes = "Congratulations! You have low risk of having heart disease. \nYou have good body condition and maintain healthy habit. \nPlease continue your good habit to stay healty."
            }
        }
    }
    
    var body: some View {
        Button{
            Prediction()
            self.showResultModal.toggle()
        }
        label:{
            Label("analyze my data", systemImage: "stethoscope")
                .padding()
                .frame(width: 370, alignment: .center)
                .background(Color(red: 0.511, green: 0.723, blue: 0.97))
                .foregroundColor(Color.black)
                .font(.body)
                .cornerRadius(15)
                .accessibilityLabel("Analyze the inputted data")
        }
        .fullScreenCover(isPresented: $showResultModal){
            Result(showResultModal: $showResultModal)
        }
        .padding()
        .accessibility(label: Text("Analyze the inputted data"))
    }
}

struct AnalyzisResult_Previews: PreviewProvider {
    static var previews: some View {
        AnalyzisResult()
    }
}
