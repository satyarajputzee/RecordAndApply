//
//  CircleWithDotsView.swift
//  VoiceEffect
//
//  Created by Satya on 05/11/23.
//
import UIKit

class CircleWithDotsView: UIView {
    
    class func drawMultipleDottedCircles2(center: CGPoint, numberOfCircles: Int, minRadius: CGFloat, maxRadius: CGFloat, dotSize: CGFloat) -> UIImage {
        // Calculate the image size to fit all circles
        let imageSize = CGSize(width: (maxRadius + dotSize) * 2, height: (maxRadius + dotSize) * 2)
        
        // Create a graphics context
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        
        // Get the current graphics context
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        context.setFillColor(UIColor.green.cgColor)
        // Draw each dotted circle
        for i in 0..<numberOfCircles {
            let radius = minRadius + CGFloat(i) * ((maxRadius - minRadius) / CGFloat(numberOfCircles - 1))
            let dotCount = Int(2 * .pi * radius / (dotSize * 2))
            let dotSpacing = (2 * .pi * radius) / CGFloat(dotCount)
            let dotRadius = dotSize / 2
            
            for j in 0..<dotCount {
                let angle = CGFloat(j) * dotSpacing
                let dotCenterX = center.x + radius * cos(angle)
                let dotCenterY = center.y + radius * sin(angle)
                let dotRect = CGRect(x: dotCenterX - dotRadius, y: dotCenterY - dotRadius+20, width: dotSize, height: dotSize)
                
                context.addEllipse(in: dotRect)
                context.drawPath(using: .fill)
            }
        }
        
        // Create an image from the graphics context
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        // End the graphics context
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
    }
    
}
