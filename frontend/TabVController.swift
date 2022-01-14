//
//  TabVController.swift
//  Weather
//
//  Created by wxy on 2021/11/26.
//

import UIKit

class TabVController : UITabBarController{
    @objc
    func twitterAction() {
        let para1:String=(Int(favorite[favlistnumber].data.timelines[0].intervals[0].values.temperature*9/5+32)).description
        var para2:String=""
        let weathercodetmp=favorite[favlistnumber].data.timelines[0].intervals[0].values.weatherCode.description
        for i in tagweather{
            if(weathercodetmp==i[0]){
                para2=i[1]
            }
        }
        let twitterurl:String="https://twitter.com/intent/tweet?text="+"The+current+temperature+at+Los+Angeles+is+"+para1+"+%C2%B0F.+The+weather+conditions+are+"+para2+"+%23CSCI571WeatherForecast"
        
        if let url = URL(string:twitterurl) {
            UIApplication.shared.open(url)
        }
        print(twitterurl)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let twitterbutton = UIBarButtonItem.init(
              image: UIImage(named: "twitter"),
              style: .plain,
              target: self,
              action: #selector(twitterAction)
        )
//        let vc = ViewController()
//        navigationItem.titleView = UILabel()
        if(flag==1){
            navigationItem.title="Las Vegas"
        }
        if(flag==2){
            navigationItem.title = "Bonner Springs"
        }
        else{
            navigationItem.title = "Los Angeles"
            
        }
        
        navigationItem.rightBarButtonItem = twitterbutton;
        
    }
}
