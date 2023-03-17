//
//  OTPDataResource.swift
//  Aisleassignment
//
//  Created by Dhanush S on 16/03/23.
//

import Foundation

struct OTPDataResource {
    
    func PostOTP(OTPwithPhoneNumber: OTPApiRequest, completionHandler: @escaping (_ result: OTPApiResponse?) -> Void) {
        guard let otpURLVerify = URL(string: AppConfigure.shared.getAPIURL(endPoints: AppConfigure.shared.OTPVerify)) else {return}
        do {
            let otpAPIPostBody = try JSONEncoder().encode(OTPwithPhoneNumber)
            HttpUtility.shared.postApiData(requestUrl: otpURLVerify, requestBody: otpAPIPostBody, resultType: OTPApiResponse.self) { otpAPIResponse in
                _ = completionHandler(otpAPIResponse)
            }
        } catch let error {
            debugPrint("error = \(error.localizedDescription)")
        }
    }
}
