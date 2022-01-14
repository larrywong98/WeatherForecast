//
//  WeatherResult.swift
//  Weather
//
//  Created by wxy on 2021/11/22.
//

import Foundation

public struct AutoCompleteResults:Codable{
    let predictions:[predictlist]
}
public struct predictlist:Codable{
    let terms:[cityinfo]
}
public struct cityinfo:Codable{
    let value:String
}
public struct WeatherResults:Codable{
    let data:WeatherTimelines
}
public struct WeatherTimelines:Codable{
    let timelines:[WeatherQuery]
}
public struct WeatherQuery:Codable{
    let timestep: String
    let startTime:String
    let endTime:String
    let intervals:[WeatherDetails]
}
public struct WeatherDetails:Codable{
    let startTime: String
    let values: WeatherDetailsValue
                 
}
public struct WeatherDetailsValue:Codable{
    let temperature: Float
    let humidity:Float
    let windSpeed: Float
    let visibility: Float
    let temperatureMin: Float
    let temperatureMax: Float
    let weatherCode: Int
    let sunriseTime: String
    let sunsetTime: String
    let precipitationProbability: Int
    let precipitationType: Int
    let cloudCover: Float
    let pressureSeaLevel: Float
}
public struct WeatherResultsCurrent:Codable{
    let data:WeatherTimelinesCurrent
}
public struct WeatherTimelinesCurrent:Codable{
    let timelines:[WeatherQueryCurrent]
}
public struct WeatherQueryCurrent:Codable{
    let timestep: String
    let startTime:String
    let endTime:String
    let intervals:[WeatherDetailsCurrent]
}
public struct WeatherDetailsCurrent:Codable{
    let startTime: String
    let values: WeatherDetailsValueCurrent
                 
}
public struct WeatherDetailsValueCurrent:Codable{
    let temperature: Float
    let humidity:Float
    let windSpeed: Float
    let visibility: Float
    let weatherCode: Int
    let precipitationProbability: Int
    let cloudCover: Float
    let pressureSeaLevel: Float
    let uvIndex:Int
}
public var statejson=[["AL","Alabama"],["AK","Alaska"],["AZ","Arizona"],["AR","Arkansas"],["CA","California"],["CO","Colorado"],["CT","Connecticut"],["DE","Delaware"],["DC","District Of Columbia"],["FL","Florida"],["GA","Georgia"],["HI","Hawaii"],["ID","Idaho"],["IL","Illinois"],["IN","Indiana"],["IA","Iowa"],["KS","Kansas"],["KY","Kentucky"],["LA","Louisiana"],["ME","Maine"],["MD","Maryland"],["MA","Massachusetts"],["MI","Michigan"],["MN","Minnesota"],["MS","Mississippi"],["MO","Missouri"],["MT","Montana"],["NE","Nebraska"],["NV","Nevada"],["NH","New Hampshire"],["NJ","New Jersey"],["NM","New Mexico"],["NY","New York"],["NC","North Carolina"],["ND","North Dakota"],["OH","Ohio"],["OK","Oklahoma"],["OR","Oregon"],["PA","Pennsylvania"],["RI","Rhode Island"],["SC","South Carolina"],["SD","South Dakota"],["TN","Tennessee"],["TX","Texas"],["UT","Utah"],["VT","Vermont"],["VA","Virginia"],["WA","Washington"],["WV","West Virginia"],["WI","Wisconsin"],["WY","Wyoming"]]
public var week=["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday","Sunday"];
public var month=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
public var tagweather=[["4201","Heavy Rain"],["4001","Rain"],["4200","Light Rain"],["6201","Heavy Freezing Rain"],
  ["6001","Freezing Rain"],["6200","Light Freezing Rain"],["6000","Freezing Drizzle"],
  ["4000","Drizzle"],["7101","Heavy Ice Pellet"],["7000","Ice Pellets"],
  ["7102","Light Ice Pellets"],["5101","Heavy Snow"],["5000","Snow"],["5100","Light Snow"],
  ["5001","Flurries"],["8000","Thunderstorm"],["2100","Light Fog"],["2000","Fog"],["1001","Cloudy"],
  ["1102","Mostly Cloudy"],["1101","Partly Cloudy"],["1100","Mostly Clear"],["1000","Clear"]]
public var codetoimg=[["0","Unknown"],["1000", "Clear"],["1001", "Cloudy"],["1100", "Mostly Clear"],[
    "1101", "Partly Cloudy"],["1102", "Mostly Cloudy"],["2000", "Fog"],["2100", "Light Fog"],["3000", "Light Wind"],[
    "3001", "Wind"],["3002", "Strong Wind"],["4000", "Drizzle"],["4001", "Rain"],["4200", "Light Rain"],[
    "4201", "Heavy Rain"],["5000", "Snow"],["5001", "Flurries"],["5100", "Light Snow"],["5101", "Heavy Snow"],[
    "6000", "Freezing Drizzle"],["6001", "Freezing Rain"],["6200", "Light Freezing Rain"],["6201", "Heavy Freezing Rain"],[
    "7000", "Ice Pellets"],["7101", "Heavy Ice Pellets"],["7102", "Light Ice Pellets"],["8000", "Thunderstorm"]];
public var favorite:[WeatherResults]=[]
public var favoritecurrent:[WeatherResultsCurrent]=[]

public var addordelete:[Int]=[1,1,0]

public var favlistnumber=0

public var autoresult:[String]=[]

public var flag=0
