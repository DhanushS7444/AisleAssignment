//
//  OTPValidationResults.swift
//  Aisleassignment
//
//  Created by Dhanush S on 16/03/23.
//

import Foundation

struct OTPValidationResults {
    
    func Validate(response: OTPApiResponse?) -> OTPResponseValidationResults {
        if response != nil {
            return OTPResponseValidationResults(AuthToken: response, error: nil)
        } else {
            return OTPResponseValidationResults(AuthToken: nil, error: "AuthToken is nil")
        }
    }
}
