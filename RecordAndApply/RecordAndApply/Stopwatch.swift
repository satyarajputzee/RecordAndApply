//
//  Stopwatch.swift
//  RecordAndApply
//
//  Created by Satya Priya Rajput on 14/10/23.
//

import Foundation

class Stopwatch {
    
    var startTime : Date?
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start() {
        startTime = Date()
    }
    
    func stop() {
        startTime = nil
    }
}
