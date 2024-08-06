//
//  ThermometerSummaryView.swift
//  ThermoSmart
//
//  Created by Vishal Manhas on 05/08/24.
//

import SwiftUI

struct ThermometerSummaryView: View {
    var status:Status
    var showStatus:Bool
    var temp:CGFloat
    var body: some View {
        VStack(spacing: 0){
            Text(status.rawValue)
                .font(.headline)
                .foregroundColor(.white)
                .opacity(showStatus ? 0.6 : 0.0)
                .animation(.easeIn(duration: 0.5), value: showStatus)
            Text("\(temp , specifier: "%.0f")")
                .font(.system(size: 54))
                .foregroundColor(.white)
            
            Image(systemName: "leaf.fill")
                .font(.title2.bold())
                .foregroundColor(.green)
            
        }
        .padding(.top,40)
    }
}

#Preview {
    ThermometerSummaryView(status: .heating, showStatus: true, temp: 22)
        .background(Color("Background"))
}
