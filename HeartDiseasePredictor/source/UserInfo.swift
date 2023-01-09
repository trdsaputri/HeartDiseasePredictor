//
//  UserInfo.swift
//  HeartDiseasePredictor
//
//  Created by Theresia Saputri on 09/01/23.
//

import Foundation

final class UserInfo: ObservableObject{
    
    static let global = UserInfo()
    
    //user input information
    @Published var Sex = "Female"
    @Published var weight = ""
    @Published var height = ""
    @Published var age = "18-24"
    @Published var race = "White"
    @Published var isSmoking = false
    @Published var isStroke = false
    @Published var isDiabetic = false
    @Published var isDrinking = false
    //@Published var isActive = false
    @Published var isExercise = false
    @Published var isWorkActive = false
    @Published var MentalHealth = 0
    @Published var PhysicalHealth = 0
    @Published var SleepTime = 0
    @Published var selectionPage = 0
    
    //result
    @Published var HearthDisease = "Empty"
    @Published var confident = 0.0
    
    //output information
    @Published var imageState = "happy"
    @Published var resultColor = 2
    @Published var result = "THERE IS A POTENTIAL HEART DISEASE"
    @Published var notes = "Congratulations! You have low risk of having heart disease. \nHowever, based on some of your information, you have some condition or habit that may increase the potential. \nTherefore, you should make sure you have healthy habit."
    
}
