//
//  EventInfo.swift
//  HackIllinoisDemo
//
//  Created by Carter Smith on 9/13/20.
//  Copyright © 2020 Carter Smith. All rights reserved.
//

import Foundation

public struct Event: Codable {
    let id: String
    let name: String
    let description: String
    let startTime: Date
    let endTime: Date
    let locations: [String]?
    let sponsor: String
    let eventType: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case startTime = "startTime"
        case endTime = "endTime"
        case locations = "locations"
        case sponsor = "sponsor"
        case eventType = "eventType"
    }
    
}

public struct EventList: Codable {
    var events: [Event]

}

