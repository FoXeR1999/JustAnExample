//
//  EmojiController.swift
//  Cool As
//
//  Created by Justin Herzog on 1/16/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import CoreData

class EmojiController {
    
    static let sharedEmojiController = EmojiController()
    
    var emojis: [Emoji] {
        
        let request: NSFetchRequest<Emoji> = Emoji.fetchRequest()
        
        do {
            return try Stack.context.fetch(request)
        } catch {
            print("Failed to request emoji")
            return []
        }
        
    }
    
    func saveEmoji() {
        do {
            print("saved Emoji")
            try Stack.context.save()
        } catch {
            print("Failed to save Emoji")
        }
    }
    
    func deleteEmoji(emoji: Emoji) {
        Stack.context.delete(emoji)
        saveEmoji()
    }
    
    func createEmoji(emoji: String) {
        let _ = Emoji(emoji: emoji)
        saveEmoji()
    }
}
