//
//  PopToRootView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-08.
//

import Foundation

import UIKit
struct NavigationUtil {
    static func popToRootView() {
        findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
            .popToRootViewController(animated: true)
    }
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
    if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
    for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        return nil
    }
}
