//
//  DetailViewController.swift
//  HackIllinoisDemo
//
//  Created by Carter Smith on 9/27/20.
//  Copyright © 2020 Carter Smith. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detailItem: Event?
    
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailTimeLabel: UILabel!
    @IBOutlet weak var detailDescLabel: UILabel!
    @IBOutlet weak var detailTypeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        let startTime = timeFormatter.string(from: (detailItem?.startTime)!)
        let endTime = timeFormatter.string(from: (detailItem?.endTime)!)
        let startDate = dateFormatter.string(from: (detailItem?.startTime)!)
        
        if startTime == endTime {
            detailTimeLabel.text = "\(startDate) @ \(startTime) \n"
        } else {
            detailTimeLabel.text = "\(startDate) @ \(startTime) - \(endTime) \n"
        }
        
        detailNameLabel.text = "\((detailItem?.name)!)"
        detailDescLabel.text = "\((detailItem?.description)!)"
        
        if detailItem?.eventType == "WORKSHOP" {
            detailTypeLabel.text = " \((detailItem?.eventType)!) "
            detailTypeLabel.backgroundColor = UIColor.systemBlue
            
        } else if detailItem?.eventType == "MINIEVENT" {
            detailTypeLabel.text = " \((detailItem?.eventType)!) "
            detailTypeLabel.backgroundColor = UIColor.systemGreen
            
        } else if detailItem?.eventType == "SPEAKER" {
            detailTypeLabel.text = " \((detailItem?.eventType)!) "
            detailTypeLabel.backgroundColor = UIColor.systemOrange
            
        } else if detailItem?.eventType == "MEAL" {
            detailTypeLabel.text = " \((detailItem?.eventType)!) "
            detailTypeLabel.backgroundColor = UIColor.systemYellow
            
        } else {
            detailTypeLabel.text = " \((detailItem?.eventType)!) "
            detailTypeLabel.backgroundColor = UIColor.systemGray
        }

        
 
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
