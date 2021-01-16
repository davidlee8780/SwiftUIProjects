//
//  ContentView.swift
//  Shared
//
//  Created by David Lee on 14/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var size: CGFloat = UIScreen.main.bounds.height - 130
    
    var body: some View {
        ZStack {
            Color.orange
            
            Swipe()
                .cornerRadius(20)
                .padding(15)
                .offset(y: size)
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            if value.translation.height > 0 {
                                size = value.translation.height
                            } else {
                                let temp = UIScreen.main.bounds.height - 130
                                size = temp + value.translation.height
                            }
                        })
                        .onEnded({ (value) in
                            if value.translation.height > 0 {
                                if value.translation.height > 200 {
                                    size = UIScreen.main.bounds.height - 130
                                } else {
                                    size = 15
                                }
                            } else {
                                if value.translation.height < -200 {
                                    size = 15
                                } else {
                                    size = UIScreen.main.bounds.height - 130
                                }
                            }
                        })
                )
                .animation(.spring())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Swipe: View {
    
    var body: some View {
        VStack {
            VStack {
                Text("Swipe up to See More")
                    .fontWeight(.heavy)
                    .padding([.top, .bottom], 15)
            }
            
            HStack {
                Spacer()
                
                Text("Hello top")
                    .fontWeight(.heavy)
                    .padding()
            }
            
            Spacer()
            
            Text("Hello bottom")
                .fontWeight(.heavy)
                .padding()
        }
        .background(Color.white)
    }
}
