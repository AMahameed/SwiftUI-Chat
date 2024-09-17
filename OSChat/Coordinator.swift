//
//  Coordinator.swift
//  OSChat
//
//  Created by Abdallah Mahameed on 15/09/2024.
//

import UIKit


class Coordinator: ObservableObject {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showPostVC() {
        let postVC = PostVC()

        postVC.modalPresentationStyle = .fullScreen
        postVC.modalTransitionStyle = .crossDissolve
        viewController?.present(postVC, animated: true, completion: nil)
    }
}
