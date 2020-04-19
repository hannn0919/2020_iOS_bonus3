//
//  ContentView.swift
//  2020_iOS_bonus3
//
//  Created by Hannn on 2020/4/19.
//  Copyright © 2020 Hannn. All rights reserved.
//

import SwiftUI

struct pic {
    var img: String
    var name: String
    var description: String
}

struct ContentView: View {
    
    let roles: [pic] = [
        pic(img: "pose", name: "我", description: "奧樂雞"),
        pic(img: "thanks", name: "是", description: "還是奧樂雞"),
        pic(img: "yeah", name: "誰", description: "當然是奧樂雞"),
        pic(img: "bye", name: "？", description: "想不到吧～")
    ]
    
    @State private var pickindex = 0
    
    var body: some View {
        ZStack{
            
            Image("background")
                .resizable()
                .scaledToFill()
            
            HStack{
                Button(action:{
                    let randNum = 0 ..< self.roles.count+1
                    self.pickindex = randNum.randomElement()!
                }){
                    Text("🎲")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(50)
                        .shadow(radius: 50)
                }
                
                Picker(selection: $pickindex, label: Text("")) {
                    ForEach(0 ..< roles.count) { i in
                        Text(self.roles[i].name).tag(i)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.gray)
                .border(Color.white)
                .cornerRadius(30)
                .shadow(radius: 30)
                .frame(width:300)
            }
            
            Image("\(roles[pickindex].img)")
                .resizable()
                .scaledToFit()
                .frame(width:350)
                .offset(x:-50,y:220)
            
            Text("\(roles[pickindex].description)")
                .offset(x:50,y:-100)
                .font(.system(size: 38))
                .foregroundColor(Color.white)
            
        }

        .edgesIgnoringSafeArea(.all)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
