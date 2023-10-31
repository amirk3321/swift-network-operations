
import Foundation

class UserViewModel : ObservableObject {
    
    
    @Published var errorMessage = ""
    @Published var userList = [UserModel]()
    
    
    func fetchUsers() {
        
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) {
            data, _ , err in
            
            if let err = err  {
                
                self.errorMessage = "There is something wrong with users \(err)"
                
                print("There is something wrong with users \(err)")
                
                
                
                return
            }
            
            
            
            do {
                
                
                let users =  try JSONDecoder().decode([UserModel].self, from: data!)
                
                DispatchQueue.main.async {
                    self.userList = users
                }
                
                
                
            } catch {
                print(err!)
            }
            
            
        }
        
        task.resume()
        
    }
    
    
}

