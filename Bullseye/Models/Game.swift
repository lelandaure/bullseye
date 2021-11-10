//
//  Game.swift
//  Bullseye
//
//  Created by Luis Enrique Landaure Vargas on 4/11/21.
//

import Foundation

struct Game{
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int{
        100 - abs(sliderValue - self.target)
    }
}
