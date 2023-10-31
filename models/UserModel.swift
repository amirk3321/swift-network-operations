//
//  UserModel.swift
//  swift-basic-network
//
//  Created by MA on 31/10/2023.
//

import Foundation


struct Address : Hashable , Codable  {
    
    var street : String
    var suite : String
    var city : String
    var zipcode : String
}


struct UserModel : Hashable ,Codable , Identifiable {
 
    var id : Int
    var name : String
    var username : String
    var email : String
    var address : Address
    var phone : String
    var website : String
    
    
}
