//
//  ContentView.swift
//  Memorize
//
//  Created by 杜森 on 2021/8/14.
//

import SwiftUI


struct ContentView: View {
    var emojis = [ "🐳", "🐋", "🐬", "🦭", "🐟", "🐠", "🐡", "🦈", "🐙", "🐚", "🐌", "🦋", "🐛", "🐣", "🐤", "🐥", "🐦", "🐧", "🕊️", "🦅", "🦆", "🦢", "🦉", "🦤", "🪶", "🦩", "🦚", "🦜", "🐸", "🐊", "🐢", "🦎", "🐍", "🐲", "🐉", "🦕", "🦖"]
    @State var emojisCount : Int = 5
    
    var body: some View{
        VStack{
            HStack{
                ForEach(emojis[0..<emojisCount], id: \.self){
                    emoji in CardView(content: emoji)
                }
            }
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }

    var remove: some View{
        Button(action: {
            if emojisCount > 1 {
                emojisCount -= 1
            }
        }, label:{
            Image(systemName: "minus.circle")
                .font(.largeTitle)
        })
        .foregroundColor(.blue)
    }
    var add: some View{
        Button(action: {
            if emojisCount < emojis.count {
                emojisCount += 1
            }
        }, label:{
            Image(systemName: "plus.circle")
                .font(.largeTitle)
        })
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    var content : String
    @State var isFaceUp : Bool = true
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
