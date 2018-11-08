//
//  Registration.swift
//  HotelManzana
//
//  Created by Justin Herzog on 11/8/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String
   
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfKids: Int
    
    var roomType: RoomType
    var wifi: Bool
}
