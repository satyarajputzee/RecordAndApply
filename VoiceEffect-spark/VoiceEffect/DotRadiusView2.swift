//
//  DotRadiusView.swift
//  VoiceEffect
//
//  Created by Satya on 05/11/23.
//

import UIKit

class DotRadiusView2: UIView {
    class func drawCurrentImage2() -> UIImage {
        // Calculate the image size to fit all circles
        let imageSize = CGSize(width: 300, height: 300)
        
        // Create a graphics context
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        
        // Get the current graphics context
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        // Define the center of the circle
        let centerX = imageSize.width / 2
        let centerY = imageSize.height / 2
        let centerPoint = CGPoint(x: centerX, y: centerY)
        
        // Define the radius of the circle
        let circleRadius = min(imageSize.width, imageSize.height) / 2 - 100
        var amplitude = 0
        // Call the function to draw the dots
        for j in 0..<36 {
             amplitude = Int.random(in: 2...8)
                for i in 0..<8 {
//                    print("amplitude \(amplitude) i = \(i) j = \(j)")
                    let hexColor = "#B0EC31"
                    let greenColor = UIColor(hex: hexColor).cgColor
                    if amplitude < i {
                        context.setFillColor(UIColor.clear.cgColor) // Set the dot color
                    } else {
                        context.setFillColor(greenColor) // Set the dot color
                    }
                    
                    let angleIncrement = .pi / CGFloat(18)
                        let angle = angleIncrement * CGFloat(j)
                    let radius = circleRadius + CGFloat(10 * i)
                        let dotX = centerX + radius * cos(angle)
                        let dotY = centerY + radius * sin(angle)
                        let dotRect = CGRect(x: dotX - 4, y: dotY - 4, width: 8, height: 8) // Adjust the size of the dot as needed
                        context.addEllipse(in: dotRect)
                        context.fillPath()
                }
        }
        // Create an image from the graphics context
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        // End the graphics context
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
    }
    
    class func drawDotsAlongRadius2(center: CGPoint, radius: CGFloat,degree: Int ,i: Int, amplitude: Int, in context: CGContext) {
        let hexColor = "#B0EC31"
        let greenColor = UIColor(hex: hexColor).cgColor
        if amplitude < i {
            context.setFillColor(UIColor.clear.cgColor) // Set the dot color
        } else {
            context.setFillColor(greenColor) // Set the dot color
        }
        
        let angleIncrement = .pi / CGFloat(18)
            let angle = angleIncrement * CGFloat(degree)
            let dotX = center.x + radius * cos(angle)
            let dotY = center.y + radius * sin(angle)
            let dotRect = CGRect(x: dotX - 4, y: dotY - 4, width: 8, height: 8) // Adjust the size of the dot as needed
            context.addEllipse(in: dotRect)
            context.fillPath()
    }
}
