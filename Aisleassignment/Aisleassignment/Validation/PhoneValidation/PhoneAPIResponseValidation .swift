//
//  PhoneAPIResponseValidation .swift
//  Aisleassignment
//
//  Created by Dhanush S on 16/03/23.
//

import Foundation

struct PhoneAPIResponseValidation {
    
    func Validate(response: PhoneAPIResponse?) -> PhoneAPIResponseValidationResults {
        guard let response = response else {
            return PhoneAPIResponseValidationResults(success: false, error: "Response is nil")
        }
        if response.status {
            return PhoneAPIResponseValidationResults(success: true, error: nil)
        } else {
            return PhoneAPIResponseValidationResults(success: false, error: "PhoneNumber is Invalid")
        }
    }
}
