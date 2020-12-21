//
//  LoadingView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 21.12.20.
//

import SwiftUI

struct LoadingView: View {
    let timer = Timer.publish(every: 1.6, on: .main, in: .common).autoconnect()
    @State private var leftOffset: CGFloat = -100
    @State private var rightOffset: CGFloat = 100
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1))
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1).delay(0.2))
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1).delay(0.4))
        }
        .onReceive(timer, perform: { _ in
            swap(&self.leftOffset, &self.rightOffset)
        })
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
