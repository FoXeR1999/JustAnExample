//
//  TheActualAPI.swift
//  RandomUserAPI
//
//  Created by Justin Herzog on 12/14/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//
//var baseURL = URL(string: "https://randomuser.me/api/?inc=gender,name,nat,dob,picture/?results=50/?nat=us")
//
//var myQuery: [String: Any] = [
//    "gender": "",
//
//]

import Foundation

var baseURL = URL(string: "https://randomuser.me/api/?inc=gender,name,nat,dob,picture/?results=50/?nat=us")

struct User: Codable {
    let name: String
    let nationality: String
    let age: Int
    let thumbnailPicture: URL
    let largePicture: URL
    
   
}
