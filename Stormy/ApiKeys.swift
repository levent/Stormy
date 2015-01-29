//
//  ApiKeys.swift
//  Stormy
//
//  Created by Levent Ali on 29/01/2015.
//  Copyright (c) 2015 Purebreeze Ltd. All rights reserved.
//

import Foundation

func valueForAPIKey(#keyname:String) -> String {
    let filePath = NSBundle.mainBundle().pathForResource("ApiKeys", ofType:"plist")
    let plist = NSDictionary(contentsOfFile:filePath!)
    
    let value:String = plist?.objectForKey(keyname) as String
    return value
}