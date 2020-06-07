//
//  ViewControllerService.swift
//  Basis
//
//  Created by GAURAV NAYAK on 05/06/20.
//  Copyright © 2020 CaffeineDevotee. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ViewControllerService {
    
    static let instance = ViewControllerService()
    
    /* First one is commented out since there is a "/" in the beging of the response which was preventing the data in JSONSerialization, instead the response if first tailored to make the ormat easier for the serialization. */
    func getCardData(success: @escaping (_ response: ViewControllerData?)->Void, failure: @escaping (_ error: String?) ->Void) {

//        Alamofire.request(URL_STRING, method:.get).responseData(completionHandler: { (response) in
//            print(response.data)
//        }).responseJSON(completionHandler: { (response) in
//            print(response)
//        }).responseObject {
//            ( response : DataResponse<ViewControllerData> ) in
//            switch response.result
//            {
//            case .success: success(response.result.value)
//            case .failure(let error): failure(error as NSError)
//            }
//
//        }
        
        let request = Alamofire.request(URL_STRING)
        request.validate(statusCode: [200]).response { (response) in
            
            if response.data != nil {
                
                var JSONString : String = String(data: response.data!, encoding: .utf8)!
                JSONString.removeFirst()
                success(ViewControllerData(JSONString: JSONString))
            } else {
                
                failure("Found nil in Response")
            }
            
        }
        
    }
}
