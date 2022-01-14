//
//  DetailController.swift
//  Weather
//
//  Created by wxy on 2021/11/25.
//
import UIKit
import Highcharts

//,UISearchResultsUpdating
class DetailController : UIViewController{
    //1
    
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
    @IBOutlet weak var l5: UILabel!
    @IBOutlet weak var l6: UILabel!
    @IBOutlet weak var l7: UILabel!
    @IBOutlet weak var l8: UILabel!
    @IBOutlet weak var l9: UILabel!
    @IBOutlet weak var l10: UIImageView!
    @IBOutlet weak var view11: UIView!
    @IBOutlet weak var view12: UIView!
    @IBOutlet weak var view13: UIView!
    @IBOutlet weak var view21: UIView!
    @IBOutlet weak var view22: UIView!
    @IBOutlet weak var view23: UIView!
    @IBOutlet weak var view31: UIView!
    @IBOutlet weak var view32: UIView!
    @IBOutlet weak var view33: UIView!
    
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if(flag==1){
            navigationItem.title="Las Vegas"
        }
      
        //1
        self.view1.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.view2.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.view3.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.view4.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.view5.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.view6.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.view7.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.view8.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.view9.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.view1.layer.borderWidth  = 1
        self.view2.layer.borderWidth  = 1
        self.view3.layer.borderWidth  = 1
        self.view4.layer.borderWidth  = 1
        self.view5.layer.borderWidth  = 1
        self.view6.layer.borderWidth  = 1
        self.view7.layer.borderWidth  = 1
        self.view8.layer.borderWidth  = 1
        self.view9.layer.borderWidth  = 1
        self.view1.layer.cornerRadius = 5
        self.view2.layer.cornerRadius = 5
        self.view3.layer.cornerRadius = 5
        self.view4.layer.cornerRadius = 5
        self.view5.layer.cornerRadius = 5
        self.view6.layer.cornerRadius = 5
        self.view7.layer.cornerRadius = 5
        self.view8.layer.cornerRadius = 5
        self.view9.layer.cornerRadius = 5
        
        let favitem=favoritecurrent[favlistnumber].data.timelines[0].intervals[0]
        self.l1.text = favitem.values.windSpeed.description+"mph"
        self.l2.text = (round(favitem.values.pressureSeaLevel/33.86*100)/100).description+"inHg"
        self.l3.text = favitem.values.precipitationProbability.description+"%"
        self.l4.text = (Int(favitem.values.temperature*9/5+32)).description+"°F"
        
        self.l6.text = favitem.values.humidity.description+"%"
        self.l7.text = favitem.values.visibility.description+"mi"
        self.l8.text = favitem.values.cloudCover.description+"%"
        self.l9.text = favitem.values.uvIndex.description
        
        for i in codetoimg{
            if(favitem.values.weatherCode.description==i[0]){
                self.l10.image=UIImage(named:i[1])
            }
        }
        for i in tagweather{
            if(favitem.values.weatherCode.description==i[0]){
                self.l5.text = i[1]
            }
        }

        
        
    }
}


//,UISearchResultsUpdating
class WeeklyController : UIViewController{
  
    //2
    @IBOutlet weak var highchartview: UIView!
    @IBOutlet weak var bgview: UIView!
    @IBOutlet weak var weatherstatus: UILabel!
    @IBOutlet weak var weatherinfoview: UIView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var weatherstatus1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(flag==1){
            navigationItem.title="Las Vegas"
        }
        //2
        weatherinfoview.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        weatherinfoview.layer.borderWidth = 1
        weatherinfoview.layer.cornerRadius = 5
        let favitem=favoritecurrent[favlistnumber].data.timelines[0].intervals[0]
        
        for i in codetoimg{
            if(favitem.values.weatherCode.description==i[0]){
                self.weatherstatus1.image=UIImage(named:i[1])
            }
        }
        self.label2.text = (Int(favitem.values.temperature*9/5+32)).description+"°F"
        
       
        
        
        
