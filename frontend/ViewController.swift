//
//  ViewController.swift
//  Weather
//
//  Created by wxy on 2021/11/17.
//

import UIKit
import Toast


extension ViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pagecontrol.currentPage=Int(floorf(Float(mainscrollview.contentOffset.x)/Float(mainscrollview.frame.size.width)))
       
    }
    
    
}

//
//let seconds = 4.0
//DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
//    // Put your code which should be executed with a delay here
//
//}

extension UIView {

    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
}
protocol DataDelegate{
    func addpage(number:Int)
    func removepage(number:Int)
    func changetitle()
    func putvvalue()
}



////,UISearchResultsUpdating
class ViewController: UIViewController, UISearchBarDelegate,DataDelegate {
    
    @IBOutlet weak var activityview: UIView!
    @IBOutlet weak var maintemperature: UILabel!
    @IBOutlet weak var weatherstatus: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var humiditylabel: UILabel!
    @IBOutlet weak var windspeedlabel: UILabel!
    @IBOutlet weak var visibilitylabel: UILabel!
    @IBOutlet weak var pressurelabel: UILabel!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var weatherstatus1: UIImageView!
    //    var arr=[[Any]]()
 
    @IBOutlet weak var detailbutton: UIButton!
    @IBOutlet weak var contentview: UIStackView!
    
    @IBOutlet weak var stack1: UIStackView!
    @IBOutlet weak var stack2: UIStackView!
    @IBOutlet weak var stack3: UIStackView!
    @IBOutlet weak var stack4: UIStackView!
    @IBOutlet weak var stack5: UIStackView!
    @IBOutlet weak var stack6: UIStackView!
    @IBOutlet weak var stack7: UIStackView!
    @IBOutlet weak var stack8: UIStackView!
    @IBOutlet weak var borderview: UIView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var mainscrollview: UIScrollView!
    
    @IBOutlet weak var mainbackground: UIImageView!
   
    @IBOutlet weak var t1: UILabel!
    @IBOutlet weak var t11: UIImageView!
    @IBOutlet weak var t111: UILabel!
    @IBOutlet weak var t1111: UILabel!
    @IBOutlet weak var t2: UILabel!
    @IBOutlet weak var t22: UIImageView!
    @IBOutlet weak var t222: UILabel!
    @IBOutlet weak var t2222: UILabel!
    @IBOutlet weak var t3: UILabel!
    @IBOutlet weak var t33: UIImageView!
    @IBOutlet weak var t333: UILabel!
    @IBOutlet weak var t3333: UILabel!
    @IBOutlet weak var t4: UILabel!
    @IBOutlet weak var t44: UIImageView!
    @IBOutlet weak var t444: UILabel!
    @IBOutlet weak var t4444: UILabel!
    @IBOutlet weak var t5: UILabel!
    @IBOutlet weak var t55: UIImageView!
    @IBOutlet weak var t555: UILabel!
    @IBOutlet weak var t5555: UILabel!
    @IBOutlet weak var t6: UILabel!
    @IBOutlet weak var t66: UIImageView!
    @IBOutlet weak var t666: UILabel!
    @IBOutlet weak var t6666: UILabel!
    @IBOutlet weak var t7: UILabel!
    @IBOutlet weak var t77: UIImageView!
    @IBOutlet weak var t777: UILabel!
    @IBOutlet weak var t7777: UILabel!
    @IBOutlet weak var t8: UILabel!
    @IBOutlet weak var t88: UIImageView!
    @IBOutlet weak var t888: UILabel!
    @IBOutlet weak var t8888: UILabel!
    
    @IBOutlet weak var maincontentview: UIStackView!
    
    //222222222222222
    
    @IBOutlet weak var idetailbutton: UIButton!
    @IBOutlet weak var iborderview: UIView!
    
    @IBOutlet weak var imaintemperature: UILabel!
    @IBOutlet weak var iweatherstatus: UILabel!
    @IBOutlet weak var icity: UILabel!
    @IBOutlet weak var ihumiditylabel: UILabel!
    @IBOutlet weak var iwindspeedlabel: UILabel!
    @IBOutlet weak var ivisibilitylabel: UILabel!
    @IBOutlet weak var ipressurelabel: UILabel!
    @IBOutlet weak var iscrollview: UIScrollView!
    @IBOutlet weak var iweatherstatus1: UIImageView!
    
    @IBOutlet weak var istack1: UIStackView!
    @IBOutlet weak var istack2: UIStackView!
    @IBOutlet weak var istack3: UIStackView!
    @IBOutlet weak var istack4: UIStackView!
    @IBOutlet weak var istack5: UIStackView!
    @IBOutlet weak var istack6: UIStackView!
    @IBOutlet weak var istack7: UIStackView!
    @IBOutlet weak var istack8: UIStackView!
    
