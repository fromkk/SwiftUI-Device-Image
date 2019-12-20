//
//  ImagePicker.swift
//  SwiftUI-Device-Image
//
//  Created by Kazuya Ueoka on 2019/12/20.
//  Copyright © 2019 fromKK. All rights reserved.
//

import UIKit
import Combine

final class ImagePicker: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate, ObservableObject {
    @Published var image: UIImage?

    func pick(on viewController: UIViewController) {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.sourceType = .photoLibrary
        imagePickerViewController.delegate = self
        viewController.present(imagePickerViewController, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        defer {
            picker.dismiss(animated: true, completion: nil)
        }
        image = info[.originalImage] as? UIImage
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
