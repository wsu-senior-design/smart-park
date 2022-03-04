//
//  spotOpen.swift
//  smart-park
//
//  Created by Tuan Nguyen on 3/3/22.
//

import SwiftUI

struct spotOpen: View {
    var body: some View {
        
        Image(systemName: "checkmark.square.fill")
            .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            .resizable()
                .frame(width: 30, height: 30)
                .offset(y: -10)
    }
}
