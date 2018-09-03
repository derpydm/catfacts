//
//  CatFactViewController.swift
//  catfacts
//
//  Created by Sean on 25/8/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import UIKit

class CatFactViewController: UIViewController {
    var CatFacts: [catFact]! = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 209/255, green: 1, blue: 235/255, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var imageCatView: UIImageView!
    @IBAction func unwindToStart(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
    }
    @IBOutlet weak var label: UILabel!
    func fetchCatFact(completion: @escaping (catFact?) -> Void) {
        let url = URL(string: "https://cat-fact.herokuapp.com/facts/random")!
        let task = URLSession.shared.dataTask(with: url) { (data,response,error) in
            
            let jsonDecoder = JSONDecoder()
            
            if let data = data, let CatFact = try? jsonDecoder.decode(catFact.self, from: data) {
                completion(CatFact)
            } else {
                completion(nil)
            }
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        task.resume()
    }
    func fetchCatGIF(completion: @escaping (UIImage?) -> Void) {
        let url = URL(string: "https://api.thecatapi.com/v1/images/search?format=src&mime_types=image/gif")!
        let task = URLSession.shared.dataTask(with: url) { (data,response,error) in
            if let data = data {
                let image = UIImage.gif(data: data)
                completion(image)
            } else {
                completion(nil)
            }
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        task.resume()
    }
    @IBAction func getCatFact(_ sender: Any) {
        fetchCatFact { (CatFact) in
            if let recievedCatFact = CatFact {
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.label.text = recievedCatFact.text
                    self.CatFacts.append(recievedCatFact)
                }
                
            }
            
        }
        fetchCatGIF { (image) in
            if let recievedGIF = image {
                DispatchQueue.main.async {
                    self.imageCatView.image = recievedGIF
                }
            }
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "historySegue" {
            let dest = segue.destination as! CatFactTableViewController
            dest.CatFacts = CatFacts
        }
    }

}

