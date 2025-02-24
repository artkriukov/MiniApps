//
//  Message.swift
//  FlashChat
//
//  Created by Artem Kriukov on 21.02.2025.
//

import Foundation

struct Message {
    enum Sender {
        case me, you
    }
    
    let sender: Sender
    let body: String
}

extension Message {
    static func getMessages() -> [Message] {
        return [
            Message(sender: .me, body: "Hello"),
            Message(sender: .you, body: "Hi"),
            Message(sender: .me, body: "How are you?"),
            Message(sender: .you, body: "I'm fine, thanks for asking"),
        ]
    }
}
