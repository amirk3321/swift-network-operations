//
//  ContentView.swift
//  swift-basic-network
//
//  Created by MA on 31/10/2023.
//

import SwiftUI





    
    struct PostView: View {
        
        
        @ObservedObject var vm = PostViewModel()
        
        var body: some View {
            
            NavigationView {
                
                scrollView
                
            }
            
        }
        
        private var scrollView : some View  {
            
            ScrollView {
                
                ForEach (vm.postsList) {
                    post in
                    
                    HStack {
                        
                        HStack {
                            VStack(alignment:.leading) {
                                
                                Text(post.title )
                                    .font(.system(size: 16,weight: .bold))
                                
                                Text(post.body)
                                    .font(.system(size: 14))
                                
                            }.padding()
                        }
                        
                        Spacer()
                    }.background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                    
                    
                    
                    
                    
                }
                
                
                
            }.navigationTitle("Posts")
                .navigationBarTitleDisplayMode(.large)
                .onAppear {
                    vm.fetchPosts()
                }
        }
        
        
        
    }
    
    
    
    #Preview {
        NavigationView {
            ContentView()
        }
        
    }

