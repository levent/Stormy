//
//  ViewController.swift
//  Stormy
//
//  Created by Levent Ali on 28/01/2015.
//  Copyright (c) 2015 Purebreeze Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let apiKey = "b9a141348c7d140edae994e2e92f7c29" // TODO: Move this out of source control and reset API KEY

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
        let forecastURL = NSURL(string: "51.587243,-0.145021", relativeToURL: baseURL)
        
//        let weatherData = NSData(contentsOfURL: forecastURL!, options: nil, error: nil)
        let weatherData = NSData(contentsOfURL: forecastURL!)
        println(weatherData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

