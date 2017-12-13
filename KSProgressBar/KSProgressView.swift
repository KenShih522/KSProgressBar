//
//  KSProgressView.swift
//  KSProgressBar
//
//  Created by Shih on 23/11/2017.
//  Copyright © 2017 kenshih. All rights reserved.
//

import UIKit

public func ToRadian(degree: CGFloat) -> CGFloat {
    
    return CGFloat(Double.pi) * degree / 180.0
    
}

public func ToDegree(radian: CGFloat) -> CGFloat {
    
    return 180.0 * radian / CGFloat(Double.pi)
    
}

public func ProgressInClock(angle: CGFloat) -> UInt {
    
    return UInt(round(angle / 360.0 * 100.0))
    
}

@IBDesignable open class KSProgressView: UIView {
        
    @IBInspectable var trackColor: UIColor = UIColor.gray
    
    @IBInspectable var progressColor: UIColor = UIColor.blue
    
    let progressLabel = UILabel()
    
    let lineWidth: CGFloat = 10
    
    var path: UIBezierPath!
    
    var arcPath: UIBezierPath!
    
    var startAngle: CGFloat = 0
    
    var endAngle: CGFloat = 0
    
    @IBInspectable public var progress: UInt {

        set {
            
            endAngle = CGFloat(360.0 / 100.0 * CGFloat(newValue))
            
            self.progressLabel.text = "\(progress)%"
            
            self.setNeedsDisplay()
            
        }
        
        get {
            
            return ProgressInClock(angle: self.endAngle)
            
        }
        
    }
    
    internal func setupView() {
        
        let center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        
        self.progressLabel.bounds.size = CGSize(width: 44.0, height: 44.0)
        
        self.progressLabel.font = UIFont.systemFont(ofSize: 18.0)
        
        self.progressLabel.center = center
        
        self.progressLabel.textAlignment = .center
        
        self.progressLabel.textColor = self.progressColor
        
        self.addSubview(self.progressLabel)
        
    }
    
    override open func draw(_ rect: CGRect) {
        
        let inset = self.lineWidth / 2
        
        path = UIBezierPath(ovalIn: rect.insetBy(dx: inset, dy: inset))
        
        path.lineWidth = self.lineWidth
        
        self.trackColor.setStroke()
        
        path.stroke()
        
        self.drawProgress()

    }
    
    func drawProgress() {
        
        let inset = self.lineWidth / 2
        
        let rect = self.bounds.insetBy(dx: inset, dy: inset)
        
        let center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        
        let radius = rect.width / 2
        
        arcPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: ToRadian(degree: self.startAngle - 90), endAngle: ToRadian(degree: endAngle - 90), clockwise: true)
        
        arcPath.lineWidth = self.lineWidth
        
        self.progressColor.setStroke()
        
        arcPath.stroke()
         
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.setupView()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.setupView()
        
    }
    
    override open func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
        
        self.setupView()

    }

}
