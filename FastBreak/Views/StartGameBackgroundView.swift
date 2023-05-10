//
//  StartGameBackgroundView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-09.
//

import SwiftUI

struct StartGameBackgroundView: View {
    var body: some View {
            VStack{
                Spacer()
                Image("playerOne")
                    .resizable()
                    .frame(width: 100, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .offset(x: -100)
                
            }
        
    }
}

struct StartGameBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameBackgroundView()
    }
}
