//
//  Dots.swift
//  Lamp
//
//  Created by 亚飞 on 2021/1/28.
//

import SwiftUI

struct Dots: View {
    
    var width = UIScreen.main.bounds.width / 2
    
    var body: some View {
        
        ForEach(0...10, id: \.self) { index in
            
            Circle()
                .fill(Color("yellow"))
                .frame(width: 10, height: 10)
                .offset(x: -(width + 32) / 2)
                .rotationEffect(.init(degrees: Double(index) * 24))
        }
        .rotationEffect(.init(degrees: -30))
    }
}

struct Dots_Previews: PreviewProvider {
    static var previews: some View {
        Dots()
    }
}
