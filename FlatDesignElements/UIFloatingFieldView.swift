//
//  UIFloatingFieldView.swift
//  FlatDesignElements
//
//  Created by RAZA on 4/12/17.
//  Copyright © 2017 RAZA. All rights reserved.
//

import UIKit

class UIFloatingFieldView: UIView {
    
    var underline:CAShapeLayer?
    var textField: UITextField!
    
    override init (frame : CGRect)
    {
        super.init(frame : frame)
        var field = UITextField(frame: frame)
        textField = field
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
