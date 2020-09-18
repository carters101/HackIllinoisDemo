//
//  ViewController.swift
//  HackIllinoisDemo
//
//  Created by Carter Smith on 9/9/20.
//  Copyright © 2020 Carter Smith. All rights reserved.
//

import UIKit

public let urlString = "https://api.hackillinois.org/event/"

class ViewController: UIViewController {
    var eventArr = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                
            }
        }
        
        
    }
    
    // Parse the JSON data into the EventList struct
    func parse(json: Data) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        if let jsonEvents = try? decoder.decode(EventList.self, from: json) {
            eventArr = jsonEvents.events
        }
    }
    
}


