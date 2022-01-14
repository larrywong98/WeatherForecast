//
//  ResultViewController.swift
//  Weather
//
//  Created by wxy on 2021/12/9.
//

import Foundation
import UIKit
import Toast

class ResultViewController:UIViewController{
    //result
    @IBOutlet weak var rmaintemperature: UILabel!
    @IBOutlet weak var rweatherstatus: UILabel!
    @IBOutlet weak var rcity: UILabel!
    @IBOutlet weak var rhumiditylabel: UILabel!
    @IBOutlet weak var rwindspeedlabel: UILabel!
    @IBOutlet weak var rvisibilitylabel: UILabel!
    @IBOutlet weak var rpressurelabel: UILabel!
    
    @IBOutlet weak var rweatherstatus1: UIImageView!
    
    @IBOutlet weak var rdetailbutton: UIButton!
    @IBOutlet weak var rborderview: UIView!
    @IBOutlet weak var rscrollview: UIScrollView!
    
    @IBOutlet weak var rt1: UILabel!
    @IBOutlet weak var rt11: UIImageView!
    @IBOutlet weak var rt111: UILabel!
    @IBOutlet weak var rt1111: UILabel!
    @IBOutlet weak var rt2: UILabel!
    @IBOutlet weak var rt22: UIImageView!
    @IBOutlet weak var rt222: UILabel!
    @IBOutlet weak var rt2222: UILabel!
    @IBOutlet weak var rt3: UILabel!
    @IBOutlet weak var rt33: UIImageView!
    @IBOutlet weak var rt333: UILabel!
    @IBOutlet weak var rt3333: UILabel!
    @IBOutlet weak var rt4: UILabel!
    @IBOutlet weak var rt44: UIImageView!
    @IBOutlet weak var rt444: UILabel!
    @IBOutlet weak var rt4444: UILabel!
    @IBOutlet weak var rt5: UILabel!
    @IBOutlet weak var rt55: UIImageView!
    @IBOutlet weak var rt555: UILabel!
    @IBOutlet weak var rt5555: UILabel!
    @IBOutlet weak var rt6: UILabel!
    @IBOutlet weak var rt66: UIImageView!
    @IBOutlet weak var rt666: UILabel!
    @IBOutlet weak var rt6666: UILabel!
    @IBOutlet weak var rt7: UILabel!
    @IBOutlet weak var rt77: UIImageView!
    @IBOutlet weak var rt777: UILabel!
    @IBOutlet weak var rt7777: UILabel!
    @IBOutlet weak var rt8: UILabel!
    @IBOutlet weak var rt88: UIImageView!
    @IBOutlet weak var rt888: UILabel!
    @IBOutlet weak var rt8888: UILabel!
    
    
    @IBOutlet weak var rstack1: UIStackView!
    @IBOutlet weak var rstack2: UIStackView!
    @IBOutlet weak var rstack3: UIStackView!
    @IBOutlet weak var rstack4: UIStackView!
    @IBOutlet weak var rstack5: UIStackView!
    @IBOutlet weak var rstack6: UIStackView!
    @IBOutlet weak var rstack7: UIStackView!
    @IBOutlet weak var rstack8: UIStackView!
    @IBOutlet weak var radvbutton: UIButton!
//    let test=favorite[favlistnumber]
    var delegate:DataDelegate?
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
        
        setupscene()
        putnewvalue()
        if(favlistnumber==0){
            navigationItem.title="Los Angeles"
        }

        if(favlistnumber==1){
            navigationItem.title="Las Vegas"
        }
        if(favlistnumber==2){
            navigationItem.title="Bonner Springs"
        }
        navigationItem.rightBarButtonItem = twitterbutton;
        let window = UIApplication.shared.keyWindow!
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        let spinningcircleview=SpinningCircleView()
        let spinningcircleview2=SpinningCircleView2()
        let labeltext=UILabel()
        blurEffectView.frame = view.frame
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        window.addSubview(blurEffectView)
    
        labeltext.frame=CGRect(x: 120, y: 300, width: 150, height: 200)
       
