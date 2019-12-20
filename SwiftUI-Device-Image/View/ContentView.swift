//
//  ContentView.swift
//  SwiftUI-Device-Image
//
//  Created by Kazuya Ueoka on 2019/12/20.
//  Copyright © 2019 fromKK. All rights reserved.
//

import SwiftUI

struct Menu: Identifiable {
    var id: Int
    var name: String
}

private let menus = [
    Menu(id: 0, name: "present"),
    Menu(id: 1, name: "SwiftUI")
]

struct ContentView: View {
    @EnvironmentObject var appSettings: AppSettings

    var body: some View {
        NavigationView {
            List(menus) { menu in
                if menu.id == 0 {
                    NavigationLink(menu.name, destination: ImagePickAndDisplayView().environmentObject(self.appSettings))
                } else {
                    EmptyView()
                }
            }.navigationBarTitle("Device Image")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
