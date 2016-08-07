//
//  ClinicModel.swift
//  CodingChallenge
//
//  Created by Steven Harvath on 8/5/16.
//  Copyright © 2016 Steven Harvath. All rights reserved.
//

import Foundation

class Clinic {
    
    private var type:String
    private var id:String
    private var name:String
    private var isPreferred:Bool
    private var location:Location
    
    init(type:String, id:String, name:String, isPreferred:Bool, location:Location){
        self.type = type
        self.id = id
        self.name = name
        self.isPreferred = isPreferred
        self.location = location
    }
    
    func getType() -> String { return self.type }
    func getId() -> String { return self.id }
    func getName() -> String { return self.name }
    func getIsPreferred() -> Bool { return self.isPreferred }
    func getStreetName() -> String { return self.location.streetName }
    func getCity() -> String { return self.location.city }
    func getStateCode() -> String { return self.location.stateCode }
    func getPostalCode() -> String { return self.location.postalCode }
    func getDistance() -> Double { return self.location.distance }
    func getLatitude() -> Double { return self.location.geolocation.latitude }
    func getLongtitude() -> Double { return self.location.geolocation.longitude }
    
}

struct Location {
    
    var streetName:String
    var city:String
    var stateCode:String
    var postalCode:String
    var distance:Double
    var geolocation:Geolocation
    
    init(streetName:String, city:String, stateCode:String, postalCode:String,distance:Double, geolocation:Geolocation){
        self.streetName = streetName
        self.city = city
        self.stateCode = stateCode
        self.postalCode = postalCode
        self.distance = distance
        self.geolocation = geolocation
    }
    
}

struct Geolocation{
    
    var latitude:Double
    var longitude:Double
    
    init(latitude:Double,longitude:Double){
        self.latitude = latitude
        self.longitude = longitude
    }
    
}

