//
//  ContentView.swift
//  Bullseye
//
//  Created by Luis Enrique Landaure Vargas on 18/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAlertVisable = false
    @State private var sliderValue = 50.0
    
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("🎯🎯🎯\nPut the Bulldeye as close as you can to.".uppercased())
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                Text(String(game.target))
                    .kerning(-1)
                    .font(.largeTitle)
                    .fontWeight(.black)
                HStack {
                    Text("1")
                        .bold()
                    Slider(value: self.$sliderValue,
                           in: 1.0...100.0)
                    Text("100")
                        .bold()
                }
                .padding()
                Button(action: {
                    print("Hello, SwiftUI")
                    self.isAlertVisable = true
                }) {
                    Text("Hit me".uppercased())
                        .bold()
                        .font(.title3)
                }
                .padding(20.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(21.0)
                .alert(isPresented: $isAlertVisable,
                       content:{
                    let roundedValue = Int(self.sliderValue.rounded())
                    return Alert(
                        title: Text("Hello there!"),
                        message: Text("The slider's value is  \(roundedValue). \n" + "You scored \(self.game.points(sliderValue: roundedValue)) points this round."),
                        dismissButton: .default(Text("Awesome!"))
                    )
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.sizeCategory, .medium)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
