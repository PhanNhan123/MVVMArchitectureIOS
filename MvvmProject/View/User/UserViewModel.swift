import Foundation
import RxSwift

final class UserViewModel: BaseViewModel {
    let user: UserModel!
    
    let inReload = PublishSubject<Void>()
    
    let outUser = PublishSubject<UserModel>()
    init(user: UserModel?){
        self.user = user
        super.init()
        
        inReload.subscribe(onNext: {() in
            self.loadUser()
        }).disposed(by: disposeBag)
    }
    private func loadUser(){
        loading(true)
        UserRepository.shared.getUser(login: user.login!)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext :{ [weak self] user in
                self?.outUser.onNext(user)
                },
                onError: {[weak self] error in
                    self?.loading(false)
                    self?.alert(error.localizedDescription)
                },
                onCompleted: {[weak self]() in
                    self?.loading(false)
                }
            ).disposed(by: disposeBag)
    }
}

