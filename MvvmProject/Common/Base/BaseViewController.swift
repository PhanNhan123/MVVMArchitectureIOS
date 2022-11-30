import Foundation
import UIKit
import RxCocoa

class BaseViewController<VM: BaseViewModel>: UIViewController{
    let activityIndicator = UIActivityIndicatorView()
    
    let navigator = Navigator()
    
    let disposeBag = DisposeBag()
    
    var viewModel: VM!
    
    func setupUI(){}
    
    func setupViewModel(){}
    
    func setupData(){}
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        setupBaseBindings()
        setupData()
    }
    private func setupBaseBindings(){
        viewModel?.base.alert
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: {[weak self] (message) in
                    self?.alert(msg: message)
                }
        )
            .dispose(by: disposeBag)
    }
    func showIndicator(_ show: Bool ){
        view.isUserInteractionEnabled = !show
        guard show else {
            activityIndicator.removeFromSuperview()
            return
        }
        if activityIndicator.superview == nil{
            view.addSubview(activityIndicator)
        }
        activityIndicator.color = .black
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
    }
    
}
