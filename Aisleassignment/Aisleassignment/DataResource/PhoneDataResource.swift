//
//  PhoneDataResource.swift
//  Aisleassignment
//
//  Created by Dhanush S on 16/03/23.
//

import Foundation
 
struct PhoneDataResource {
    
    func PostPhoneNumber(phoneRequest: PhoneAPIRequest, completionHandler: @escaping (_ result: PhoneAPIResponse?) -> Void) {
        guard let phoneURL = URL(string: AppConfigure.shared.getAPIURL(endPoints: AppConfigure.shared.PhoneNumber)) else {return}
        do {
            let phoneApiPostBody = try JSONEncoder().encode(phoneRequest)
            HttpUtility.shared.postApiData(requestUrl: phoneURL, requestBody: phoneApiPostBody, resultType: PhoneAPIResponse.self) { phoneAPIResponse in
                _ = completionHandler(phoneAPIResponse)
            }
        } catch let error {
            debugPrint("error = \(error.localizedDescription)")
        }
    }
}
