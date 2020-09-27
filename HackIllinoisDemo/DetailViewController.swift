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
    @IBOutlet weak var detailTypelabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailNameLabel.text = "\((detailItem?.name)!)"
 
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
