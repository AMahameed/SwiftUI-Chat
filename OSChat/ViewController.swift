//
//  ViewController.swift
//  OSChat
//
//  Created by Abdallah Mahameed on 15/09/2024.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let tabBarVC = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.systemGray6
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.gray
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.gray]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.lightGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        let navAppearence = UINavigationBarAppearance()
        navAppearence.configureWithDefaultBackground()
        navAppearence.backgroundColor = UIColor.systemGray6
        
        navAppearence.titleTextAttributes = [.foregroundColor: UIColor.black]
        navAppearence.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = navAppearence
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearence
        UINavigationBar.appearance().compactAppearance = navAppearence
        UINavigationBar.appearance().tintColor = .black
        
        let chatVC = ChatVC()
        let dummyVC = DummyVC()
        
        // Set up tab bar items
        chatVC.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(systemName: "bubble"), tag: 0)
        dummyVC.tabBarItem = UITabBarItem(title: "Dumbbell", image: UIImage(systemName: "dumbbell"), tag: 1)
        
        // Add the view controllers to the tab bar
        tabBarVC.viewControllers = [chatVC, dummyVC]
        
        addChild(tabBarVC)
        view.addSubview(tabBarVC.view)


        tabBarVC.view.frame = view.bounds
        tabBarVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        tabBarVC.didMove(toParent: self)
    }
}

class ChatVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let hostingVC = UIHostingController(rootView: ChatScreen().environmentObject(Coordinator(viewController: self)))
        
        addChild(hostingVC)
        view.addSubview(hostingVC.view)
        
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingVC.didMove(toParent: self)
    }
}

class DummyVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Dumbbell"
    }
}

class PostVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    @objc private func didTapBackButton() {
        dismiss(animated: true, completion: nil)
    }
}
