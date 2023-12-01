//
//  DotRadiousView.swift
//  VoiceEffect
//
//  Created by Satya on 05/11/23.
//

import UIKit

class DotRadiusView: UIView {
     static var currentArray = [Int]()
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let context = UIGraphicsGetCurrentContext() {
            context.clear(rect)
            // Define the center of the circle
            let centerX = rect.size.width / 2
            let centerY = rect.size.height / 2
            let centerPoint = CGPoint(x: centerX, y: centerY)
            
            // Define the radius of the circle
            let circleRadius = min(rect.size.width, rect.size.height) / 2 - 100
            //var arr: [Int] = [Int]()
            
            // Call the function to draw the dots
            
            //            for i in 1..<20 {
            //                let amplitude = DotRadiusView.currentArray[i]
            //                drawDotsAlongRadius2(
            //                    center: centerPoint,
            //                    radius: circleRadius + CGFloat(12 * i),
            //                    i:i,
            //                    amplitude: amplitude,
            //                    in: context
            //                )
            //
            //            }
            for degree in 0..<36 {
                let amplitude = DotRadiusView.currentArray[degree]
                print(amplitude)
                for i in 0..<10 {
                    for j in 0..<amplitude {
                        drawDotsAlongRadius(
                            center: centerPoint,
                            radius: circleRadius + CGFloat(12 * j),
                            degree: degree,
                            i: i,
                            amplitude: j,
                            in: context
                        )
                    }
                }
                
            }
            
        }
    }
        
    
    func drawDotsAlongRadius2(center: CGPoint, radius: CGFloat,i: Int, amplitude: Int, in context: CGContext) {
        let hexColor = "#B0EC31"
        let greenColor = UIColor(hex: hexColor).cgColor
        if amplitude < i {
            context.setFillColor(UIColor.clear.cgColor) // Set the dot color
        } else {
            context.setFillColor(greenColor) // Set the dot color
        }

        for _ in 0..<i {
            let dx = Double (0.3 * Double(i))
            for degree in 0..<36 {
                let angleIncrement = .pi / CGFloat(18)
                let angle = angleIncrement * CGFloat(degree)
                let dotX = center.x + radius * cos(angle)
                let dotY = center.y + radius * sin(angle)
                let dotRect = CGRect(x: dotX - 4, y: dotY - 4, width: 8 + dx , height: 8 + dx) // Adjust the size of the dot as needed
                context.addEllipse(in: dotRect)
                context.fillPath()
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
