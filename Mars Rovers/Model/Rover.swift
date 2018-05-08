//
//  Rover.swift
//  Mars Rovers
//
//  Created by BP Bista on 5/6/18.
//  Copyright © 2018 BP Bista. All rights reserved.
//
// https://api.nasa.gov/api.html#MarsPhotos

import Foundation

struct Rover:Codable {
    var name:String
    var landing_date:String
    var launch_date:String
    var status:String
    var max_sol:Int //The sol (Martian rotation or day)
    var max_date:String
    var total_photos:String
}
