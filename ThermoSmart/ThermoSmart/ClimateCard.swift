//
//  ClimateCard.swift
//  ThermoSmart
//
//  Created by Vishal Manhas on 05/08/24.
//

import SwiftUI

struct ClimateCard: View {
    var iconName:String
    var index:String
    var measure:String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 22,style: .continuous)
                .fill(Color("CardBackground"))
                .shadow(color: Color("CardShadow"), radius: 40,x: 0,y: 20)
                .overlay{
                    RoundedRectangle(cornerRadius: 22,style: .continuous)
                        .stroke(.white.opacity(0.1),lineWidth: 1)
                 }
            VStack(spacing: 10){
                Image(systemName: iconName)
                    .font(.title2.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(width: 60,height: 60)
                    .background(LinearGradient([Color("Temperature Ring 1"),Color("Temperature Ring 1")],startPoint: .top,endPoint: .bottom))
                    .clipShape(Circle())
                
                VStack(spacing:8 ){
                    Text(index)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(measure)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.6)
                }
                
            }
            .padding(.vertical,20)
            .padding(.horizontal,10)
        }.frame(width: 144,height: 164)
        
       
        
    }
}

#Preview {
    ClimateCard(iconName: "humidity.fill", index: "Inside Humidity", measure: "50%")
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("Background"))
}
