//
//  ParkingSpot.swift
//  Smart parking
//
//  Created by Trong Van  on 11/6/21.
//
import SwiftUI

struct ParkingSpot: View {
    var globalColor = GlobalColor()             //global Variable Class
    var width: CGFloat
    var height: CGFloat
    var isActive: Bool
    var isTaken: Bool
    let border: [Edge]
    init(width: Double, isActive: Bool, isTaken: Bool, border: [Edge]) {
        self.width = CGFloat(width)
        self.isTaken = isTaken
        self.isActive = isActive
        self.height = CGFloat(width * 2.2)
        self.border = border
    }
    
    var body: some View {
        if(!isActive) {
            Rectangle()
                .foregroundColor(globalColor.parkNotActive)
                .frame(width: height, height: width)
                .border(width: 3, edges: border, color: globalColor.parkingLineColor)
        }
        else if(!isTaken){
            Rectangle()
                .foregroundColor(globalColor.parkNotTaken)
                .frame(width: height, height: width)
                .border(width: 3, edges: border, color: globalColor.parkingLineColor)
        } else {
            Rectangle()
                .foregroundColor(globalColor.parkTaken)
                .frame(width: height, height: width)
                .border(width: 3, edges: border, color: globalColor.parkingLineColor)
        }
    }
}
