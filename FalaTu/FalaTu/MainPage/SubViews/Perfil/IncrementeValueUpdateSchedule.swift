//
//  IncrementeValueUpdateSchedule.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 16/10/23.
//

import Foundation

class IncrementeValueUpdateSchedule {
    var value: Int = 0
    
    let interval: TimeInterval = 24 * 60 * 60 // 24 horas em segundos
    
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { [weak self] timer in
            self?.incrementValue()
        }
    }
    
    func incrementValue() {
        value += 1
        print("Valor incrementado para \(value)")
    }
    
    deinit {
        timer?.invalidate()
    }
}