        var chartView: HIChartView!
        chartView = HIChartView(frame: CGRect(x: 0,y: 0,width: 390,height: 300))
        let options = HIOptions()
        let chart = HIChart()
        chart.type = "line"
        options.chart = chart
        let title = HITitle()
        title.text = "Temperature Variation by Day"

//        let subtitle = HISubtitle()
//        subtitle.text = "Team statistics"
        options.title = title
//        options.subtitle = subtitle
        let xAxis = HIXAxis()
        
//        xAxis.categories = [
//          "0",
//          "5",
//          "10"
//        ]
        options.xAxis = [xAxis]

        let yAxis = HIYAxis()
        yAxis.min = 30
        yAxis.max = 65
        yAxis.title = HITitle()
        yAxis.title.text = "Temperature"
        options.yAxis = [yAxis]
        let tooltip = HITooltip()

        tooltip.shared = true
        tooltip.useHTML = true
        tooltip.valueSuffix="°F"
//        tooltip.formatter=HIFunction()
        
        options.tooltip = tooltip
        
//        HISeries
        let temperature = HIColumn()
//        let x=HIColumn()
        
        temperature.data = []
        for i in [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]{
            let tmp1=Float(round(favorite[favlistnumber].data.timelines[0].intervals[i].values.temperatureMin*9/5+32)*100)/100
            let tmp2=Float(round(favorite[favlistnumber].data.timelines[0].intervals[i].values.temperatureMax*9/5+32)*100)/100
            temperature.data.append(
                [tmp1,tmp2]
            )
        }
//        series1.name="point1"
        
//                [favorite[0].data.timelines[0].intervals[i].values.temperatureMin,favorite[0].data.timelines[0].intervals[i].values.temperatureMax]
//            HIMarker()
        temperature.type="arearange"
        temperature.name="Temperature"
        temperature.marker=HIMarker()
        temperature.marker.fillColor=HIColor(rgba:0,green: 0,blue: 0,alpha: 1)
        
//        series1
//        series1.
//        series1.marker.fillColor=HIColor(rgba:255,green: 255,blue: 255,alpha: 1)
//        series1.colorKey="colorValue"
//        series1.colorKey="y"
//        series1.marker.fillColor=HIColor(rgba:255,green: 255,blue: 255,alpha: 1)
        
//        let tmpcoloraxis=HIColorAxis()
//        series1.lineWidth=0
        
//        series1.colorAxis=tmpcoloraxis
//        series1.color=HIColor(rgb: Int32, green: <#T##Int32#>, blue: <#T##Int32#>)
//        series1.borderColor=HIColor(rgb: <#T##Int32#>, green: <#T##Int32#>, blue: <#T##Int32#>)
//        let tmpcolor=HIColor(rgba:220,green: 220,blue: 220,alpha: 1)
//        let tmpcoloraxis=HIColorAxis()
//        tmpcoloraxis.maxColor=HIColor(rgba:231,green: 171,blue: 77,alpha: 1)
//        tmpcoloraxis.minColor=HIColor(rgba:108,green: 160,blue: 215,alpha: 1)
        
//        HISeries
        
//        options.plotOptions.series.marker.fillColor=HIColor(rgba:255,green: 255,blue: 255,alpha: 1)
//        options.colorAxis=[tmpcoloraxis]
        
        
//        series1.color = HIColor(rgba:220,green: 220,blue: 220,alpha: 1)
        
//        series2.type="arearange"
        let plotOptions = HIPlotOptions()
        plotOptions.arearange=HIArearange()
        plotOptions.arearange.fillColor=HIColor(linearGradient: ["x1": 0,
                                                                 "y1": 0,
                                                                 "x2": 0,
                                                                 "y2": 1], stops: [[0, "rgb(231,171,77)"],
                                                                                   [0.7, "rgb(108,160,215)"]])
//        plotOptions.series.marker.fillColor=HIColor(rgba:231,green: 171,blue: 77,alpha: 1)
                
//        plotOptions.series.marker.color=HIColor(rgba:255,green: 255,blue: 255,alpha: 1)
//        plotOptions.column = HIColumn()
//        plotOptions.column.pointPadding = 0.2
//        plotOptions.column.borderWidth = 0
        options.plotOptions = plotOptions

//        options.plotOptions = plotOptions
//        options.series = "arearange"
        options.series = [temperature]
        
