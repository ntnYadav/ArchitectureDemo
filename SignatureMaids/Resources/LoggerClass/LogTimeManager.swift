//  LogTimeManager.swift
//  AppLogs
//  Created by Chetu on 18/12/20.
//  Copyright © 2020 Chetu. All rights reserved.
//

import Foundation

open class LogTimeManager {
    /**
     @Description :- It is a simple singletons using a static type property, which is guaranteed to be lazily initialized only once, even when accessed across multiple threads simultaneously. This class also used the time Interval and timer class.
     @Author : Nitin Yadav
     @ Returns: return
     @Date     : 21 Dec  2020
     */
    static let sharedInstance = LogTimeManager()
    private init() {}
    
    var sendLogTimeDurationMinutes: TimeInterval = 30.0
    var timer: Timer?
    //Creates a timer and schedules it on the current run loop in the default mode.
    //   we can create and start a repeating timer to call a method like this:
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: sendLogTimeDurationMinutes, repeats: true) { _ in
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
}
