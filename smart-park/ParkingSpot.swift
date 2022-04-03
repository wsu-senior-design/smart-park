//
//  ParkingSpot.swift
//  Smart parking
//
//  Created by Trong Van  on 11/6/21.
//
import SwiftUI

struct ParkingSpot: View {
//    var globalColor = GlobalColor()             //global Variable Class
//    var width: CGFloat
//    var height: CGFloat
//    let border: [Edge]
//    init(width: Double, isActive: Bool, isTaken: Bool, border: [Edge]) {
//        self.width = CGFloat(width)
//        self.isTaken = isTaken
//        self.isActive = isActive
//        self.height = CGFloat(width * 2.2)
//        self.border = border
//    }
    
    var isActive: Bool
    var isTaken: Bool
    
    var body: some View {
        if(!isActive) {
            spotNotActive()
        }
        else if(!isTaken){
            spotOpen()
        } else {
            spotTaken()
        }
    }
}
