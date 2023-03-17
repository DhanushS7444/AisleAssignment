//
//  HttpUtility.swift
//  Aisleassignment
//
//  Created by Dhanush S on 16/03/23.
//

import Foundation

import Foundation

final class HttpUtility {
    
    static let shared = HttpUtility()
    init() {}
    
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler: @escaping(_ result: T?) -> Void) {
        
        URLSession.shared.dataTask(with: requestUrl) {responseData, httpUrlResponse, error in
            if(error == nil && responseData != nil && responseData?.count != 0) {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                } catch let error {
                    debugPrint("error = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    
    
    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler: @escaping(_ result: T) -> Void) {
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if (data != nil && data?.count != 0) {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data!)
                    _ = completionHandler(result)
                } catch let error {
                    debugPrint("error = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func getApiDataWithHeader<T:Decodable>(requestUrl: URL, requestHeader: String, resultType: T.Type, completionHandler: @escaping(_ result: T?) -> Void) {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(requestHeader, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) {responseData, httpUrlResponse, error in
            if(error == nil && responseData != nil && responseData?.count != 0) {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                } catch let error {
                    debugPrint("error = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
}
