//
//  ApodParser.swift
//  Mars Rovers
//
//  Created by BP Bista on 5/6/18.
//  Copyright © 2018 BP Bista. All rights reserved.
//

import Foundation

protocol passable {
    var copyright:String? {get set}
    var date:String? {get set}
    var explanation:String? {get set}
    var hdurl:String?{get set}
    var mediaType:String?{get set}
    var serviceVersion:String?{get set}
    var title:String?{get set}
    var url:String?{get set}
}
class ApodParser{
    var delegate:passable?
    var copyright:String? = nil
    var date:String? = nil
    var explanation:String? = nil
    var hdurl:String? = nil
    var mediaType:String? = nil
    var serviceVersion:String? = nil
    var title:String? = nil
    var url:String? = nil
    var urlStr = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"
//    var apod:Apod = Apod(copyright: nil, date: nil, explanation: nil, hdurl: nil, mediaType: nil, serviceVersion: nil, title: nil, url: nil)
    func fetch() -> ApodParser {
//  var apod:Apod = Apod(copyright: nil, date: nil, explanation: nil, hdurl: nil, mediaType: nil, serviceVersion: nil, title: nil, url: nil)
        guard let url = URL(string:urlStr) else {return self}
        URLSession.shared.dataTask(with: url) { (data,response ,error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
               let apodData = try decoder.decode(Apod.self, from: data)
//                self.copyright = self.apodData.copyright
//                self.date = self.apodData.date
                self.delegate?.copyright = apodData.copyright ?? "NASA"
                self.delegate?.explanation = apodData.explanation ?? ""
                print(response)
            
//                self.explanation = self.apodData.explanation
//                print(self.delegate?.explanation)
//                self.hdurl = self.apodData.hdurl
//                self.mediaType = self.apodData.mediaType
//                self.serviceVersion = self.apodData.serviceVersion
//                self.title = self.apodData.title
//                self.url = self.apodData.url
                
//                apod = Apod(copyright: apodData.copyright, date: apodData.date, explanation: apodData.explanation, hdurl: apodData.hdurl, mediaType: apodData.mediaType, serviceVersion: apodData.serviceVersion, title:apodData.title, url: apodData.url)
//                print(self.apod.explanation)
            } catch let error {
                print("Error", error)
            }
            }.resume()

        return self
    }
}
