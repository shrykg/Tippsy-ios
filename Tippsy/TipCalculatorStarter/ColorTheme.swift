//
//  ColorTheme.swift
//  TipCalculatorStarter
//
//  Created by Shreyak Godala on 15/06/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

struct ColorTheme {
    
    // Class vars
    
    static let light = ColorTheme(isDefaultStatusBar: true,
                                  viewControllerBackgroundColor: .tcOffWhite,
                                  primaryTextColor: .tcCharcoal,
                                  primaryColor: .tcWhite,
                                  secondaryColor: .tcDarkBlue,
                                  accentColor: .tcHotPink,
                                  outputTextColor: .tcAlmostBlack)
    
    
    static let dark = ColorTheme(isDefaultStatusBar: false,
                                 viewControllerBackgroundColor: .tcAlmostBlack,
                                 primaryTextColor: .tcOffWhite,
                                 primaryColor: .tcMediumBlack,
                                 secondaryColor: .tcBlueBlack,
                                 accentColor: .tcSeafoamGreen,
                                 outputTextColor: .tcWhite)
    
    
    
    
    // instance vars
    let isDefaultStatusBar: Bool
    
    let viewControllerBackgroundColor: UIColor
    
    let primaryTextColor: UIColor
    
    let primaryColor: UIColor
    
    let secondaryColor: UIColor
    
    let accentColor: UIColor
    
    let outputTextColor: UIColor
    
    
    
    
    
    
    
    
}
