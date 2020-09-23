//
//  ViewController.swift
//  HackIllinoisDemo
//
//  Created by Carter Smith on 9/9/20.
//  Copyright © 2020 Carter Smith. All rights reserved.
//

import UIKit

public let urlString = "https://api.hackillinois.org/event/"

class ViewController: UITableViewController {
    var eventArr = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                
            }
        }
        
        
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleTableViewCell", for: indexPath) as! SimpleTableViewCell
        let event = eventArr[indexPath.row]
        cell.nameLabel.text = event.name
        cell.descLabel.text = event.description
        cell.typeLabel.text = event.eventType
        
        
        return cell
    }
    
    // Parse the JSON data into the EventList struct
    func parse(json: Data) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        if let jsonEvents = try? decoder.decode(EventList.self, from: json) {
            eventArr = jsonEvents.events
            tableView.reloadData()
        }
    }
    
}


