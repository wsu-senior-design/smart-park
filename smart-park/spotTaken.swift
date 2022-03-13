//
//  spotTaken.swift
//  smart-park
//
//  Created by Tuan Nguyen on 3/13/22.
//

import SwiftUI

struct spotTaken: View {
    var body: some View {
        
        Image(systemName: "x.square.fill")
            .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            .resizable()
                .frame(width: 30, height: 30)
                .offset(y: -10)
    }
}
