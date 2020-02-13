//
//  ContentView.swift
//  PosterKit
//
//  Created by Nien Lam on 2/6/20.
//Edit by Tianxu Zhou on 2/12/20
//  Copyright © 2020 Mobile Lab. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // State variables for toggling animation.
    @State var circleAnimation = false
    //@State var squareAnimation = false
    @State var leftLineAnimation = false
    @State var rightLineAnimation = false
    @State var textAnimation = false
    @State var equationAnimation = false
    
    @State var chinAngle = 0;
    
    var body: some View {
        ZStack {
            // Background color.
            //Color(red: 0, green: 0, blue: 0)
            Image("albert")
                .frame(width: 375, height: 812)
            // Moon and Earth images.
            VStack {
                HStack {
                    //Spacer()
                    Circle()
                        
                        .fill(Color.white.opacity(0.01))
                        .overlay(Circle().stroke(Color.white,lineWidth: circleAnimation ? 3 : 0.3))
                        .offset(x: circleAnimation ? 210 : 0, y:  circleAnimation ? 260 : 0)
                        .frame(width: 100, height: 100)
                        .scaleEffect(circleAnimation ? 1.0 : 6.0)
                        .animation(Animation.easeInOut(duration: 1.0))
                        .onTapGesture {
                            self.circleAnimation.toggle()
                    }
                    Spacer()
                }
                Spacer()
            }
            
            ZStack{
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(width: 2, height: 300)
                    .rotationEffect(leftLineAnimation ? .degrees(330) : .degrees(330),anchor: .bottomTrailing)
                    .offset(x:-45,y:25)
                    .animation(Animation.easeInOut(duration: 1.0))
                    .onTapGesture {
                        self.leftLineAnimation.toggle()
                }
                
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(width: 2, height: leftLineAnimation ? 800:300)
                    .rotationEffect(rightLineAnimation ? .degrees(390) : .degrees(330),anchor: .bottomTrailing)
                    
                    // .scaleEffect(rightLineAnimation ? 3.0 : 1.0)
                    .offset(x:leftLineAnimation ? -130:-45,y:leftLineAnimation ? -80:25)
                    
                    .animation(Animation.easeInOut(duration: leftLineAnimation ? 3.0:1.0))
                    .onLongPressGesture {
                        self.rightLineAnimation.toggle()
                        self.chinAngle+=60;
                }
                VStack(alignment:.trailing){
                    Circle()
                        
                        .fill(Color.white.opacity(0.01))
                        .overlay(Circle().stroke(Color.white,lineWidth : 1.5))
                    .frame(width: 8, height: 8)
                        .offset(x:-32,y:168)
                    
                    Text(String(chinAngle))
                        .font(.custom("Helvetica", size: 24))
                        .foregroundColor(.white)
                        .rotationEffect(rightLineAnimation ?.degrees(310): .degrees(0))
                        .offset(x: -40,y: 150)
                        .animation(Animation.easeInOut(duration: 2.0))
                  //  .rotationEffect(rightLineAnimation ? .degrees(390) : .degrees(0))
                    // .animation(Animation.easeInOut(duration: 0.3))
                }
                
                
                
            }
            
            
            
            // Title and subtitle.
            VStack() {
                //Spacer()
                VStack(alignment:.trailing) {
                    ZStack{
                        Rectangle()
                            .fill(Color.white.opacity(0.01))
                            .frame(width: 300, height: 120)
                            .onTapGesture {
                                self.equationAnimation.toggle()
                                //self.chinAngle+=1;
                        }
                        
                        HStack {
                            
                            Text("E")
                                .font(.custom("Helvetica", size: 80))
                                .foregroundColor(.white)
                                .rotationEffect(equationAnimation ?.degrees(360): .degrees(50))
                                .offset(x:equationAnimation ? -30: 0,y:equationAnimation ? 670: 0)
                                .animation(Animation.spring(dampingFraction:0.5))
                            VStack{
                                
                                Text("=")
                                    .font(.custom("Helvetica", size: 80))
                                    .foregroundColor(.white)
                                    .rotationEffect(equationAnimation ?.degrees(360): .degrees(300))
                                    .offset(x:equationAnimation ? -30: 0,y:equationAnimation ? 700: 0)
                                    .animation(Animation.spring(dampingFraction:0.225))
                                Text("M")
                                    .font(.custom("Helvetica", size: 80))
                                    .foregroundColor(.white)
                                    .rotationEffect(equationAnimation ?.degrees(360): .degrees(50))
                                    .offset(x:equationAnimation ? 40: 0,y:equationAnimation ? 620: 0)
                                    .animation(Animation.spring(dampingFraction:0.634))
                                
                            }
                            
                            
                            Text("C")
                                .font(.custom("Helvetica", size: 80))
                                .foregroundColor(.white)
                                .rotationEffect(equationAnimation ?.degrees(360): .degrees(50))
                                .offset(x:equationAnimation ? 45: 0,y:equationAnimation ? 665: 0)
                                .animation(Animation.easeInOut(duration: 0.3))
                            
                            HStack{
                                Text("2")
                                    .font(.custom("Helvetica", size: 30))
                                    .foregroundColor(.white)
                                    .rotationEffect(equationAnimation ?.degrees(360): .degrees(50))
                                    .offset(x:equationAnimation ? 60: 0,y:equationAnimation ? 630: 0)
                                    .animation(Animation.easeInOut(duration: 0.3))
                                
                            }
                        }
                    }
                    
                    
                    
                }
                
            }
            .padding(.bottom, 550)
            
            HStack{
                Spacer()
                VStack(alignment:.trailing){
                    Spacer()
                    Text("Albert Einstein")
                        .font(.custom("Helvetica", size: 20))
                        .foregroundColor(.white)
                    Text("Theory of Special Relativity")
                        .font(.custom("Helvetica", size: 12))
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom,160)
            .padding(.horizontal,50)
        }
            
        .edgesIgnoringSafeArea(.all)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
