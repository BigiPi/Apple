//
//  ContentView.swift
//  Apple
//
//  Created by Павел Богданов on 23.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var alertInfo = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var rounde = 0
    @State var score = 0
    
    let midnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)
    
    struct LabelStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
             .foregroundColor(Color.orange)
             .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            
        }
        
    }
    struct ValueStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
             .foregroundColor(Color.yellow)
             .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    struct Shadow: ViewModifier{
        func body(content: Content) -> some View {
            return content
             
             .shadow(color: Color.black, radius: 5, x: 2, y: 2)
           
        }
    }
    struct ButtonStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
        .background(Image("pngwing.com (9)"), alignment: .center)
        .foregroundColor(Color.white)
        .font(Font.custom("Arial Rounded MT Bold", size: 20))

        }
        
    }
    
    
    var body: some View {
        NavigationView{
        VStack {
            // Target row  - Целевая строка
            Spacer()
            
            HStack {
                Text("Put the bulleseye as close as you can to:").modifier(LabelStyle())
                    
                Text("\(target)").modifier(ValueStyle())
            }
            Spacer()
            
            // Slider row
            HStack{
                Text("1").modifier(LabelStyle())
                    
                Slider(value: $sliderValue, in:1...100).accentColor(Color.yellow)
                Text("100").modifier(LabelStyle())
                                }
            Spacer()
            
            
            // Button row
            
            Button(action: {
                counterScore()
                counterRound()
                print("Button pressed!")
                alertIsVisible = true
            }) {
                Text("HIt Me,Krasavchik!").modifier(ButtonStyle())
                    
            }
            .alert(isPresented: $alertIsVisible) {() -> Alert in
                
                return Alert(title: Text("\(alertTitle())"), message: Text(
                    "The slider`s value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRoyund()) points this round.\n")
                             , dismissButton: .default(Text("А ну его"), action:{targetRefresh()}
                                                       
                                                      ))
            }
            
            
            Spacer()
            
            
            // Score row
            HStack{
                Button(action:{
                    startNewGame()
                }){
                    HStack{
                        
                        Image("pngwing.com (6)")
                        Text("Start Over")               }}
                .modifier(ButtonStyle())
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(rounde)").modifier(ValueStyle())
                Spacer()
                
               
                NavigationLink(destination: AboutView()) {
                    Image("pngwing.com (10)")
                    Text("info")              }
                .modifier(ButtonStyle())
                
            
                }
            
            
            .padding(.bottom, 20)
        }
            
        .background(Image("Background"), alignment:.center).modifier(Shadow())
        .accentColor(midnightBlue)
       
        
     
        
    }
        .navigationTitle("Apple")
        
    }
    /*  func pointsForCurrentRoyund() -> Int{
     var difference = abs(roundedValue()-target)
     var awardedPoints = 100 - difference
     return awardedPoints
     
     }
     func sliderValueRouded() -> Int{
     var roundedValue = Int(sliderValue.rounded())
     return roundedValue
     } */
    func pointsForCurrentRoyund() -> Int{
        let maximumScore = 100
        let bonus:Int
        if amountOff() == 0 {
            bonus = 100
        } else if amountOff() == 1{
            bonus = 50
        } else{
            bonus = 0
        }
        return maximumScore - amountOff() + bonus
    }
    func sliderValueRounded() -> Int{
        Int(sliderValue.rounded())
    }
    func counterRound(){
        rounde += 1
        
    }
    func counterScore(){
         score += pointsForCurrentRoyund()
            }
    func amountOff() -> Int{
        abs(sliderValueRounded()-target)
    }

    func targetRefresh(){
        return target = Int.random(in: 1...100)
        
    }
    func alertTitle() -> String{
        
        let title: String
        if amountOff() == 0{
            title = "Perfect"
        } else if amountOff() < 5{
            title = "You almost had it!"
        } else if amountOff() <= 10{
            title = "Not Bad!"
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame(){
        score = 0
        rounde = 1
        targetRefresh()
        sliderValue = 50.0
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            if #available(iOS 15.0, *) {
                ContentView().previewLayout(
                    .fixed(width: 896, height: 414)).previewInterfaceOrientation(.landscapeLeft)
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
    
}

