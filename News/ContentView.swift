//
//  ContentView.swift
//  News
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        TabView{
            TopView()
                .tabItem {
                    Label("Top Stories", systemImage: "newspaper")
                }
            MovieView()
                .tabItem {
                    Label("Movie Review", systemImage: "film")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
