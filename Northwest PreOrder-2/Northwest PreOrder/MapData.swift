//
//  Capital.swift
//  Velaga_Labexam
//
//  Created by Velaga,Spandana on 4/11/16.
//  Copyright © 2016 Velaga,Spandana. All rights reserved.
//

import UIKit
import MapKit
class MapData: NSObject,MKAnnotation
{
    let title: String?
    let subtitle: String?
    let timing:String?
    let coordinate: CLLocationCoordinate2D
    
    
    init(title: String, subtitle: String, timing:String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.timing = timing
        self.coordinate = coordinate
        super.init()
        
    }
   


}
