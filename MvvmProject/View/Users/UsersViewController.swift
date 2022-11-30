import Foundation
import UIKit
import RxSwift

class UsersViewController: BaseViewController<UsersViewModel>{
    
    @IBOutlet weak var usersTableView: UITableView!
    override func setupUI(){
        super.setupUI()
    }
    override func setupViewModel() {
        super.setupViewModel()
        viewModel = UsersViewModel()
        
        viewModel.base.loading
            .bind(to: usersTableView.refreshControl?.rx.isRefreshing)!)
            .disposed(by: DisposeBag)
        
    }
}


