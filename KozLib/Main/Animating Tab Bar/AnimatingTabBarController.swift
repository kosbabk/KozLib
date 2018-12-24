//
//  AnimatingTabBarController.swift
//  KozLibrary
//
//  Created by Kelvin Kosbab on 12/23/18.
//  Copyright © 2018 Kozinga. All rights reserved.
//

import UIKit

class AnimatingTabBarController : BaseTabBarController {
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.delegate = self
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.cancelButtonSelected))
    
    // Configure the children
    let red = UIViewController()
    red.view.backgroundColor = .red
    red.tabBarItem = UITabBarItem(title: "RED", image: nil, selectedImage: nil)
    
    let blue = UIViewController()
    blue.view.backgroundColor = .blue
    blue.tabBarItem = UITabBarItem(title: "BLUE", image: nil, selectedImage: nil)
    
    let green = UIViewController()
    green.view.backgroundColor = .green
    green.tabBarItem = UITabBarItem(title: "GREEN", image: nil, selectedImage: nil)
    
    let yellow = UIViewController()
    yellow.view.backgroundColor = .yellow
    yellow.tabBarItem = UITabBarItem(title: "YELLOW", image: nil, selectedImage: nil)
    
    self.viewControllers = [ red, blue, green, yellow ]
  }
  
  // MARK: - Actions
  
  @objc func cancelButtonSelected() {
    self.dismissController()
  }
}

// MARK: - UITabBarControllerDelegate

extension AnimatingTabBarController : UITabBarControllerDelegate {
  
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    
    guard let fromView = selectedViewController?.view, let toView = viewController.view else {
      return false // Make sure you want this as false
    }
    
    if fromView != toView {
      UIView.transition(from: fromView, to: toView, duration: 0.3, options: [ .transitionCrossDissolve ], completion: nil)
    }
    
    return true
  }
}