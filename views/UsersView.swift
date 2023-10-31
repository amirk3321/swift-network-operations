//
//  UsersView.swift
//  swift-basic-network
//
//  Created by MA on 31/10/2023.
//

import SwiftUI





struct UsersView: View {
    
    
    @ObservedObject var vm = UserViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                
                
                ForEach (vm.userList) {
                    user in
                    
                    
                    HStack {
                        VStack(alignment: .leading){
                            Text("name: \(user.name)")
                            Text("Address: \(user.address.street)")
                            
                        }
                        Spacer()
                    }
                }
                
            }.navigationTitle("Users")
                .navigationBarTitleDisplayMode(.large)
                .onAppear {
                    vm.fetchUsers()
                }

        }
        
    }
}

#Preview {
    UsersView()
 
}
