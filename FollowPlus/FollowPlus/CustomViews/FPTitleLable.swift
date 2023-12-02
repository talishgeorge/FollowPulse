//
//  FPTitleLable.swift
//  FollowPlus
//
//  Created by Talish George on 2/12/2023.
//

import UIKit

class FPTitleLable: UILabel {

    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
         super.init(frame: .zero)
         self.textAlignment = textAlignment
         self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