        labeltext.textAlignment = .center
        labeltext.textColor = .white
        if(favlistnumber==1){
            labeltext.text="Fetching Weather Details for Las Vegas..."
        }else{
            labeltext.text="Fetching Weather Details for Bonner Springs..."
        }
        labeltext.font = labeltext.font.withSize(20)
        labeltext.lineBreakMode = .byWordWrapping
        labeltext.numberOfLines = 4
        
        spinningcircleview.frame=CGRect(x: 100, y: 300, width: 200, height: 200)
        spinningcircleview2.frame=CGRect(x: 100, y: 300, width: 200, height: 200)
        window.addSubview(spinningcircleview)
        window.addSubview(spinningcircleview2)
        window.addSubview(labeltext)
        
        spinningcircleview.animate()
        spinningcircleview2.animate2()
        
//        window.addSubview(self.activityview)
        let seconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            blurEffectView.removeFromSuperview()
            spinningcircleview.removeFromSuperview()
            spinningcircleview2.removeFromSuperview()
            labeltext.removeFromSuperview()
            
        }
        
        radvbutton.addTarget(self, action: #selector(ad), for: .touchDown)
        
    }
    func putnewvalue(){
        DispatchQueue.main.async {
            self.rmaintemperature.text = (Int(favorite[favlistnumber].data.timelines[0].intervals[0].values.temperature*9/5+32)).description+"°F"
            if(favlistnumber==1){
                self.rcity.text = "Las Vegas"
            }else{
                self.rcity.text = "Bonner Springs"
            }
            
                
            self.rhumiditylabel.text=favorite[favlistnumber].data.timelines[0].intervals[0].values.humidity.description+"%"
            self.rwindspeedlabel.text=favorite[favlistnumber].data.timelines[0].intervals[0].values.windSpeed.description+"mph"
            self.rvisibilitylabel.text=favorite[favlistnumber].data.timelines[0].intervals[0].values.visibility.description+"mi"
//            var tmpval=favorite[favlistnumber].data.timelines[0].intervals[0].values.pressureSeaLevel/33.86*100
            self.rpressurelabel.text=(round(favorite[favlistnumber].data.timelines[0].intervals[0].values.pressureSeaLevel/33.86*100)/100).description+"inHg"
            
            let weathercodetmp=favorite[favlistnumber].data.timelines[0].intervals[0].values.weatherCode.description
            for i in codetoimg{
                if(weathercodetmp==i[0]){
                    self.rweatherstatus1.image=UIImage(named:i[1])
                }
            }
            for i in tagweather{
                if(weathercodetmp==i[0]){
                    self.rweatherstatus.text=i[1]
                }
            }
//            self.weatherstatus.text = "Cloudy"
//            self.scrollview.contentSize=CGSize(width:360,height:400)
   
            
            for tmp in [0,1,2,3,4,5,6,7]{
                let favitem=favorite[favlistnumber].data.timelines[0].intervals[tmp]
                let favstarttime=favitem.startTime
                var start=favstarttime.index(favstarttime.startIndex,offsetBy: 0)
                var end=favstarttime.index(favstarttime.startIndex,offsetBy:4)
                var range1 = start..<end
                start=favstarttime.index(favstarttime.startIndex,offsetBy: 5)
                end=favstarttime.index(favstarttime.startIndex,offsetBy:7)
                let range2 = start..<end
                start=favstarttime.index(favstarttime.startIndex,offsetBy: 8)
                end=favstarttime.index(favstarttime.startIndex,offsetBy:10)
                let range3 = start..<end
                if(tmp==0){
                    self.rt1.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                    
                }
                if(tmp==1){
                    self.rt2.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                    
                }
                if(tmp==2){
                    self.rt3.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==3){
                    self.rt4.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==4){
                    self.rt5.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==5){
                    self.rt6.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==6){
                    self.rt7.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==7){
                    self.rt8.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                

                let favsunrise=favitem.values.sunriseTime
                let favsunset=favitem.values.sunsetTime
                start=favsunrise.index(favsunrise.startIndex,offsetBy: 11)
                end=favsunrise.index(favsunrise.startIndex,offsetBy:16)
                range1 = start..<end
                
                
                
                if(tmp==0){
                    self.rt1111.text=favsunrise[range1].description
                    self.rt111.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.rt11.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==1){
                    self.rt2222.text=favsunrise[range1].description
                    self.rt222.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.rt22.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==2){
                    self.rt3333.text=favsunrise[range1].description
                    self.rt333.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.rt33.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==3){
                    self.rt4444.text=favsunrise[range1].description
                    self.rt444.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.rt44.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==4){
                    self.rt5555.text=favsunrise[range1].description
                    self.rt555.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.rt55.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==5){
                    self.rt6666.text=favsunrise[range1].description
                    self.rt666.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.rt66.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==6){
                    self.rt7777.text=favsunrise[range1].description
                    self.rt777.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.rt77.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==7){
                    self.rt8888.text=favsunrise[range1].description
                    self.rt888.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.rt88.image=UIImage(named:i[1])
                        }
                    }
                }
//                self.t11.image=UIImage(named:"Cloudy")
                
//                image2.image=UIImage(named:"Sunrise")
//                image3.image=UIImage(named:"Sunset")
            }
           
        }
    }
    @objc
    func ad(){
        let window = UIApplication.shared.keyWindow!
        let labeltext=UILabel()
        labeltext.frame=CGRect(x: 30, y: 700, width: 300, height: 50)
       
        labeltext.textAlignment = .center
        labeltext.layer.cornerRadius=7
        labeltext.textColor = .white
        labeltext.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        labeltext.font = labeltext.font.withSize(20)
        labeltext.lineBreakMode = .byWordWrapping
        labeltext.numberOfLines = 2
        labeltext.layer.masksToBounds = true
        
        
        var cityname=""
        if(favlistnumber==1){
            cityname="Las Vegas"
        }
        else{
            cityname="Bonner Springs"
        }
        if(addordelete[2]==0){
            radvbutton.setImage(UIImage(named: "close-circle"), for: .normal)
//            let vc=UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNav")
//            vc.setview2true()
//            vc.
            delegate?.addpage(number: favlistnumber)
            
            addordelete[2]=1
            labeltext.text=cityname+" was added to the Favorite List"
//            let toast = Toast.text(cityname+" was added to the Favorite List")
        }else{
            
            radvbutton.setImage(UIImage(named: "plus-circle"), for: .normal)
            addordelete[2]=0
            delegate?.removepage(number: favlistnumber)
//            let toast = Toast.text(cityname+" was removed from the Favorite List")
//            toast.show()
            labeltext.text=cityname+" was removed from the Favorite List"
//            let toast = Toast.text(cityname+" was added to the Favorite List")
            
        }
        window.addSubview(labeltext)
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            
            labeltext.removeFromSuperview()
            
        }
    }
    @objc
    func changeid(){
        flag=1
        delegate?.changetitle()
        delegate?.putvvalue()
    }
    func setupscene(){
        radvbutton.setImage(UIImage(named: "plus-circle"), for: .normal)
        addordelete[2]=0
        radvbutton.setTitle("", for: .normal)
        rdetailbutton.layer.cornerRadius=5
        rdetailbutton.layer.borderColor = CGColor(red:255,green:255,blue:255,alpha: 1)
        rdetailbutton.layer.borderWidth=2.0
        rdetailbutton.addTarget(self, action: #selector(changeid), for: .touchDown)
        rborderview.layer.borderWidth=1
        rborderview.layer.borderColor=CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        rborderview.layer.cornerRadius=5
        rscrollview.layer.cornerRadius=5
        rscrollview.layer.borderWidth=1
        rscrollview.layer.borderColor=CGColor(red:255,green:255,blue:255,alpha: 1)
        rstack1.backgroundColor=UIColor(white: 1, alpha: 0.5)
        rstack2.backgroundColor=UIColor(white: 1, alpha: 0.5)
        rstack3.backgroundColor=UIColor(white: 1, alpha: 0.5)
        rstack4.backgroundColor=UIColor(white: 1, alpha: 0.5)
        rstack5.backgroundColor=UIColor(white: 1, alpha: 0.5)
        rstack6.backgroundColor=UIColor(white: 1, alpha: 0.5)
        rstack7.backgroundColor=UIColor(white: 1, alpha: 0.5)
        rstack8.backgroundColor=UIColor(white: 1, alpha: 0.5)
        rstack1.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        rstack2.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        rstack2.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        rstack3.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        rstack3.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        rstack4.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        rstack4.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        
      
    }
}
