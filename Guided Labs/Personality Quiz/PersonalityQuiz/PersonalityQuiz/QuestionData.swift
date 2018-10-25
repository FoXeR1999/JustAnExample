//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Justin Herzog on 10/23/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import Foundation
import UIKit

//SkullKid = "Skull Kid", Twinrova = "Twinrova", Ghirahim = "Ghirahim", Zant = "Zant", Midna = "Midna", Fi = "Fi", Groose = "Groose", HappyMaskSalesman = "Happy Mask Salesman", Linebeck = "Linebeck", Navi = "Navi", Tingle = "Tingle, "Agitha = "Agitha", GuruGuru = "Guru-Guru", Malon = "Malon", Postman = "Postman", KingDorephan = "King Dorephan", Muzu = "Muzu", Riju = "Riju", Yunobo = "Yunobo", Bolson = "Bolson",  GreatDekuTree = "Great Deku Tree", Pikango = "Pikango", Magda = "Magda", Purah = "Purah", Paya = "Paya", Robbie = "Robbie", Kass = "Kass", Hestu = "Hestu", Teba = "Teba",

struct Answer {
    var text: String
    var type: UIImage.ZeldaType
}

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

extension UIImage {
    enum ZeldaType: String {
        
        case Link = "Link", Zelda = "Zelda", Ganon = "Ganon", Sidon = "Sidon", OldMan = "OldMan", Mipha = "Mipha", Daruk = "Daruk", Revali = "Revali", Urbosa = "Urbosa", Beedle = "Beedle"
        
        static let values = [Link, Zelda, Ganon, Sidon, OldMan, Mipha, Daruk, Revali, Urbosa, Beedle]
        
        var definition: String {
            switch self {
            case.Link:
                return "Describe why they're Link."
            case.Zelda:
                return "Describe why they're Zelda."
            case.Ganon:
                return "Describe why they're Ganon."
            case.OldMan:
                return "Describe why they're the Kind of Red Lions."
            case.Mipha:
                return "Describe why they're Mipha."
            case.Daruk:
                return "Describe why they're Daruk."
            case.Revali:
                return "Describe why they're Revali."
            case.Urbosa:
                return "Describe why they're Urbosa."
            case.Beedle:
                return "Describe why they're Beedle."
            case .Sidon:
                return "Describe why they're Sidon"
            }
        }
    }
    convenience init!(assetIdentifier: ZeldaType) {
        self.init(named: assetIdentifier.rawValue)
    }
}
