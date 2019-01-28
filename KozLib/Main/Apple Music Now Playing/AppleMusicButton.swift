//
//  AppleMusicButton.swift
//  KozLibrary
//
//  Created by Kelvin Kosbab on 1/26/19.
//  Copyright © 2019 Kozinga. All rights reserved.
//

import UIKit

class AppleMusicButton : UIButton {}

class AppleMusicRoundedButton : UIButton {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.layer.cornerRadius = 8
    self.layer.masksToBounds = true
    self.clipsToBounds = true
  }
}
