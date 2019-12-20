//
//  ImagePickAndDisplayView.swift
//  SwiftUI-Device-Image
//
//  Created by Kazuya Ueoka on 2019/12/20.
//  Copyright © 2019 fromKK. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

struct ImagePickAndDisplayView: View {
    @EnvironmentObject var appSettings: AppSettings
    @ObservedObject var imagePicker = ImagePicker()

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            if imagePicker.image == nil {
                Rectangle()
                    .frame(width: 300, height: 300, alignment: .top)
            } else {
                Image(uiImage: imagePicker.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300, alignment: .top)
                    .clipped()
            }
            Button(action: {
                self.imageSelect()
            }) {
                Text("Image Select")
            }
        }
    }

    func imageSelect() {
        guard let viewController = appSettings.containerViewController else { return }
        imagePicker.pick(on: viewController)
    }
}

struct ImagePickerView_Preview: PreviewProvider {
    static var previews: some View {
        return ImagePickAndDisplayView()
    }
}
