//
//  ContentView.swift
//  DCMicroGridAppIEP
//
//  Created by White Dana on 23/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var datamainjsonlatests = [datamainjsonlatest]()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear() {
                Api().loadData { (datamainjsonlatests) in
                                    self.datamainjsonlatests = datamainjsonlatests            }
    }.navigationTitle("Json List")}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
