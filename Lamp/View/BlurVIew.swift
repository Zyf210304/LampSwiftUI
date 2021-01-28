//
//  BlurView.swift
//  Lamp
//
//  Created by 张亚飞 on 2021/1/28.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
        
        return view
    }
    
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
}

