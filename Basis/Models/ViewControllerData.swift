//
//  ViewControllerData.swift
//  Basis
//
//  Created by GAURAV NAYAK on 05/06/20.
//  Copyright © 2020 CaffeineDevotee. All rights reserved.
//

import Foundation
import ObjectMapper

class ViewControllerData : Mappable {
    var data : [ResponseData]?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        data <- map ["data"]
    }
}

class ResponseData : Mappable {
    var id : String?
    var text : String?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        id <- map ["id"]
        text <- map ["text"]
    }
}

