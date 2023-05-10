//
//  BackgroundDesignView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-09.
//

import SwiftUI

struct BackgroundDesignView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 50){
            Rectangle()
                .foregroundColor(CustomColor.goldenBrown)
                .frame(width: 200, height: 25)
            Rectangle()
                .foregroundColor(CustomColor.chestNut)
                .frame(width: 150, height: 25)
            Rectangle()
                .foregroundColor(CustomColor.dun)
                .frame(width: 100, height: 25)
           
            Spacer()
                .frame(maxWidth: .infinity)
                
            
            Rectangle()
                .foregroundColor(CustomColor.dun)
                .frame(width: 100, height: 25)
            Rectangle()
                .foregroundColor(CustomColor.chestNut)
                .frame(width: 150, height: 25)
            Rectangle()
                .foregroundColor(CustomColor.goldenBrown)
                .frame(width: 200, height: 25)
                
      
        }.opacity(0.6)
      
    }
}

struct BackgroundDesignView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundDesignView()
    }
}
