//
//  TextViews.swift
//  Bullseye
//
//  Created by Luis Enrique Landaure Vargas on 22/11/21.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct SliderLabelText: View {
    var text: String
    var color: Color
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(color)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Intructions")
            BigNumberText(text: "999")
            SliderLabelText(text: "1", color: Color("TextColor"))
        }
    }
}