//
//  OTPViewModel.swift
//  Aisleassignment
//
//  Created by Dhanush S on 16/03/23.
//

import Foundation

protocol OTPViewModelDelegate {
    func ValidationResults(results: OTPResponseValidationResults?)
}

struct OTPViewModel {
    
    var delegate: OTPViewModelDelegate?
    
    func OtpValidation(otpVerify: OTPApiRequest) {
        let otpDataResource = OTPDataResource()
        otpDataResource.PostOTP(OTPwithPhoneNumber: otpVerify) { otpAPIResponse in
            let validationResult = OTPValidationResults().Validate(response: otpAPIResponse)
            if validationResult.AuthToken != nil {
                self.delegate?.ValidationResults(results: OTPResponseValidationResults(AuthToken: validationResult.AuthToken, error: nil))
            } else {
                self.delegate?.ValidationResults(results: OTPResponseValidationResults(AuthToken: nil, error: validationResult.error))
            }
        }
    }
    
}
