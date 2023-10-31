//
//  PostModel.swift
//  swift-basic-network
//
//  Created by MA on 31/10/2023.
//

import Foundation


struct postModel : Hashable , Codable , Identifiable {
    
    var userId : Int
    var id : Int
    var title : String
    var body : String
    

    
    
}
