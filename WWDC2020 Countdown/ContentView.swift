//
//  ContentView.swift
//  WWDC2020 Countdown
//
//  Created by Igor Malyarov on 10.06.2020.
//  Created by temp on 28.06.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var countdown = Countdown()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("WWDC 2020")
                .font(.title)
            
            Image("wwdc2020")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            HStack(spacing: 16) {
                componentView(component: countdown.components.day,
                              componentName: "day(s)")
                componentView(component: countdown.components.hour,
                              componentName: "hours(s)")
            }
            
            HStack(spacing: 16) {
                componentView(component: countdown.components.minute,
                              componentName: "minute(s)")
                componentView(component: countdown.components.second,
                              componentName: "second(s)")
            }
        }
    }
    
    func componentView(component: Int?, componentName: String) -> some View {
        Group {
            if component != nil {
                VStack {
                    Text("\(component!)")
                        .font(.largeTitle)
                    ZStack {
                        Text("second(s)")
                            .hidden()
                        Text(componentName)
                    }
                    .foregroundColor(.secondary)
                    .font(.caption)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.secondarySystemFill))
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
