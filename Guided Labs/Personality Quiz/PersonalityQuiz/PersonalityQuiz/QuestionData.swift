//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Justin Herzog on 10/23/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import Foundation

//SkullKid = "Skull Kid", Twinrova = "Twinrova", Ghirahim = "Ghirahim", Zant = "Zant", Midna = "Midna", Fi = "Fi", Groose = "Groose", HappyMaskSalesman = "Happy Mask Salesman", Linebeck = "Linebeck", Navi = "Navi", Tingle = "Tingle, "Agitha = "Agitha", GuruGuru = "Guru-Guru", Malon = "Malon", Postman = "Postman"

struct Answer {
    var text: String
    var type: ZeldaType
}

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

enum ZeldaType: String {
    case Link = "Link", Zelda = "Zelda", Ganondorf = "Ganon", MasterKohga = "Master Kohga", Kilton = "Kilton", Pikango = "Pikango", Magda = "Magda", Purah = "Purah", Paya = "Paya", Robbie = "Robbie", Kass = "Kass", Hestu = "Hestu", Teba = "Teba", Sidon = "Sidon", KingDorephan = "King Dorephan", Muzu = "Muzu", Riju = "Riju", Yunobo = "Yunobo", Bolson = "Bolson",  GreatDekuTree = "Great Deku Tree",  Impa = "Impa", KingOfRedLions = "King of Red Lions", Mipha = "Mipha", Daruk = "Daruk", Revali = "Revali", Urbosa = "Urbosa", Beedle = "Beedle",  GreatFairy = "Great Fairy"

    var definition: String {
        switch self {
        case.Link:
            return "Describe why they're Link."
        case.Zelda:
            return "Describe why they're Zelda."
        case.Ganondorf:
            return "Describe why they're Ganondorf."
        case.SkullKid:
            return "Describe why they're SkullKid."
        }
    }
}
