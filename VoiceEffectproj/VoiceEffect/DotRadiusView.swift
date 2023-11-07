//
//  DotRadiousView.swift
//  VoiceEffect
//
//  Created by Satya on 05/11/23.
//

import UIKit

class DotRadiusView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let context = UIGraphicsGetCurrentContext() {
            // Define the center of the circle
            let centerX = rect.size.width / 2
            let centerY = rect.size.height / 2
            let centerPoint = CGPoint(x: centerX, y: centerY)
            
            // Define the radius of the circle
            let circleRadius = min(rect.size.width, rect.size.height) / 2 - 100
            
            // Call the function to draw the dots
            for j in 0..<36 {
                let amplitude = Int.random(in: 3...8)
                    for i in 0..<8 {
                        drawDotsAlongRadius(center: centerPoint, radius: circleRadius + CGFloat(10 * i), degree: j,i:i, amplitude: amplitude, in: context)
                    }
            }
        }
    }
    
    func drawDotsAlongRadius(center: CGPoint, radius: CGFloat,degree: Int ,i: Int, amplitude: Int, in context: CGContext) {
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
