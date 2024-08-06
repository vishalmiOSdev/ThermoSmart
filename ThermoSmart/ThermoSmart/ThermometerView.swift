//
//  ThermometerView.swift
//  ThermoSmart
//
//  Created by Vishal Manhas on 05/08/24.
//

import SwiftUI

enum Status: String {
    case heating = "HEATING"
    case cooling = "COOLING"
    case reaching = "REACHING"
    
}

struct ThermometerView: View {
    
    
    @State private var  minTemp:CGFloat = 4
    @State private var  maxTemp:CGFloat = 30
    
    @State private var  degrees:CGFloat = 36
    @State private var currentTemperature:CGFloat = 0
    
    @State private var showStatus:Bool = false
    
//    @State private var  x:CGFloat = 0
//    @State private var  y:CGFloat = 0
//    @State private var  angle:CGFloat = 0
    
    private let ringSize:CGFloat = 220
    private let outDialSize:CGFloat = 200
    
    var targetTemp:CGFloat{
        return min(max(degrees / 360 * 40,minTemp),maxTemp)
    }
    
    
    var ringValue:CGFloat{
        return currentTemperature/40
    }
    
    var status:Status{
        if currentTemperature < targetTemp{
            return .heating
        }else if currentTemperature > targetTemp{
            return .cooling
        }else{
            return .reaching
        }
    }
    
    var timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
   
    var body: some View {
        ZStack{
            
            ThermometerScaleView()
            ThermometerPlaceHolderView()
               
                Circle()
                .inset(by: 5)
                .trim(from: 0.099,to: min(ringValue, 0.75))
                .stroke(LinearGradient([Color("Temperature Ring 1"),Color("Temperature Ring 2")]),style: StrokeStyle(lineWidth: 10,lineCap: .round,lineJoin: .round))
                .frame(width: ringSize,height: ringSize)
                .rotationEffect(.degrees(90))
                .animation(.linear(duration: 1), value: ringValue)
            ThermometerDialView(degree:degrees)
                .gesture(DragGesture().onChanged({ value in
                    
                    let x = min(max(value.location.x,0),outDialSize)
                    let y = min(max(value.location.y,0),outDialSize)
                    
//                    self.x = x
//                    self.y = y
                    
                    let endPoint = CGPoint(x: x, y: y)
                    let centrePoint = CGPoint(x: outDialSize / 2, y: outDialSize / 2)
                    
                    let angle = calculateAngel(centrePoint: centrePoint, endPoint: endPoint)
                    
                    
                    if angle < 36 || angle > 270{
                        return
                    }
//                    self.angle = angle
                    degrees = angle - angle.remainder(dividingBy: 9)
                   
                }))
            
            ThermometerSummaryView(status: status, showStatus: showStatus, temp: currentTemperature)
//            VStack{
//                Text("x : \(x), y: \(y)")
//                Text("angle : \(angle.formatted())")
//                Text("degrees : \(degrees.formatted())")
//                Spacer()
//            }.foregroundColor(.white)
                
        }.onAppear{
            currentTemperature = 22
            degrees = currentTemperature / 40 * 360
        }
        .onReceive(timer){ _ in
            switch status{
            case .heating:
                showStatus = true
                currentTemperature += 1
            case .cooling:
                showStatus = true
                currentTemperature -= 1
            case .reaching:
                showStatus = false
            }
        }
        .onDisappear{
            timer.upstream.connect().cancel()
        }
    }
}

#Preview {
    ThermometerView()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("Background"))
}

extension ThermometerView{
    private func calculateAngel(centrePoint:CGPoint,endPoint:CGPoint) -> CGFloat{
        let radian = atan2(endPoint.x - centrePoint.x, centrePoint.y - endPoint.y)
        let degress = 180 + (radian * 180 / .pi)
        
        return degress
    }
}
