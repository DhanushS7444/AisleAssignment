//
//  AppConfigure.swift
//  Aisleassignment
//
//  Created by Dhanush S on 16/03/23.
//

import Foundation


final class AppConfigure {
    static let shared = AppConfigure()
    
    init() {}
    
    private let BaseURL = "https://app.aisle.co/V1"
    let PhoneNumber = "/users/phone_number_login"
    let OTPVerify = "/users/verify_otp"
    let NotesList = "/users/test_profile_list"
    
    
    func getAPIURL(endPoints: String) -> String {
        var urlString = ""
        urlString = BaseURL + endPoints
        return urlString
    }
}
