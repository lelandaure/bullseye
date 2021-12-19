//
//  Shapes.swift
//  Bullseye
//
//  Created by Luis Enrique Landaure Vargas on 22/11/21.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            Circle()
                .strokeBorder(Color.blue, lineWidth: 10.0)
                .frame(width: 200.0, height: 100.0)
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: 200.0, height: 100.0)
            Capsule()
                .fill(Color.blue)
                .frame(width: 200.0, height: 100.0)
            Ellipse()
                .fill(Color.blue)
                .frame(width: 200.0, height: 100.0)
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
