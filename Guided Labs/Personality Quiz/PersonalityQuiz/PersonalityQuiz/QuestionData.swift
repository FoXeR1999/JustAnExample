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
    case Link = "Link", Zelda = "Zelda", Ganon = "Ganon", MasterKohga = "Master Kohga", Kilton = "Kilton", Pikango = "Pikango", Magda = "Magda", Purah = "Purah", Paya = "Paya", Robbie = "Robbie", Kass = "Kass", Hestu = "Hestu", Teba = "Teba", Sidon = "Sidon", KingDorephan = "King Dorephan", Muzu = "Muzu", Riju = "Riju", Yunobo = "Yunobo", Bolson = "Bolson",  GreatDekuTree = "Great Deku Tree",  Impa = "Impa", KingOfRedLions = "King of Red Lions", Mipha = "Mipha", Daruk = "Daruk", Revali = "Revali", Urbosa = "Urbosa", Beedle = "Beedle",  GreatFairy = "Great Fairy"

    var definition: String {
        switch self {
        case.Link:
            return "Describe why they're Link."
        case.Zelda:
            return "Describe why they're Zelda."
        case.Ganon:
            return "Describe why they're Ganon."
        case.MasterKohga:
            return "Describe why they're Master Kohga."
        case.Kilton:
            return "Describe why they're Kilton."
        case.Pikango:
            return "Describe why they're Pikango."
        case.Magda:
            return "Describe why they're Magdo."
        case.Purah:
            return "Describe why they're Purah."
        case.Paya:
            return "Describe why they're Paya."
        case.Robbie:
            return "Describe why they're Robbie."
        case.Kass:
            return "Describe why they're Kass."
        case.Hestu:
            return "Describe why they're Hestu."
        case.Teba:
            return "Describe why they're Teba."
        case.Sidon:
            return "Describe why they're Sidon."
        case.KingDorephan:
            return "Describe why they're King Dorephan."
        case.Muzu:
            return "Describe why they're Muzu."
        case.Riju:
            return "Describe why they're Riju."
        case.Yunobo:
            return "Describe why they're Yunobo."
        case.Bolson:
            return "Describe why they're Bolson."
        case.GreatDekuTree:
            return "Describe why they're Great Deku Tree."
        case.Impa:
            return "Describe why they're Impa."
        case.KingOfRedLions:
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
        case.GreatFairy:
            return "Describe why they're a Great Fairy."
        }
    }
}
