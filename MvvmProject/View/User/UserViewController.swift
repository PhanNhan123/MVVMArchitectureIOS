import Foundation
import RxSwift

class UserViewController:BaseViewController<UserViewModel>{
    static func create(user: UserModel?) -> UserViewController{
        let view = UserViewController.instantiate()
        view.viewModel = UserViewModel(user: user)
        return view
    }
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var  linkLabel : UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    private var html_url = ""
    override func setupUI(){
        super.setupUI()
    }
    @IBAction func touchLink(_ sender: Any){
        navigator.safari(url: html_url)
    }
    override func setupViewModel(){
        super.setupViewModel()
        
        viewModel.base.loading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] show in
                self?.showIndicator(show)
            }).disposed(by: disposeBag)
        
        viewModel.outUser
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] user in
                self?.loadUser(user)
            }).disposed(by: disposeBag)
    }
    override func setupData() {
        super.setupData()
        viewModel?.inReload.onNext(())
    }
    private func loadUser(_ user: UserModel){
        self.navigationItem.title = user.login
        loginLabel.text  = user.login
        linkLabel.text = user.html_url
    }
}
extension UserViewController: StoryboardInstantiable{}
