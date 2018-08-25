//
//  CatFactViewController.swift
//  catfacts
//
//  Created by Sean on 25/8/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import UIKit

class CatFactViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func catFact(_ sender: Any) {
        let url = URL(string: "https://cat-fact.herokuapp.com/facts/random")!
        let task = URLSession.shared.dataTask(with: url) { (data,response,error) in
            if let data = data, let response = response {
                print(data)
                print("")
                print(response)
            }
        }
        task.resume()
    }
    
    @IBOutlet weak var catFact: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

