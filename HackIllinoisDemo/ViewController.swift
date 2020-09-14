//
//  ViewController.swift
//  HackIllinoisDemo
//
//  Created by Carter Smith on 9/9/20.
//  Copyright © 2020 Carter Smith. All rights reserved.
//

import UIKit

public let url = "https://api.hackillinois.org/event/"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData(from: url)
    }
    
    /*
    private func getData() {
        let url = URL(string: "https://api.hackillinois.org/event/")!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            do {

                print(EventArr.self)
            }
            catch
            {
                print("error: data cannot be found")
            }
            
        }.resume()
    } */
    
    
    private func getData(from url: String) {
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("An error has occurred!")
                return
            }
            
            // Convert data to the struct
            var eventList: EventList
            do {
                eventList = try JSONDecoder().decode(EventList.self,from: data)
                print(eventList.events[0].name)
            
            }
            catch {
                print("failed to convert: \(error)")
            }
                        
            }).resume()
        
    }
}


