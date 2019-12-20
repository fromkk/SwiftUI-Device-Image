//
//  ContentView.swift
//  SwiftUI-Device-Image
//
//  Created by Kazuya Ueoka on 2019/12/20.
//  Copyright © 2019 fromKK. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appSettings: AppSettings

    var body: some View {
        NavigationView {
            MenuView()
                .navigationBarTitle("Device Image")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
