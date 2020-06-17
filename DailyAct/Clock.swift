//
//  Clock.swift
//  DailyAct
//
//  Created by Faris Ali Yafie on 07/03/20.
//  Copyright © 2020 Faris Ali Yafie. All rights reserved.
//

import Foundation

class Clock {
    var second : Int
    var minute : Int
    var hour   : Int

    init(hour: Int, minute : Int, second : Int){
        self.second = second
        self.minute = minute
        self.hour = hour
    }
    
}