        chartView.options = options
        self.highchartview.addSubview(chartView)
        
     
        
    }
}


//,UISearchResultsUpdating
class WeatherDataController : UIViewController{
    //3
    @IBOutlet weak var weatherbg2: UIView!
    @IBOutlet weak var weatherstatus2: UIView!
    @IBOutlet weak var pv: UILabel!
    @IBOutlet weak var hv: UILabel!
    @IBOutlet weak var cv: UILabel!
    @IBOutlet weak var highchart2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if(flag==1){
            navigationItem.title="Las Vegas"
        }
        
        //3
        weatherstatus2.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        weatherstatus2.layer.borderWidth=1
        weatherstatus2.layer.cornerRadius=5
      
        let favitem=favoritecurrent[favlistnumber].data.timelines[0].intervals[0]
        print(favlistnumber)
        self.pv.text=favitem.values.precipitationProbability.description+"%"
        self.hv.text=favitem.values.humidity.description+"%"
        self.cv.text=favitem.values.cloudCover.description+"%"
        
        
        var chartView2: HIChartView!
        chartView2 = HIChartView(frame: CGRect(x: 0,y: 0,width: 390,height: 410))
        let options2 = HIOptions()
        let chart2 = HIChart()
        chart2.type = "solidgauge"
//        options2.chart = chart2
        let title2 = HITitle()
        title2.text = "Weather Data"

//        let subtitle2 = HISubtitle()
//        subtitle2.text = "Team statistics"
        options2.title = title2
//        options2.subtitle = subtitle2
//        let xAxis2 = HIXAxis()
//        xAxis2.categories = [
//          "Goals",
//          "Assists",
//          "Shots On Goal",
//          "Shots"
//        ]
//        options2.xAxis = [xAxis2]

        let yAxis2 = HIYAxis()
        yAxis2.min = 0
        yAxis2.max=100
//        yAxis2.title = HITitle()
//        yAxis2.title.text = "Number"
        yAxis2.lineWidth = 0
        yAxis2.tickPositions = []
        options2.yAxis = [yAxis2]
        
        
        let plotOptions2 = HIPlotOptions()
        plotOptions2.solidgauge=HISolidgauge()
        plotOptions2.solidgauge.dataLabels=[HIDataLabels()]
        plotOptions2.solidgauge.dataLabels[0].enabled=false
        plotOptions2.solidgauge.linecap="rounnd"
        plotOptions2.solidgauge.stickyTracking=false
        plotOptions2.solidgauge.rounded=true
//        plotOptions2.lineCap="round"
//        plotOptions2.rounded=true
        
//        plotOptions2
//        plotOptions2.column = HIColumn()
//        plotOptions2.column.pointPadding = 0.2
//        plotOptions2.column.borderWidth = 0
        options2.plotOptions = plotOptions2

        let pane=HIPane()
        pane.startAngle=0
        pane.endAngle=360
        let tmpbg1=HIBackground()
        tmpbg1.outerRadius="112%"
        tmpbg1.innerRadius="88%"
        tmpbg1.borderWidth=0
        tmpbg1.backgroundColor=HIColor(rgba: 124, green: 181, blue: 236, alpha: 0.3)
        let tmpbg2=HIBackground()
        tmpbg2.outerRadius="87%"
        tmpbg2.innerRadius="63%"
        tmpbg2.borderWidth=0
        tmpbg2.backgroundColor=HIColor(rgba: 67, green: 70, blue: 72, alpha: 0.3)
        let tmpbg3=HIBackground()
        tmpbg3.outerRadius="62%"
        tmpbg3.innerRadius="38%"
        tmpbg3.borderWidth=0
        tmpbg3.backgroundColor=HIColor(rgba: 144, green: 237, blue: 125, alpha: 0.3)
        pane.background=[tmpbg1,tmpbg2,tmpbg3]
//        pane.background=[["outerRadius":"112%","innerRadius":"88%","borderWidth":0,"backgroundColor":HIColor(rgba: 124, green: 181, blue: 236, alpha: 0.3)]
//                         ,["outerRadius":"87%","innerRadius":"63%","borderWidth":0,"backgroundColor":HIColor(rgba: 124, green: 181, blue: 236, alpha: 0.3)],
//                         ["outerRadius":"62%","innerRadius":"38%","borderWidth":0,"backgroundColor":HIColor(rgba: 124, green: 181, blue: 236, alpha: 0.3)]]
        
        
        let chumidity = HISeries()
        chumidity.name = "Humidity"
        chumidity.data = [["radius":"112%","innerRadius":"88%","y":favoritecurrent[favlistnumber].data.timelines[0].intervals[0].values.humidity,"color":"#7cb5ec"]]
        
