//
//  ImagePickAndDisplaySwiftUIView.swift
//  SwiftUI-Device-Image
//
//  Created by Kazuya Ueoka on 2019/12/20.
//  Copyright © 2019 fromKK. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

struct ImagePickAndDisplaySwiftUIView: View {
    @State var image: UIImage?
    @State var showImagePicker: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            if image == nil {
                Rectangle()
                    .frame(width: 300, height: 300, alignment: .top)
            } else {
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300, alignment: .top)
                    .clipped()
            }
            Button(action: {
                self.showImagePicker = true
            }) {
                Text("Image Select")
            }
        }.sheet(isPresented: $showImagePicker) {
            ImagePickerView(image: self.$image)
        }
    }
}

struct ImagePickAndDisplaySwiftUIView_Preview: PreviewProvider {
    static var previews: some View {
        return ImagePickAndDisplaySwiftUIView()
    }
}
