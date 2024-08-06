//
//  ThermometerDialView.swift
//  ThermoSmart
//
//  Created by Vishal Manhas on 05/08/24.
//

import SwiftUI

struct ThermometerDialView: View {
    private let outerDialSize:CGFloat = 200
    private let innerDialSize:CGFloat = 172
    private let setpointsize:CGFloat = 15
     var degree:CGFloat = 0
    var body: some View {
        ZStack{
            Circle()
                .fill(LinearGradient([Color("Outer Dial 1"),Color("Outer Dial 2")]))
                .frame(width: outerDialSize,height: outerDialSize)
                .shadow(color: .black.opacity(0.2), radius: 60,x: 0,y: 30)
                .shadow(color: .black.opacity(0.2), radius: 16,x: 0,y: 8)
                .overlay{
                    Circle()
                        .stroke(LinearGradient([.white.opacity(0.2),.black.opacity(0.19)]),lineWidth: 1)
                }
                .overlay{
                    Circle()
                        .stroke(LinearGradient([.white.opacity(0.1)]),lineWidth: 4)
                        .blur(radius: 8)
                        .offset(x:3,y: 3)
                        .mask{
                            Circle()
                                .fill(LinearGradient([.black,.clear]))
                        }
                }
            Circle()
                .fill(LinearGradient([Color("Inner Dial 1"),Color("Inner Dial 2")]))
                .frame(width: innerDialSize,height: innerDialSize)
            
            Circle()
                .fill(LinearGradient([Color("Temperature SetPoint 1"),Color("Temperature SetPoint 2")]))
                .frame(width: setpointsize,height: setpointsize)
                .frame(width: innerDialSize,height: innerDialSize,alignment: .top)
                .offset(x: 0,y: 7.5)
                .rotationEffect(.degrees(degree + 180))
                .animation(.linear(duration: 1),value: degree)

        }
    }
}

#Preview {
    ThermometerDialView()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("Background"))
}
