//
//  Home.swift
//  Lamp
//
//  Created by 亚飞 on 2021/1/28.
//

import SwiftUI

struct Home: View {
    
    var top = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    
    var width = UIScreen.main.bounds.width / 2
    
    @State var anlge : Double = 0
    @State var on = true
    
    @State var from : Date = Date()
    @State var to : Date = Date()
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                
                Image("lamp")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                
                HStack {
                    
                    Button(action: {}, label: {
                        
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        
                        Image(systemName: "gear")
                            .font(.title2)
                            .foregroundColor(.black)
                    })
                }
                .padding()
                .padding(.top, top)
            }
            
            Text("Intensity")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding()
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                
                ZStack {
                    
                    Circle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: width, height: width)
                    
                    ZStack {
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: width - 45, height: width - 45)
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
                            .rotationEffect(.init(degrees: anlge))
                        
                        Circle()
                            .fill(Color("yellow"))
                            .frame(width: 20, height: 20)
                            .offset(x : (width - 100) / 2)
                            .rotationEffect(.init(degrees: anlge))
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged(onChanged(value:))
                            )
                            .rotationEffect(.init(degrees: -210))
                    }
                    
                    //dots .....
                    Dots()
                }
                
                HStack {
                    
                    Text("16'C")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("28'C")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                .padding(.bottom)
            }
            .padding()
            .padding(.top)
            
            HStack {
                
                Spacer()
                
                HStack(spacing: 15) {
                    
                    Text("Power Saver")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    
                    Toggle("", isOn: $on)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: Color("yellow")))
                }
                .padding(.vertical)
                .padding(.horizontal, 20)
                .background(BlurView().cornerRadius(15))
                .clipShape(Capsule())
            }
            .padding()

            HStack {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Schedule")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Text("From")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    HStack (spacing: 10, content: {
                        
                        DatePicker("", selection: $from, displayedComponents: [.hourAndMinute])
                            .labelsHidden()
                            .accentColor(.black)
                        
                        Text("to")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        DatePicker("", selection: $to, displayedComponents: [.hourAndMinute])
                            .labelsHidden()
                            .accentColor(.black)
                    })
                })
                
                Spacer()
            }
            .padding()
            
            
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
    }
    
    func onChanged(value: DragGesture.Value) {
        
        let translation = value.location
        
        let vector = CGVector(dx: translation.x, dy: translation.y)
        
        //-10 is circle radius since circle size is 20
        let radians = atan2(vector.dy - 10, vector.dx - 10)
        
        var angle = Double(radians * 180 / .pi)
        
        if angle < 0 {
            angle = 360 + angle
        }
        
        if  angle <= 240 {
            self.anlge = Double(angle)
        }
        
    }
    
    
}


