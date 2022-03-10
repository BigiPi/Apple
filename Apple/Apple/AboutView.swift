//
//  AboutView.swift
//  Apple
//
//  Created by Павел Богданов on 20.01.2022.
//

import SwiftUI
/* ориентация с порога, фон на второй вьюшке, не работает на 11айфон, ошибка при компиляции(мэин)*/
struct HeadStyle: ViewModifier{
    func body(content: Content) -> some View {
        return content
         .foregroundColor(Color.black)
         .padding(.top, 20)
         .padding(.bottom, 20)
        .font(Font.custom("Arial Rounded MT Bold", size: 30))
    }}
        
struct DownStyle: ViewModifier{
    func body(content: Content) -> some View {
        return content
         .foregroundColor(Color.black)
         .padding(.leading, 60)
         .padding(.trailing, 60)
         .padding(.bottom, 20)
        .font(Font.custom("Arial Rounded MT Bold", size: 16))
    }}
      
let bakground =  Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)

struct AboutView: View {
    var body: some View {
        Group{
        VStack{
            
            Text("🍏 Apple 🍏").modifier(HeadStyle())
            Spacer()
            Text("This is Apple, the game where you can win pointsand earnfame by dragging a slider").modifier(DownStyle()) .lineLimit(nil)
            Text("Your goal is to place the slider as close as as possibleto target value. The closer you are, the more points yours score").modifier(DownStyle()).lineLimit(nil)
            Spacer()
            Text("Enjoy").modifier(DownStyle()) .lineLimit(nil)
               

        }.background(bakground)
      
        }  .background(bakground)
    }
    


   

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            AboutView().previewLayout(
                .fixed(width: 896, height: 414)).previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
            
    }
    }


}