        let cprecipitation = HISeries()
        cprecipitation.name = "Precipitation"
        cprecipitation.data = [["radius":"87%","innerRadius":"63%","y":favoritecurrent[favlistnumber].data.timelines[0].intervals[0].values.precipitationProbability,"color":"#434348"]]

    
        let ccloudcover = HISeries()
        ccloudcover.name = "Cloud Cover"
        ccloudcover.data = [["radius":"62%","innerRadius":"38%","y":favoritecurrent[favlistnumber].data.timelines[0].intervals[0].values.cloudCover,"color":"#90ed7d"]]

        
        options2.series = [chumidity, cprecipitation,  ccloudcover]
        let tooltip2 = HITooltip()
        
        tooltip2.shared = true
        tooltip2.useHTML = true
        tooltip2.borderWidth=0
        tooltip2.backgroundColor=HIColor(rgba: 0, green: 0, blue: 0, alpha: 0)
        tooltip2.shadow=HIShadowOptionsObject()
        tooltip2.shadow.color="none"
        tooltip2.style=HICSSObject()
        tooltip2.style.fontSize="16px"
        tooltip2.valueSuffix="%"
        tooltip2.pointFormat="{series.name}<br><span style='font-size:2em; color: {point.color}; font-weight: bold'>{point.y}</span>"
        tooltip2.positioner=HIFunction()
        tooltip2.positioner.jsFunction="function (labelWidth) {  return { x: (this.chart.chartWidth - labelWidth) / 2, y: (this.chart.plotHeight / 2) + 15};}"
        
        options2.tooltip = tooltip2
        options2.pane=pane
        
       
        chart2.events=HIEvents()
        chart2.events.render=HIFunction()
        chart2.events.render.jsFunction="               function renderIcons() {     this.series[0].icon.translate(                this.chartWidth / 2 - 10,                this.plotHeight / 2 - this.series[0].points[0].shapeArgs.innerR -                    (this.series[0].points[0].shapeArgs.r - this.series[0].points[0].shapeArgs.innerR) / 2            );                               if (!this.series[1].icon) {                this.series[1].icon = this.renderer.path(                    ['M', -8, 0, 'L', 8, 0, 'M', 0, -8, 'L', 8, 0, 0, 8,'M', 8, -8, 'L', 16, 0, 8, 8]                )                    .attr({stroke: '#ffffff','stroke-linecap': 'round','stroke-linejoin': 'round','stroke-width': 2,zIndex: 10                    })                    .add(this.series[2].group);            }            this.series[1].icon.translate(                this.chartWidth / 2 - 10,                this.plotHeight / 2 - this.series[1].points[0].shapeArgs.innerR -                    (this.series[1].points[0].shapeArgs.r - this.series[1].points[0].shapeArgs.innerR) / 2            );                             if (!this.series[2].icon) {                this.series[2].icon = this.renderer.path(['M', 0, 8, 'L', 0, -8, 'M', -8, 0, 'L', 0, -8, 8, 0])                    .attr({stroke: '#303030','stroke-linecap': 'round','stroke-linejoin': 'round','stroke-width': 2,zIndex: 10                    })                    .add(this.series[2].group);            }                   this.series[2].icon.translate(                this.chartWidth / 2 - 10,                this.plotHeight / 2 - this.series[2].points[0].shapeArgs.innerR -                    (this.series[2].points[0].shapeArgs.r - this.series[2].points[0].shapeArgs.innerR) / 2                   );               }"
        chart2.height="110%"
     
        options2.chart=chart2
        chartView2.options = options2
        self.highchart2.addSubview(chartView2)
        
        
    }
}

