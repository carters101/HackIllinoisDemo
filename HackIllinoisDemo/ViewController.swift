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
    //var filteredArr = [Event]()

     
    
    override func viewDidLoad() {
        // filteredArr = eventArr
        setupNavBar()
        super.viewDidLoad()
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    /*
    func filterRowsForSearchedText(_ searchText: String) {
        filteredArr = eventArr.filter({( event : Event) -> Bool in
            return event.name.lowercased().contains(searchText.lowercased()) || event.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    } */
    
    func setupNavBar() {
        navigationItem.title = "Hack Illinois Schedule"
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleTableViewCell", for: indexPath) as! SimpleTableViewCell
        let event = eventArr[indexPath.row]
        /*
        let event: Event
        if searchController.isActive && searchController.searchBar.text != "" {
            event = filteredArr[indexPath.row]
        } else {
            event = eventArr[indexPath.row]
        } */
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        let startTime = timeFormatter.string(from: event.startTime)
        let endTime = timeFormatter.string(from: event.endTime)
        let startDate = dateFormatter.string(from: event.startTime)
        
        if startTime == endTime {
            cell.timeLabel.text = "\(startDate) @ \(startTime)"
        } else {
            cell.timeLabel.text = "\(startDate) @ \(startTime) - \(endTime)"
        }
        
        cell.nameLabel.text = event.name
        cell.descLabel.text = event.description
        
        if event.eventType == "WORKSHOP" {
            cell.typeLabel.text = " \(event.eventType) "
            cell.typeLabel.backgroundColor = UIColor.systemBlue
            
        } else if event.eventType == "MINIEVENT" {
            cell.typeLabel.text = " \(event.eventType) "
            cell.typeLabel.backgroundColor = UIColor.systemGreen
            
        } else if event.eventType == "SPEAKER" {
            cell.typeLabel.text = " \(event.eventType) "
            cell.typeLabel.backgroundColor = UIColor.systemOrange
            
        } else if event.eventType == "MEAL" {
            cell.typeLabel.text = " \(event.eventType) "
            cell.typeLabel.backgroundColor = UIColor.systemYellow
            
        } else {
            cell.typeLabel.text = " \(event.eventType) "
            cell.typeLabel.backgroundColor = UIColor.systemGray
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.detailItem = eventArr[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    // MARK: Parse JSON into EventList
    func parse(json: Data) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        if let jsonEvents = try? decoder.decode(EventList.self, from: json) {
            eventArr = jsonEvents.events
            tableView.reloadData()
        }
    }
    
}
/*
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let term = searchController.searchBar.text {
            filterRowsForSearchedText(term)
        }
    }
} */