    @IBOutlet weak var it1: UILabel!
    @IBOutlet weak var it11: UIImageView!
    @IBOutlet weak var it111: UILabel!
    @IBOutlet weak var it1111: UILabel!
    @IBOutlet weak var it2: UILabel!
    @IBOutlet weak var it22: UIImageView!
    @IBOutlet weak var it222: UILabel!
    @IBOutlet weak var it2222: UILabel!
    @IBOutlet weak var it3: UILabel!
    @IBOutlet weak var it33: UIImageView!
    @IBOutlet weak var it333: UILabel!
    @IBOutlet weak var it3333: UILabel!
    @IBOutlet weak var it4: UILabel!
    @IBOutlet weak var it44: UIImageView!
    @IBOutlet weak var it444: UILabel!
    @IBOutlet weak var it4444: UILabel!
    @IBOutlet weak var it5: UILabel!
    @IBOutlet weak var it55: UIImageView!
    @IBOutlet weak var it555: UILabel!
    @IBOutlet weak var it5555: UILabel!
    @IBOutlet weak var it6: UILabel!
    @IBOutlet weak var it66: UIImageView!
    @IBOutlet weak var it666: UILabel!
    @IBOutlet weak var it6666: UILabel!
    @IBOutlet weak var it7: UILabel!
    @IBOutlet weak var it77: UIImageView!
    @IBOutlet weak var it777: UILabel!
    @IBOutlet weak var it7777: UILabel!
    @IBOutlet weak var it8: UILabel!
    @IBOutlet weak var it88: UIImageView!
    @IBOutlet weak var it888: UILabel!
    @IBOutlet weak var it8888: UILabel!
    
    //33333
    
    @IBOutlet weak var jdetailbutton: UIButton!
    @IBOutlet weak var jborderview: UIView!
    
    @IBOutlet weak var jmaintemperature: UILabel!
    @IBOutlet weak var jweatherstatus: UILabel!
    @IBOutlet weak var jcity: UILabel!
    @IBOutlet weak var jhumiditylabel: UILabel!
    @IBOutlet weak var jwindspeedlabel: UILabel!
    @IBOutlet weak var jvisibilitylabel: UILabel!
    @IBOutlet weak var jpressurelabel: UILabel!
    @IBOutlet weak var jscrollview: UIScrollView!
    @IBOutlet weak var jweatherstatus1: UIImageView!
    
    @IBOutlet weak var jstack1: UIStackView!
    @IBOutlet weak var jstack2: UIStackView!
    @IBOutlet weak var jstack3: UIStackView!
    @IBOutlet weak var jstack4: UIStackView!
    @IBOutlet weak var jstack5: UIStackView!
    @IBOutlet weak var jstack6: UIStackView!
    @IBOutlet weak var jstack7: UIStackView!
    @IBOutlet weak var jstack8: UIStackView!
    
    
    
    @IBOutlet weak var jt1: UILabel!
    @IBOutlet weak var jt11: UIImageView!
    @IBOutlet weak var jt111: UILabel!
    @IBOutlet weak var jt1111: UILabel!
    @IBOutlet weak var jt2: UILabel!
    @IBOutlet weak var jt22: UIImageView!
    @IBOutlet weak var jt222: UILabel!
    @IBOutlet weak var jt2222: UILabel!
    @IBOutlet weak var jt3: UILabel!
    @IBOutlet weak var jt33: UIImageView!
    @IBOutlet weak var jt333: UILabel!
    @IBOutlet weak var jt3333: UILabel!
    @IBOutlet weak var jt4: UILabel!
    @IBOutlet weak var jt44: UIImageView!
    @IBOutlet weak var jt444: UILabel!
    @IBOutlet weak var jt4444: UILabel!
    @IBOutlet weak var jt5: UILabel!
    @IBOutlet weak var jt55: UIImageView!
    @IBOutlet weak var jt555: UILabel!
    @IBOutlet weak var jt5555: UILabel!
    @IBOutlet weak var jt6: UILabel!
    @IBOutlet weak var jt66: UIImageView!
    @IBOutlet weak var jt666: UILabel!
    @IBOutlet weak var jt6666: UILabel!
    @IBOutlet weak var jt7: UILabel!
    @IBOutlet weak var jt77: UIImageView!
    @IBOutlet weak var jt777: UILabel!
    @IBOutlet weak var jt7777: UILabel!
    @IBOutlet weak var jt8: UILabel!
    @IBOutlet weak var jt88: UIImageView!
    @IBOutlet weak var jt888: UILabel!
    @IBOutlet weak var jt8888: UILabel!
    
    
    @IBOutlet weak var autocompletetable: UITableView!
    //    let searchController = UISearchController()
    @IBOutlet weak var borderview2: UIView!
    let searchBar=UISearchBar()
    func changetitle(){
        if(favlistnumber==0){
            navigationItem.title="Los Angeles"
        }

        if(favlistnumber==1){
            navigationItem.title="Las Vegas"
        }
        if(favlistnumber==2){
            navigationItem.title="Bonner Springs"
        }
    }
    
//    @IBOutlet weak var viewWidth:NSLayoutConstraint!
//
    @IBOutlet weak var sview1: UIView!
    @IBOutlet weak var sview2: UIView!
    @IBOutlet weak var sview3: UIView!
    
