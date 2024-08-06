//
//  ThermometerScaleView.swift
//  ThermoSmart
//
//  Created by Vishal Manhas on 06/08/24.
//

import SwiftUI

struct ThermometerScaleView: View {
    
    private var scaleSize:CGFloat = 276
    
    private var horizentalPadding:CGFloat = 20
    
    private var verticalPAdding:CGFloat = 25
    
    var body: some View {
        ZStack{
            ForEach(0..<21){ line in
                scaleLine(at: line)
            }
            .frame(width: scaleSize,height: scaleSize)
            
            ZStack{
                HStack{
                    Text("10°")
                    Spacer()
                    Text("30°")
                }
                
                VStack{
                    Text("20°")
                    Spacer()
                    
                }
            }.frame(width: 390 - 2 * horizentalPadding,height: 390 - 2 * verticalPAdding)
                .font(.title2)
                .foregroundColor(.white.opacity(0.3))
            
        }
    }
    func scaleLine(at line :Int)-> some View{
        VStack{
            Rectangle()
                .fill(Color("Scale Line"))
                .frame(width: 2,height: 10)
            Spacer()
        }.rotationEffect(.degrees(Double(line) * 9 - 90))
    }
}

#Preview {
    ThermometerScaleView()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("Background"))
}
