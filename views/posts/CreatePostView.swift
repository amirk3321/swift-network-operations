//
//  CreatePostView.swift
//  swift-basic-network
//
//  Created by MA on 31/10/2023.
//

import Foundation
import SwiftUI


struct CreatePostView : View {
    
    

    @ObservedObject var vm = PostViewModel()
    
    var body : some View {
        
        
        
        
        NavigationView {
            
            ScrollView {
            
                VStack {
                    TextField("Enter Post Title", text: $vm.title)
                        .padding(.horizontal,15)
                        .padding(.vertical,20)
                    
                    TextField("Enter Body", text: $vm.body)
                        .padding(.horizontal,15)
                        .padding(.vertical,20)
                        .padding(.top, 20)
                    
                    Button(action: {
                        
                        vm.createPost()
                        
                        
                    }, label: {
                        
                        HStack{
                            Spacer()
                            Text("Create Post").font(.system(size: 14)).foregroundColor(.white).padding()
                            Spacer()
                        }
                        
                        
                    }).background(.blue)
                        .padding(.horizontal,8)
                        .cornerRadius(20)
                        .padding(.top,20)
                    
                    Text(vm.errorMessasge).foregroundColor(.gray).padding(.top,20)
                        
                    
                }
                
                
                
            }.navigationTitle(Text("Create Post"))
                .navigationBarTitleDisplayMode(.large)
            
        }
        
        
    }
}

#Preview {
    NavigationView {
        CreatePostView()
    }
  
}