    @IBOutlet weak var favbutton2: UIButton!
    @IBOutlet weak var testsearch: UIButton!
    
    @IBOutlet weak var newview: UIView!
    
    @IBOutlet weak var firstview: UIView!
    @IBOutlet weak var favbutton3: UIButton!
    var filterdata:[String]!
    
    @IBOutlet weak var buttonact: UIButton!
    
    func putvvalue(){
       
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print("\(searchText)")
        if("\(searchText)"==""){
            autocompletetable.isHidden=true
        }
        else{
            autocompletetable.isHidden=false
            var tmps:String="\(searchText)"
            tmps=tmps.replacingOccurrences(of: " ", with: "%20")
            let tmp:String="https://maps.googleapis.com/maps/api/place/autocomplete/json?input="+tmps+"&types=(cities)&key=AIzaSyD9BnEyrsA8HgeAJcisPy7Qkege1nFpltM"
            let url = URL(string: tmp)!
    //        print(url)
            var result:AutoCompleteResults?
            let task = URLSession.shared.dataTask(with: url){data, response,error in
                guard let jsondata = data else { return }
                do{
                    result=try JSONDecoder().decode(AutoCompleteResults.self, from: jsondata)
                    guard let json=result else{
                        return
                    }
                    if(json.predictions.count==0) {
                    }else{
                        let tmpval:Int=json.predictions[0].terms.count-1
                        for i in 0...tmpval{
                            if autoresult.contains(json.predictions[i].terms[0].value) {}
                            else{
                                autoresult.append(json.predictions[i].terms[0].value)
                            }
                        }
//                        print(autoresult)
                        self.filterdata=autoresult
                        DispatchQueue.main.async {
                            self.autocompletetable.reloadData()
                        }
                        
                        autoresult.removeAll()
                        
        //                favorite.append(json)
        //                favorite.append(json)
                        
        //                print(favorite[favlistnumber].data.timelines[0].intervals[0].values.humidity)
//                        self.putvalue()
                    }

                }catch{
                    print("\(error)")
                }
            }
            task.resume()
        }
    }
    
    func reqestdata(latitude:String,longtitude:String,cc:Int){
//        let url = URL(string: "https://wxynodejs.uc.r.appspot.com/?latitude=34&longtitude=114")!
        
        let url = URL(string: "http://127.0.0.1:8080/?latitude="+latitude+"&longtitude="+longtitude)!
        var result:WeatherResults?
        let task = URLSession.shared.dataTask(with: url){data, response,error in
            guard let jsondata = data else { return }
            do{
                result=try JSONDecoder().decode(WeatherResults.self, from: jsondata)
                guard let json=result else{
                    return
                }
                favorite.append(json)
                self.putvalue()

            }catch{
                print("\(error)")
            }
        }
        task.resume()
        
        let url1 = URL(string: "http://127.0.0.1:8080/current?latitude="+latitude+"&longtitude="+longtitude)!
        var result1:WeatherResultsCurrent?
        let task1 = URLSession.shared.dataTask(with: url1){data1, response,error in
            guard let jsondata1 = data1 else { return }
            do{
                result1=try JSONDecoder().decode(WeatherResultsCurrent.self, from: jsondata1)
                guard let json1=result1 else{
                    return
                }
                favoritecurrent.append(json1)
//                favorite.append(json)
//                favorite.append(json)
               
//                print(favorite[favlistnumber].data.timelines[0].intervals[0].values.humidity)
               

            }catch{
                print("\(error)")
            }
        }
        task1.resume()
    }
   

