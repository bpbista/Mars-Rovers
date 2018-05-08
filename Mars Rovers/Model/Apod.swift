//
//  Apod.swift
//  Mars Rovers
//
//  Created by BP Bista on 5/6/18.
//  Copyright © 2018 BP Bista. All rights reserved.
//
// APOD: Astronomy Picture of the Day

import Foundation

struct Apod:Decodable {
    let copyright:String?
    let date:String?
    let explanation:String?
    let hdurl:String?
    let mediaType:String?
    let serviceVersion:String?
    let title:String?
    let url:URL?
    private enum CodingKeys:String, CodingKey{
        //To map model properties to JSON Keys
        case copyright = "copyright"
        case date = "date"
        case explanation = "explanation"
        case hdurl = "hdurl"
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title = "title"
        case url = "url"
    }
}
