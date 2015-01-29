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

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/")
        let forecastURL = NSURL(string: "51.587243,-0.145021", relativeToURL: baseURL)
    
        
        let sharedSession = NSURLSession.sharedSession()
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(forecastURL!) { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            
            if error == nil {
                let dataObject = NSData(contentsOfURL: location)
                let weatherDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary

                let currentWeather = Current(weatherDictionary: weatherDictionary)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tempLabel.text = "\(currentWeather.temperature)"
                    self.iconView.image = currentWeather.icon!
                    self.currentTimeLabel.text = "At \(currentWeather.currentTime!) it is"
                    self.rainLabel.text = "\(currentWeather.precipProbability)"
                    self.humidityLabel.text = "\(currentWeather.humidity)"
                    self.summaryLabel.text = currentWeather.summary
                })
            }
            
        }
        downloadTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

