//
//  PostModelView.swift
//  swift-basic-network
//
//  Created by MA on 31/10/2023.
//

import Foundation


class PostViewModel : ObservableObject {
    
    @Published var errorMessasge : String = ""
    @Published var postsList = [postModel]()
    
    
    @Published var title :String = ""
    @Published var body : String = ""
    @Published var userId : Int = 1
    
    
    init(){}
 
    
    func createPost() {
        
        
        if (title.isEmpty){
            
            errorMessasge = "Enter Title"
            
            return;
        }
        
        if (body.isEmpty){
            
            errorMessasge = "Enter body"
            
            return;
        }
    
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        
        var request = URLRequest(url: url)
        
        /// method
        request.httpMethod = "POST"
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
        
        let requestBody : [String: AnyHashable] = [
             "title": title,
             "body": body,
             "userId": userId,
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: .fragmentsAllowed)
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, urlResponse, err in
            
            if let err = err {
                self.errorMessasge = "create new post failure \(err)"
                return
            }
            
            
            
            do {
                
                
 //               let responseData = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                
               let responseJson = try JSONDecoder().decode(postModel.self, from: data!)
                

                
                DispatchQueue.main.async {
                    self.errorMessasge = "PostSuccessfully Create \(responseJson.id)"
                }
 //               print(responseData!)
                
                
            } catch {
                
                print(err!)
                
            }
  
            
            
            
        }
        
        task.resume()
        
     }
    
    func fetchPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data,_,err in
            
            
            if let err = err {
                
                self.errorMessasge = "post Fetching error \(err)"
                
                print("post Fetching error \(err)")
                
                return
            }
            
            
            do {
                
                
                let posts = try JSONDecoder().decode([postModel].self, from: data!)
                
                
                DispatchQueue.main.async {
                    
                    self.postsList = posts
                    
                    
                }
                
                
                
            } catch {
                
                print(err!)
                
            }
            
            
        }
        
        task.resume()
        
    }
    
}
