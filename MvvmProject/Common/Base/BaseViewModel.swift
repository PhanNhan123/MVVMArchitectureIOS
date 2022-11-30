import Foundation
import RxSwift

class BaseViewModel{
    struct BaseOutput{
        let alert : PublishSubject<String>
        let loading : PublishSubject<Bool>
    }
    
    let disposeBag = DisposeBag()
    
    let base: BaseOutput
    
    init(){
        base = BaseOutput(alert: PublishSubject<String>(), loading: PublishSubject<Bool>())
    }
    func loading(_ show: Bool){
        base.loading.onNext(show)
    }
    func alert(_ message:String){
        base.alert.onNext(message)
    }
}
