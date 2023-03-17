//
//  OTPApiRequest.swift
//  Aisleassignment
//
//  Created by Dhanush S on 15/03/23.
//

import Foundation

struct OTPApiRequest: Encodable {
    var number: String
    var otp: String
}
