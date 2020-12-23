//
//  LoadingView.swift
//  Misty
//
//  Created by Gene Bogdanovich on 21.12.20.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        HStack(spacing: 4) {
            Text("Loading")
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
