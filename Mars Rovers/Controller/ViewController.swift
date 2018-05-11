//
//  ViewController.swift
//  Mars Rovers
//
//  Created by BP Bista on 5/6/18.
//  Copyright © 2018 BP Bista. All rights reserved.
//"https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageScroller: UIScrollView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let scrollWidth = (background.image?.size.width) ?? background.frame.width
        let scrollheight = (background.image?.size.height) ?? background.frame.height
        imageScroller.contentSize = background.bounds.size

        
        imageScroller.contentSize = CGSize(width: scrollWidth, height: scrollheight)
        fetch()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetch() {
        let urlStr = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"
        guard let url = URL(string:urlStr) else {return}
        URLSession.shared.dataTask(with: url) { (data,response ,error) in
            
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let apodData = try decoder.decode(Apod.self, from: data)
                DispatchQueue.main.async{
                    //Reminder DEMO_KEY limits 50 queries per day
                    let imgUrl = apodData.url ?? URL(string: Values.url.rawValue)
                    self.loadImage(url: imgUrl)
                    self.imageTitle.text = apodData.title ?? Values.title.rawValue
                    self.imageDescription.text = apodData.explanation ?? Values.explanation.rawValue

                    print(apodData)
                }
            } catch let error {
                print("Error", error)
            }
            }.resume()
    }
    func loadImage(url:URL?){
        let imageLink = url ?? URL(string:"https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")
        guard let imageUrl = imageLink else {return}
        
        let picData = try? Data(contentsOf: imageUrl)
        
        if let imageData = picData {
            let image = UIImage(data: imageData)
            self.background.image = image
        }
    }

}

