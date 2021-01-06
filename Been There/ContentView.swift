//
//  ContentView.swift
//  Been There
//
//  Created by Shaun Jacobsen on 06/01/2021.
//

import SwiftUI

func requestHealthAccess() -> Void {
    HealthKitSetupAssistant.authorizeHealthKit { (Bool, Error) in
        
    }
    
}

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.init(red: 241, green: 250, blue: 238, opacity: 1).edgesIgnoringSafeArea(.all)
            VStack {
                Image("WomanBiking")
                Text("Access Workout Data").font(.title).fontWeight(.semibold).foregroundColor(Color.black).multilineTextAlignment(.center)
                Text("We'll need access to your workout data to analyse your routes.").foregroundColor(Color.black).multilineTextAlignment(.center).padding()
                Button(action: requestHealthAccess) {
                    Text("Grant access to health data").foregroundColor(Color.white).fontWeight(.semibold).padding()
                }.background(Color(red: 6/255, green: 214/255, blue: 160/255)).cornerRadius(5.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
