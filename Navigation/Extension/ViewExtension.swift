//
//  ViewExtension.swift
//  Navigation
//
//  Created by Veronika Bozhko on 21.03.2023.
//

import UIKit

// MARK: - Hex color extension
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

let myColor = UIColor(hex: "#4885CC")


// MARK: - extension for indenting text in an input field
extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

// MARK: - keyboard hide extension
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

// MARK: - navbar hide extension
extension LogInViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - navbar display extension
extension PhotosViewController {
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - extension identifier
extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}
