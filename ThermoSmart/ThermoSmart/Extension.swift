//
//  Extension.swift
//  ThermoSmart
//
//  Created by Vishal Manhas on 05/08/24.
//

import SwiftUI

extension LinearGradient{
    init(_ colors:[Color],startPoint:UnitPoint = .topLeading,endPoint:UnitPoint = .bottomTrailing){
        self.init(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
    }
}
