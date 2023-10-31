//
//  ContentView.swift
//  swift-basic-network
//
//  Created by MA on 31/10/2023.
//

import SwiftUI


    struct ContentView: View {
    
        var body: some View {
            
            TabView {
                
                PostView().tabItem {
                    Image(systemName: "signpost.right.circle.fill")
                    Text("Posts")
                }
                CreatePostView().tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Create")
                }
                
                UsersView().tabItem {
                    Image(systemName: "person")
                    Text("Posts")
                }
                
               
                
            }
            
        }
        
        
    }
    
    
    
    #Preview {
        NavigationView {
            ContentView()
        }
        
    }

