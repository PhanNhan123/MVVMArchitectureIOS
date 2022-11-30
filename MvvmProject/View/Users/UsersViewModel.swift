import Foundation
import RxSwift

final class UsersViewModel : BaseViewModel{
    let inReload = PublishSubject<Void>()
    let outUsers = PublishSubject<[UserModel]>()
    
    override init(){
        super.init()
        inReload.subscribe(onNext: {() in
            self.loadUsers()
        }).disposed(by: disposeBag)
    }
    private func loadUsers(){
        loading(true)
        UserRepository.shared.getUsers(since: "")
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext : {[weak self] users in
                    self?.outUsers.onNext(users)
                },
                onError : {[weak self] error in
                    self?.loading(false)
                    self?.alert(error.localizedDescription)
                },
                onCompleted: {[weak self]() in
                    self?.loading(false)
                }
            ).disposed(by: disposeBag)
    }
}
