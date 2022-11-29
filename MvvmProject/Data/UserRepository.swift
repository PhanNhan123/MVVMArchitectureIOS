import Foundation
import RxSwift

class UserRepository : Repository{
    static let shared = UserRepository()
    
    private let userService:  UserServiceProtocol
    
    override init(){
        self.userService = UserService()
    }
    
    func getUsers(since:String) -> Observable<[UserModel]>{
        return userService.getUsers(since: since)
    }
    func getUser(login:String) -> Observable<UserModel>{
        return userService.getUser(login: login )
    }
}