    func putvalue(){
        DispatchQueue.main.async {
            self.maintemperature.text = (Int(favorite[favlistnumber].data.timelines[0].intervals[0].values.temperature*9/5+32)).description+"°F"
            
            self.city.text = "Los Angeles"
            self.humiditylabel.text=favorite[favlistnumber].data.timelines[0].intervals[0].values.humidity.description+"%"
            self.windspeedlabel.text=favorite[favlistnumber].data.timelines[0].intervals[0].values.windSpeed.description+"mph"
            self.visibilitylabel.text=favorite[favlistnumber].data.timelines[0].intervals[0].values.visibility.description+"mi"
//            var tmpval=favorite[favlistnumber].data.timelines[0].intervals[0].values.pressureSeaLevel/33.86*100
            self.pressurelabel.text=(round(favorite[favlistnumber].data.timelines[0].intervals[0].values.pressureSeaLevel/33.86*100)/100).description+"inHg"
            
            let weathercodetmp=favorite[favlistnumber].data.timelines[0].intervals[0].values.weatherCode.description
            for i in codetoimg{
                if(weathercodetmp==i[0]){
                    self.weatherstatus1.image=UIImage(named:i[1])
                }
            }
            for i in tagweather{
                if(weathercodetmp==i[0]){
                    self.weatherstatus.text=i[1]
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
                    self.t1.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                    
                }
                if(tmp==1){
                    self.t2.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                    
                }
                if(tmp==2){
                    self.t3.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==3){
                    self.t4.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==4){
                    self.t5.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==5){
                    self.t6.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==6){
                    self.t7.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==7){
                    self.t8.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                

                let favsunrise=favitem.values.sunriseTime
                let favsunset=favitem.values.sunsetTime
                start=favsunrise.index(favsunrise.startIndex,offsetBy: 11)
                end=favsunrise.index(favsunrise.startIndex,offsetBy:16)
                range1 = start..<end
                
                
                
                if(tmp==0){
                    self.t1111.text=favsunrise[range1].description
                    self.t111.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.t11.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==1){
                    self.t2222.text=favsunrise[range1].description
                    self.t222.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.t22.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==2){
                    self.t3333.text=favsunrise[range1].description
                    self.t333.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.t33.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==3){
                    self.t4444.text=favsunrise[range1].description
                    self.t444.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.t44.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==4){
                    self.t5555.text=favsunrise[range1].description
                    self.t555.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.t55.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==5){
                    self.t6666.text=favsunrise[range1].description
                    self.t666.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.t66.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==6){
                    self.t7777.text=favsunrise[range1].description
                    self.t777.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.t77.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==7){
                    self.t8888.text=favsunrise[range1].description
                    self.t888.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.t88.image=UIImage(named:i[1])
                        }
                    }
                }
//                self.t11.image=UIImage(named:"Cloudy")
                
//                image2.image=UIImage(named:"Sunrise")
//                image3.image=UIImage(named:"Sunset")
            }
           
        }
    }
    func putvalue1(){
        DispatchQueue.main.async {
            self.imaintemperature.text = (Int(favorite[1].data.timelines[0].intervals[0].values.temperature*9/5+32)).description+"°F"
            
            self.icity.text = "Las Vegas"
            self.ihumiditylabel.text=favorite[1].data.timelines[0].intervals[0].values.humidity.description+"%"
            self.iwindspeedlabel.text=favorite[1].data.timelines[0].intervals[0].values.windSpeed.description+"mph"
            self.ivisibilitylabel.text=favorite[1].data.timelines[0].intervals[0].values.visibility.description+"mi"
//            var tmpval=favorite[1].data.timelines[0].intervals[0].values.pressureSeaLevel/33.86*100
            self.ipressurelabel.text=(round(favorite[1].data.timelines[0].intervals[0].values.pressureSeaLevel/33.86*100)/100).description+"inHg"
            
            let weathercodetmp=favorite[1].data.timelines[0].intervals[0].values.weatherCode.description
            for i in codetoimg{
                if(weathercodetmp==i[0]){
                    self.iweatherstatus1.image=UIImage(named:i[1])
                }
            }
            for i in tagweather{
                if(weathercodetmp==i[0]){
                    self.iweatherstatus.text=i[1]
                }
            }
//            self.weatherstatus.text = "Cloudy"
//            self.scrollview.contentSize=CGSize(width:360,height:400)
   
            
            for tmp in [0,1,2,3,4,5,6,7]{
                let favitem=favorite[1].data.timelines[0].intervals[tmp]
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
                    self.it1.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                    
                }
                if(tmp==1){
                    self.it2.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                    
                }
                if(tmp==2){
                    self.it3.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==3){
                    self.it4.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==4){
                    self.it5.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==5){
                    self.it6.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==6){
                    self.it7.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==7){
                    self.it8.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                

                let favsunrise=favitem.values.sunriseTime
                let favsunset=favitem.values.sunsetTime
                start=favsunrise.index(favsunrise.startIndex,offsetBy: 11)
                end=favsunrise.index(favsunrise.startIndex,offsetBy:16)
                range1 = start..<end
                
                
                
                if(tmp==0){
                    self.it1111.text=favsunrise[range1].description
                    self.it111.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.it11.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==1){
                    self.it2222.text=favsunrise[range1].description
                    self.it222.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.it22.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==2){
                    self.it3333.text=favsunrise[range1].description
                    self.it333.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.it33.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==3){
                    self.it4444.text=favsunrise[range1].description
                    self.it444.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.it44.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==4){
                    self.it5555.text=favsunrise[range1].description
                    self.it555.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.it55.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==5){
                    self.it6666.text=favsunrise[range1].description
                    self.it666.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.it66.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==6){
                    self.it7777.text=favsunrise[range1].description
                    self.it777.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.it77.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==7){
                    self.it8888.text=favsunrise[range1].description
                    self.it888.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.it88.image=UIImage(named:i[1])
                        }
                    }
                }
//                self.t11.image=UIImage(named:"Cloudy")
                
//                image2.image=UIImage(named:"Sunrise")
//                image3.image=UIImage(named:"Sunset")
            }
           
        }
    }
    func putvalue2(){
        DispatchQueue.main.async {
            self.jmaintemperature.text = (Int(favorite[2].data.timelines[0].intervals[0].values.temperature*9/5+32)).description+"°F"
            
            self.jcity.text = "Bonner Springs"
            self.jhumiditylabel.text=favorite[2].data.timelines[0].intervals[0].values.humidity.description+"%"
            self.jwindspeedlabel.text=favorite[2].data.timelines[0].intervals[0].values.windSpeed.description+"mph"
            self.jvisibilitylabel.text=favorite[2].data.timelines[0].intervals[0].values.visibility.description+"mi"
//            var tmpval=favorite[2].data.timelines[0].intervals[0].values.pressureSeaLevel/33.86*100
            self.jpressurelabel.text=(round(favorite[2].data.timelines[0].intervals[0].values.pressureSeaLevel/33.86*100)/100).description+"inHg"
            
            let weathercodetmp=favorite[2].data.timelines[0].intervals[0].values.weatherCode.description
            for i in codetoimg{
                if(weathercodetmp==i[0]){
                    self.jweatherstatus1.image=UIImage(named:i[1])
                }
            }
            for i in tagweather{
                if(weathercodetmp==i[0]){
                    self.jweatherstatus.text=i[1]
                }
            }
//            self.weatherstatus.text = "Cloudy"
//            self.scrollview.contentSize=CGSize(width:360,height:400)
   
            
            for tmp in [0,1,2,3,4,5,6,7]{
                let favitem=favorite[2].data.timelines[0].intervals[tmp]
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
                    self.jt1.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                    
                }
                if(tmp==1){
                    self.jt2.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                    
                }
                if(tmp==2){
                    self.jt3.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==3){
                    self.jt4.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==4){
                    self.jt5.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==5){
                    self.jt6.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==6){
                    self.jt7.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                if(tmp==7){
                    self.jt8.text=favstarttime[range2].description+"/"+favstarttime[range3].description+"/"+favstarttime[range1].description
                }
                

                let favsunrise=favitem.values.sunriseTime
                let favsunset=favitem.values.sunsetTime
                start=favsunrise.index(favsunrise.startIndex,offsetBy: 11)
                end=favsunrise.index(favsunrise.startIndex,offsetBy:16)
                range1 = start..<end
                
                
                
                if(tmp==0){
                    self.jt1111.text=favsunrise[range1].description
                    self.jt111.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.jt11.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==1){
                    self.jt2222.text=favsunrise[range1].description
                    self.jt222.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.jt22.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==2){
                    self.jt3333.text=favsunrise[range1].description
                    self.jt333.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.jt33.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==3){
                    self.jt4444.text=favsunrise[range1].description
                    self.jt444.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.jt44.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==4){
                    self.jt5555.text=favsunrise[range1].description
                    self.jt555.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.jt55.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==5){
                    self.jt6666.text=favsunrise[range1].description
                    self.jt666.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.jt66.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==6){
                    self.jt7777.text=favsunrise[range1].description
                    self.jt777.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.jt77.image=UIImage(named:i[1])
                        }
                    }
                }
                if(tmp==7){
                    self.jt8888.text=favsunrise[range1].description
                    self.jt888.text=favsunset[range1].description
                    for i in codetoimg{
                        if(favitem.values.weatherCode.description==i[0]){
                            self.jt88.image=UIImage(named:i[1])
                        }
                    }
                }
//                self.t11.image=UIImage(named:"Cloudy")
                
//                image2.image=UIImage(named:"Sunrise")
//                image3.image=UIImage(named:"Sunset")
            }
           
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    @objc
    func NavigateToDetail(){
        

    }
    func uisetup(){
        detailbutton.layer.cornerRadius=5
        detailbutton.layer.borderColor = CGColor(red:255,green:255,blue:255,alpha: 1)
        detailbutton.layer.borderWidth=2.0
        borderview.layer.borderWidth=1
        borderview.layer.borderColor=CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        borderview.layer.cornerRadius=5
        
        scrollview.layer.cornerRadius=5
        scrollview.layer.borderWidth=1
        scrollview.layer.borderColor=CGColor(red:255,green:255,blue:255,alpha: 1)
        stack1.backgroundColor=UIColor(white: 1, alpha: 0.5)
        stack2.backgroundColor=UIColor(white: 1, alpha: 0.5)
        stack3.backgroundColor=UIColor(white: 1, alpha: 0.5)
        stack4.backgroundColor=UIColor(white: 1, alpha: 0.5)
        stack5.backgroundColor=UIColor(white: 1, alpha: 0.5)
        stack6.backgroundColor=UIColor(white: 1, alpha: 0.5)
        stack7.backgroundColor=UIColor(white: 1, alpha: 0.5)
        stack8.backgroundColor=UIColor(white: 1, alpha: 0.5)

        stack1.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        stack2.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        stack2.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        stack3.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        stack3.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        stack4.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        stack4.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        
        
        
        //2
        self.favbutton2.setImage(UIImage(named: "close-circle"), for: .normal)
        self.favbutton2.setTitle("", for: .normal)
        self.favbutton3.setImage(UIImage(named: "close-circle"), for: .normal)
        self.favbutton3.setTitle("", for: .normal)
        self.favbutton2.addTarget(self, action: #selector(favbutton2act), for: .touchDown)
        self.favbutton3.addTarget(self, action: #selector(favbutton3act), for: .touchDown)
        
        idetailbutton.layer.cornerRadius=5
        idetailbutton.layer.borderColor = CGColor(red:255,green:255,blue:255,alpha: 1)
        idetailbutton.layer.borderWidth=2.0
        iborderview.layer.borderWidth=1
        iborderview.layer.borderColor=CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        iborderview.layer.cornerRadius=5
        iscrollview.layer.cornerRadius=5
        iscrollview.layer.borderWidth=1
        iscrollview.layer.borderColor=CGColor(red:255,green:255,blue:255,alpha: 1)
        istack1.backgroundColor=UIColor(white: 1, alpha: 0.5)
        istack2.backgroundColor=UIColor(white: 1, alpha: 0.5)
        istack3.backgroundColor=UIColor(white: 1, alpha: 0.5)
        istack4.backgroundColor=UIColor(white: 1, alpha: 0.5)
        istack5.backgroundColor=UIColor(white: 1, alpha: 0.5)
        istack6.backgroundColor=UIColor(white: 1, alpha: 0.5)
        istack7.backgroundColor=UIColor(white: 1, alpha: 0.5)
        istack8.backgroundColor=UIColor(white: 1, alpha: 0.5)
        istack1.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        istack2.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        istack2.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        istack3.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        istack3.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        istack4.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        istack4.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        
        //3
        jdetailbutton.layer.cornerRadius=5
        jdetailbutton.layer.borderColor = CGColor(red:255,green:255,blue:255,alpha: 1)
        jdetailbutton.layer.borderWidth=2.0
        jborderview.layer.borderWidth=1
        jborderview.layer.borderColor=CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        jborderview.layer.cornerRadius=5
        jscrollview.layer.cornerRadius=5
        jscrollview.layer.borderWidth=1
        jscrollview.layer.borderColor=CGColor(red:255,green:255,blue:255,alpha: 1)
        jstack1.backgroundColor=UIColor(white: 1, alpha: 0.5)
        jstack2.backgroundColor=UIColor(white: 1, alpha: 0.5)
        jstack3.backgroundColor=UIColor(white: 1, alpha: 0.5)
        jstack4.backgroundColor=UIColor(white: 1, alpha: 0.5)
        jstack5.backgroundColor=UIColor(white: 1, alpha: 0.5)
        jstack6.backgroundColor=UIColor(white: 1, alpha: 0.5)
        jstack7.backgroundColor=UIColor(white: 1, alpha: 0.5)
        jstack8.backgroundColor=UIColor(white: 1, alpha: 0.5)
        jstack1.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        jstack2.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        jstack2.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        jstack3.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        jstack3.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        jstack4.addBorder(toSide: .Top, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
        jstack4.addBorder(toSide: .Bottom, withColor: CGColor(red:0,green:0,blue:0,alpha: 0.1) , andThickness: 1.5)
//        borderview2.layer.borderWidth=1
//        borderview2.layer.borderColor=CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        detailbutton.addTarget(self, action: #selector(NavigateToDetail1), for: .touchDown)
        idetailbutton.addTarget(self, action: #selector(NavigateToDetail2), for: .touchDown)
        jdetailbutton.addTarget(self, action: #selector(NavigateToDetail3), for: .touchDown)
    }
    @objc
    func NavigateToDetail1(){
        favlistnumber=0
    }
    @objc
    func NavigateToDetail2(){
        favlistnumber=1
    }
    @objc
    func NavigateToDetail3(){
        favlistnumber=2
    }
    @objc
    func favbutton2act(){
        let cityname="Las Vegas"
        
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
        
       
        
        if(addordelete[0]==0){
            favbutton2.setImage(UIImage(named: "close-circle"), for: .normal)
            addordelete[0]=1
            pagecontrol.numberOfPages=pagecontrol.numberOfPages+1
            
            labeltext.text=cityname+" was added to the Favorite List"
//            let toast = Toast.text(cityname+" was added to the Favorite List")
////            toast.view = .black
//            toast.show()
        }else{
            
            favbutton2.setImage(UIImage(named: "plus-circle"), for: .normal)
            addordelete[0]=0
            pagecontrol.numberOfPages=pagecontrol.numberOfPages-1
//            let config = ToastConfiguration(
//                autoHide: true,
//                displayTime: 5,
//                animationTime: 0.2,
////                backgroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//            )
            labeltext.text=cityname+" was removed to the Favorite List"
//            let toast = Toast.text(cityname+" was removed from the Favorite List")
////            toast.view = .black
//            toast.show()
//
            
            self.sview2.removeFromSuperview()
            pagecontrol.currentPage=Int(floorf(Float(mainscrollview.contentOffset.x)/Float(mainscrollview.frame.size.width)))
        }
        window.addSubview(labeltext)
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            
            labeltext.removeFromSuperview()
            
        }
    }
    @objc
    func favbutton3act(){
        let cityname="Bonner Springs"
        let window = UIApplication.shared.keyWindow!
        let labeltext=UILabel()
        labeltext.frame=CGRect(x: 195, y: 700, width: 300, height: 50)
       
        labeltext.textAlignment = .center
        labeltext.layer.cornerRadius=7
        labeltext.textColor = .white
        labeltext.font = labeltext.font.withSize(20)
        labeltext.lineBreakMode = .byWordWrapping
        labeltext.numberOfLines = 2
        
        if(addordelete[1]==0){
            favbutton3.setImage(UIImage(named: "close-circle"), for: .normal)
            pagecontrol.numberOfPages=pagecontrol.numberOfPages+1
            addordelete[1]=1
            labeltext.text=cityname+" was added to the Favorite List"
            
        }else{
            favbutton3.setImage(UIImage(named: "plus-circle"), for: .normal)
            pagecontrol.numberOfPages=pagecontrol.numberOfPages-1
            
            pagecontrol.currentPage=Int(floorf(Float(mainscrollview.contentOffset.x)/Float(mainscrollview.frame.size.width)))
            addordelete[1]=0
            labeltext.text=cityname+" was removed to the Favorite List"
            self.sview3.removeFromSuperview()
        }
        window.addSubview(labeltext)
        let seconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            
            labeltext.removeFromSuperview()
            
        }
    }
    @objc
    func pageindicator(_ sender:UIPageControl){
        let currentpage=sender.currentPage
        mainscrollview.setContentOffset(CGPoint(x: CGFloat(currentpage)*view.frame.size.width, y: 0), animated: true)
    }
    @objc
    func toresult(){
        perform(#selector(advance),with: nil,afterDelay: 0)
        
        
    }
    @objc func advance(){
        let vcresult=UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "resultvc") as! ResultViewController
        vcresult.delegate=self
        navigationController?.pushViewController(vcresult, animated: true)
        if(flag==1){
            navigationItem.title="Las Vegas"
        }
        if(flag==2){
            navigationItem.title = "Bonner Springs"
        }
        else{
            navigationItem.title = "Los Angeles"
            
        }
//        let svc=SecondViewController()
//        svc.delegate=self
//        navigationController?.pushViewController(svc, animated: true)
        
    }
    func addpage(number:Int){
        if(number==1){
            self.sview2.isHidden=false
            pagecontrol.numberOfPages=pagecontrol.numberOfPages+1
        }
        if(number==2){
            self.sview3.isHidden=false
            pagecontrol.numberOfPages=pagecontrol.numberOfPages+1
        }
        
    }
    func removepage(number:Int){
        if(number==1){
            self.sview2.isHidden=true
            pagecontrol.numberOfPages=pagecontrol.numberOfPages-1
        }
        if(number==2){
            self.sview3.isHidden=true
            pagecontrol.numberOfPages=pagecontrol.numberOfPages-1
        }
        
    }
//    override func viewD(_ animated: Bool) {
//
//    @objc
//    func buttonaction(_ sender:UIButton){
//        let buttontext=sender.id
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let window = UIApplication.shared.keyWindow!
       
        navigationItem.titleView = searchBar
        
//        navigationItem.title="Los Angeles"
        
        searchBar.delegate=self
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.placeholder="Enter City Name..."
        searchBar.searchTextField.clearButtonMode = .whileEditing
        autocompletetable.isHidden=true
        autocompletetable.layer.cornerRadius=5
        filterdata=[]
        
        autocompletetable.delegate=self
        autocompletetable.dataSource=self
        
        reqestdata(latitude: "34.0522",longtitude: "118.2437",cc:0)
        reqestdata(latitude: "36.1699",longtitude: "115.1398",cc:1)
        reqestdata(latitude: "39.0597",longtitude: "94.8836",cc:2)
    
        
//        buttonact.addTarget(self, action: #selector(buttonaction(_:)), for: .touchDown)
        
        uisetup()
        mainscrollview.delegate=self
//        pagecontrol.numberOfPages=1
        pagecontrol.numberOfPages=1
        
        
    
        self.mainscrollview.isPagingEnabled=true
        self.mainscrollview.showsHorizontalScrollIndicator=false
        
        pagecontrol.addTarget(self, action: #selector(pageindicator(_:)), for: .valueChanged)
        
        
        testsearch.addTarget(self, action: #selector(toresult), for: .touchDown)
        
        let secondss = 5.0
        DispatchQueue.main.asyncAfter(deadline: .now() + secondss) {
            // Put your code which should be executed with a delay here
            
            self.putvalue1()
            self.putvalue2()
        }
//        self.activityview.frame=CGRect(x: 0, y: 0, width: 100, height: 100)
//        self.activityview.backgroundColor = .clear
//        self.activityview.frame = CGRect(x: 195, y: 400, width: 100, height: 100)
//        self.animate()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        window.addSubview(blurEffectView)
        
        
        
        let spinningcircleview=SpinningCircleView()
        let spinningcircleview2=SpinningCircleView2()
        let labeltext=UILabel()
        labeltext.frame=CGRect(x: 100, y: 300, width: 200, height: 200)
        labeltext.text="Loading..."
        labeltext.textAlignment = .center
        labeltext.textColor = .white
        labeltext.font = labeltext.font.withSize(20)
        
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

    }

    
}

class SpinningCircleView: UIView{
    let spinningcircle=CAShapeLayer()
    override init(frame:CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure(){
        frame=CGRect(x: 0, y: 0, width: 200, height: 200)
        let rect=self.bounds
        let circularPath=UIBezierPath(ovalIn: rect)
        spinningcircle.path=circularPath.cgPath
        spinningcircle.fillColor=UIColor.clear.cgColor
        spinningcircle.strokeColor=CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        spinningcircle.lineWidth=12
        spinningcircle.strokeStart=0
        spinningcircle.strokeEnd=0.5
        spinningcircle.lineCap = .round
        self.layer.addSublayer(spinningcircle)
    
        
    }
    func animate(){
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveLinear, animations: {
            self.transform=CGAffineTransform(rotationAngle: .pi)
//            CATransform3DMakeRotation(.pi,0.0,0.0,1.0)
        }){ (completed) in
            UIView.animate(withDuration: 1.5, delay: 0, options: .curveLinear, animations: {
                self.transform=CGAffineTransform(rotationAngle: 0)
            }){ (completed) in
                self.animate()
            }
        }
    }
}
class SpinningCircleView2: UIView{
    let spinningcircle2=CAShapeLayer()
    override init(frame:CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure(){
        frame=CGRect(x: 0, y: 0, width: 200, height: 200)
        
//        let rect2=CGRect(x: 0, y: 0, width: 180, height: 180)
        let circularPath2=UIBezierPath(arcCenter: CGPoint(x: self.center.x, y: self.center.y), radius: CGFloat(80), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
            
//        let circularPath2=UIBezierPath(ovalIn: rect2)
        spinningcircle2.path=circularPath2.cgPath
        spinningcircle2.fillColor=UIColor.clear.cgColor
        spinningcircle2.strokeColor=UIColor.gray.cgColor
        spinningcircle2.lineWidth=5
        spinningcircle2.strokeStart=0
        spinningcircle2.strokeEnd=0.4
        spinningcircle2.lineCap = .round
        self.layer.addSublayer(spinningcircle2)
        
        
    }
  
    func animate2(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.transform=CGAffineTransform(rotationAngle: .pi)
//            CATransform3DMakeRotation(.pi,0.0,0.0,1.0)
        }){ (completed) in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.transform=CGAffineTransform(rotationAngle: 0)
            }){ (completed) in
                self.animate2()
            }
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=filterdata[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        let cell=autocompletetable.cellForRow(at: indexPath)
//        print(cell?.textLabel?.text)
        if (cell?.textLabel?.text=="Las Vegas"){
            favlistnumber=1
            
        }
        if (cell?.textLabel?.text=="Bonner Springs"){
            favlistnumber=2
        }
        
       

        toresult()
    }
}
