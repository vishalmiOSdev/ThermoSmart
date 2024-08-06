//
//  ThermometerPlaceHolderView.swift
//  ThermoSmart
//
//  Created by Vishal Manhas on 05/08/24.
//

import SwiftUI

struct ThermometerPlaceHolderView: View {
    private let placeHolderSize:CGFloat = 244
    var body: some View {
        Circle()
            .fill(LinearGradient([Color("Placeholder 1"),Color("Placeholder 2")]))
            .frame(width: placeHolderSize,height: placeHolderSize)
            .shadow(color: Color("Placeholder drop shadow"), radius: 30,x: 0,y: 15)
            .overlay{
                Circle()
                    .stroke(LinearGradient([.black.opacity(0.36),.white.opacity(0.11)]),lineWidth: 0.8)
                
            }
            .overlay{
                Circle()
                    .stroke(LinearGradient([Color("Placeholder inner shadow")]),lineWidth: 2)
                    .blur(radius: 7)
                    .offset(x: 0,y: 3)
                    .mask{
                        Circle()
                            .fill(LinearGradient([.black,.clear],startPoint: .top,endPoint: .bottom))
                    }
                
            }
    }
}

#Preview {
    ThermometerPlaceHolderView()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("Background"))
}
