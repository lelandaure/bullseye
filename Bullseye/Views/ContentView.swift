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
                InstructionsView(game: $game)
                SliderView(slider: $sliderValue)
                HitMeButton(isAlertVisable: $isAlertVisable, sliderValue: $sliderValue, game: $game)
            }
        }
    }
}

struct InstructionsView: View {
    
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the Bulldeye as close as you can to.")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var slider: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1", color: Color("TextColor"))
            Slider(value: $slider,
                   in: 1.0...100.0)
            SliderLabelText(text: "100", color: Color("TextColor"))
        }.padding()
    }
}

struct HitMeButton: View {
    
    @Binding var isAlertVisable: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            print("Hello, SwiftUI")
            isAlertVisable = true
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                    startPoint: .top,
                    endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        .alert(isPresented: $isAlertVisable,
               content:{
            let roundedValue = Int(sliderValue.rounded())
            return Alert(
                title: Text("Hello there!"),
                message: Text("The slider's value is  \(roundedValue). \n" + "You scored \(game.points(sliderValue: roundedValue)) points this round."),
                dismissButton: .default(Text("Awesome!"))
            )
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.sizeCategory, .medium)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
            .environment(\.sizeCategory, .medium)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
