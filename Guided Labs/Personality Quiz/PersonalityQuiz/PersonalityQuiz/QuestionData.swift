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

var questionIndex = 0

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

var questions: [Question] = [
    Question(text: "Which food do you like the most?",
             type:.single,
             answers: [
                Answer(text: "Anything Is Good", type: .Link),
                Answer(text: "Spicy Steak", type: .Daruk),
                Answer(text: "Roasted Fruit", type: .OldMan),
                Answer(text: "Fish", type: .Revali)
        ]),
    Question(text: "Which activity do you enjoy the most?",
             type: .single,
             answers: [
                Answer(text: "Swimming", type: .Sidon),
                Answer(text: "Competing", type: .Urbosa),
                Answer(text: "Reading", type: .Zelda),
                Answer(text: "Catching Bugs", type: .Beedle)
        ]),
    Question(text: "How much do you like Link?",
             type: .ranged,
             answers: [
                Answer(text: "I hate him", type: .Ganon),
                Answer(text: "I love him", type: .Mipha)
        ]),
    Question(text: "Where would you most like to live?",
             type: .single,
             answers: [
                Answer(text: "Hawaii", type: .Mipha),
                Answer(text: "Near Mount Fuji", type: .Daruk),
                Answer(text: "The Sahara Desert", type: .Urbosa),
                Answer(text: "The Alps", type: .Revali)
        ]),
    //Link Zelda Ganon Old Man
    Question(text: "What do you do when you fail at something?",
             type: .single,
             answers: [
                Answer(text: "Improvise, Adapt, Overcome", type: .Link),
                Answer(text: "Try your best to master it", type: .Zelda),
                Answer(text: "Encourage others to do what I can't", type: .OldMan),
                Answer(text: "Give up and rampage", type: .Ganon)
        ]),
    Question(text: "Do you usually start conversations?",
             type: .ranged,
             answers: [
                Answer(text: "Nope, people ususally talk to me first", type: .Beedle),
                Answer(text: "Yep, I almost always start them", type: .Sidon)
        ])
]
