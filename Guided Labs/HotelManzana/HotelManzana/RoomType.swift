//
//  RoomType.swift
//  HotelManzana
//
//  Created by Justin Herzog on 11/8/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import Foundation

func == (lhs: RoomType, rhs: RoomType) -> Bool {
    return lhs.id == rhs.id
}

struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
}
