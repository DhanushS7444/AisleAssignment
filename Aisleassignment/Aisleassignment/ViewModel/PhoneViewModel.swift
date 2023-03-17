//
//  PhoneViewModel.swift
//  Aisleassignment
//
//  Created by Dhanush S on 16/03/23.
//

import Foundation

protocol phoneViewModelDelegate {
    func ValidationResults(results: PhoneAPIResponseValidationResults?)
}

struct PhoneViewModel {
    var delegate: phoneViewModelDelegate?
    
    func PhoneNumberValidation(phoneNumber: PhoneAPIRequest) {
        let phoneDataResource = PhoneDataResource()
        phoneDataResource.PostPhoneNumber(phoneRequest: phoneNumber) { phoneAPIResoponse in
            let validationResult = PhoneAPIResponseValidation().Validate(response: phoneAPIResoponse)
            if validationResult.success {
                DispatchQueue.main.async {
                    self.delegate?.ValidationResults(results: PhoneAPIResponseValidationResults(success: true, error: nil))
                }
            } else {
                self.delegate?.ValidationResults(results: PhoneAPIResponseValidationResults(success: false, error: validationResult.error))
            }
        }
    }
}
