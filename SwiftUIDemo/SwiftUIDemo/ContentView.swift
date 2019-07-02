//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by gaojun on 2019/7/1.
//  Copyright © 2019 gaojun. All rights reserved.
//

import SwiftUI
@available(iOS 13.0, *)
struct ContentView : View {
    var body: some View {
        Text("Hello SwiftUI")
    }
}

#if DEBUG
@available(iOS 13.0, *)
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
