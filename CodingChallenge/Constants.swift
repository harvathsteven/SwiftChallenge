//
//  Constants.swift
//  CodingChallenge
//
//  Created by Steven Harvath on 8/5/16.
//  Copyright © 2016 Steven Harvath. All rights reserved.
//

import Foundation

struct Constants {
    
    //Reuse Identifier
    static let clinicCellResuseIdentifier = "Clinic Cell"
    
    //Title Strings
    static let isPreferred = "Is Preferred:"
    static let locationDistance = "Location Distance:"
    static let map = "Image Clinic Map"
    static let clinics = "Image Clinics"
    
    //Segues
    static let clinicToDetailSegue = "ClinicToDetail"
    static let detailToMapSegue = "DetailToMap"
    
    //Caching
    static let clinicListCacheName = "ClinicCache"
    static let clinicListCacheObjectKey = "clinics"
    static let clinicListFileName = "clinicList"
    
}
