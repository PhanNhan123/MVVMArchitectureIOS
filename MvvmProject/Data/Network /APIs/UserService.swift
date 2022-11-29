import Foundation
import RxSwift

enum UserPath{
    case users(since: String)
    case user(login: String)
    var path: String {
        switch self {
        case .users(let since):
            return "users"
        case .user(let login):
            return "users/\(login)"
        }
    }
}

protocol UserServiceProtocol{
    func getUsers(since : String) -> Observable<[UserModel]>
    func getUser(login : String) -> Observable<UserModel>
}

class UserService: BaseService, UserServiceProtocol{
    func getUser(login: String) -> Observable<UserModel>{
        let path = UserPath.user(login: login).path
        return get(path: path, parameters: nil)
    }
    func  getUsers(since : String) -> Observable<[UserModel]>{
        let path = UserPath.users(since: since).path
        return get(path: path, parameters: nil)
    }
}
