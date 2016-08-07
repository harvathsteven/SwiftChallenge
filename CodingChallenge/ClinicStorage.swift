//
//  ClinicStorage.swift
//  CodingChallenge
//
//  Created by Steven Harvath on 8/5/16.
//  Copyright © 2016 Steven Harvath. All rights reserved.
//

import Foundation
import KeychainSwift
import SwiftyJSON
import AwesomeCache

class ClinicStorage {
    
    var clinics = [Clinic]()
    var keychain = KeychainSwift()
    var cache:NSData?
    
    init(cacheName:String, objectKey:String){
        cache = retrieveCache(cacheName, objectKey: objectKey)
        parseJsonData()
    }
    
    func getCount() -> Int {
        return self.clinics.count
    }
    
    func getClinics() -> [Clinic]{
        return self.clinics
    }
    
    private func parseJsonData(){
        
        let json = JSON(data: cache!, options: NSJSONReadingOptions.AllowFragments, error: nil)
        
        for (_,subJson) in json {
            
            guard let clnType = subJson["clinicalType"].string,
                let recs = subJson["recommendations"].array else {
                    continue
            }
            
            for (index,_) in recs.enumerate() {
                guard let id = recs[index]["id"].string,
                    let name = recs[index]["name"].string,
                    let preferred = recs[index]["preferred"].bool,
                    let streetName = recs[index]["location"]["streetName"].string,
                    let city = recs[index]["location"]["city"].string,
                    let stateCode = recs[index]["location"]["stateCode"].string,
                    let postalCode = recs[index]["location"]["postalCode"].string,
                    let locationDistance = recs[index]["location"]["locationDistance"].double,
                    let longitude = recs[index]["location"]["geoLocation"]["longitude"].double,
                    let latitude = recs[index]["location"]["geoLocation"]["latitude"].double
                    else{
                        continue
                }
                
                if keychain.get(id) == nil {
                    keychain.set(id, forKey: clnType, withAccess: .AccessibleWhenUnlocked)
                }
                
                if keychain.get(name) == nil {
                    keychain.set(name, forKey: clnType, withAccess: .AccessibleWhenUnlocked)
                }
                
                clinics.append(Clinic(type: clnType, id: id, name: name, isPreferred: preferred, location: Location(streetName: streetName, city: city, stateCode: stateCode, postalCode: postalCode, distance: locationDistance, geolocation: Geolocation(latitude: latitude, longitude: longitude
                    ))))
            }
        }

    }
    
    private func retrieveCache(name:String, objectKey:String) -> NSData{
        var cache = NSData()
        
        do {
            if let data = try Cache<NSData>(name: name).objectForKey(objectKey){
                cache = data
            }
        } catch _ {
            print("Error in retrieving cache")
        }
        
        return cache
    }
}
