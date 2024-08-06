//
//  ContentView.swift
//  ThermoSmart
//
//  Created by Vishal Manhas on 04/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("Background")
                    .ignoresSafeArea()
                ScrollView{
                    
                    ThermometerView()
                        .padding(.top,30)
                        .padding(.bottom,60)
                    VStack(spacing: 0){
                        HStack(spacing:20){
                            ClimateCard(iconName: "humidity.fill", index: "Inside Humidity", measure: "50%")
                            ClimateCard(iconName: "thermometer", index: "Outside temp.", measure: "-10°")
                        }
                        
                    }
                }
            }
            .navigationTitle("Thermostat")
            .navigationBarTitleDisplayMode(.inline)
            
        }.navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
