//
//  APIClient.swift
//  EmmaChallengeApp
//
//  Created by naveed durrani on 03/08/2021.
//

import Foundation
import Alamofire

class APIClient {
    
    static func printResponse(_ result: Result<String>) {
        switch result {
        case .success(let data):
            print(data)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    static func fetchAllEvents(pageIndex: Int,
                               completion: @escaping(DataResponse<GetEventsModel>) -> Void) {
        let parameters: [String: Any] = [K.APIParameterKey.apiKey: K.Constants.apiKey,
                          K.APIParameterKey.page: pageIndex,
                          K.APIParameterKey.size: K.Constants.pageSize]
        
        AF.request(K.ProductionServer.baseURL + K.EndPoints.fetchEvents, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseDecodable { (response: DataResponse<GetEventsModel>) in
            completion(response)
        }.responseString { (result) in
            switch result.result {
            case .success(let str):
                do {
                    let response = try JSONDecoder().decode(GetEventsModel.self, from: str.data(using: .utf8)!)
//                    print(response)
                } catch {
//                    print(error) //here.....
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
//    
//    static func updateBusiness(userName: String? = nil,
//                               arabicName: String? = nil,
//                               businessType: String? = nil,
//                               emailAddress: String? = nil,
//                               password: String? = nil,
//                               address: String? = nil,
//                               lat: String? = nil,
//                               lng: String? = nil,
//                               phoneNumber: String? = nil,
//                               profilePic: Data? = nil,
//                               coverPic: Data? = nil,
//                               firebaseToken: String? = nil,
//                               status: String? = nil,
//                               completion: @escaping(DataResponse<LoginModel>) -> Void) {
//        AF.upload(multipartFormData: { (formData) in
//            formData.append(DataManager.shared.getUserId().data(using: .utf8)!, withName: K.APIParameterKey.id)
//            if let userName = userName {
//                formData.append(userName.data(using: .utf8)!, withName: K.APIParameterKey.name)
//            }
//            if let arabicName = arabicName {
//                formData.append(arabicName.data(using: .utf8)!, withName: K.APIParameterKey.arabicName)
//            }
//            if let businessType = businessType {
//                formData.append(businessType.data(using: .utf8)!, withName: K.APIParameterKey.brandTypeId)
//            }
//            if let emailAddress = emailAddress {
//                formData.append(emailAddress.data(using: .utf8)!, withName: K.APIParameterKey.email)
//            }
//            if let password = password {
//                formData.append(password.data(using: .utf8)!, withName: K.APIParameterKey.password)
//            }
//            if let address = address {
//                formData.append(address.data(using: .utf8)!, withName: K.APIParameterKey.address)
//            }
//            if let lat = lat {
//                formData.append(lat.data(using: .utf8)!, withName: K.APIParameterKey.latitude)
//            }
//            if let lng = lng {
//                formData.append(lng.data(using: .utf8)!, withName: K.APIParameterKey.longitude)
//            }
//            if let phoneNumber = phoneNumber {
//                formData.append(phoneNumber.data(using: .utf8)!, withName: K.APIParameterKey.phoneNo)
//            }
//            if let firebaseToken = firebaseToken {
//                formData.append(firebaseToken.data(using: .utf8)!, withName: K.APIParameterKey.firebaseToken)
//            }
//            if let status = status {
//                formData.append(status.data(using: .utf8)!, withName: K.APIParameterKey.status)
//            }
//            
//            if let profilePic = profilePic {
//                let date = Date().timeIntervalSince1970
//                let fileName = String(date)
//                
//                formData.append(profilePic, withName: K.APIParameterKey.profilePic, fileName: fileName + ".jpg", mimeType: "image/*")
//            }
//            
//            if let coverPic = coverPic {
//                let date = Date().timeIntervalSince1970
//                let fileName = String(date)
//                
//                formData.append(coverPic, withName: K.APIParameterKey.coverPic, fileName: fileName + ".jpg", mimeType: "image/*")
//            }
//            
//        }, usingThreshold: MultipartUpload.encodingMemoryThreshold, to: K.ProductionServer.baseURL + K.EndPoints.registerBusiness, method: .put, headers: HTTPHeaders(DataManager.shared.getJsonHeaderWithToken())).responseDecodable { (response: DataResponse<LoginModel>) in
//            completion(response)
//            }.responseString { (response) in
//                switch response.result {
//                case .success(let str):
//                    print(str)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//        }
//    }
}



