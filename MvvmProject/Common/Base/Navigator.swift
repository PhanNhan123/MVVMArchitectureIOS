
import Foundation
import UIKit
import SafariServices

class Navigator{
    func dismiss(sender: UIViewController?){
        sender? .navigationController?.dismiss(animated: true, completion: nil)
    }
    func pop(sender: UIViewController?, toRoot: Bool = false){
        if toRoot {
            sender?.navigationController?.popToRootViewController(animated: true)
        }else{
            sender?.navigationController?.popViewController()
        }
    }
    
    func push(target: UIViewController, sender: UIViewController){
        if let nav = sender.navigationController{
            nav.pushViewController(target, animated: true)
        }
    }
    
    func modal(target: UIViewController,sender: UIViewController){
        let nav = UINavigationController(rootViewController: target)
        sender.present(nav, animated: true, completion: nil)
    }
    
    func detail(target: UIViewController,sender: UIViewController){
        let nav = UINavigationController(rootViewController: target)
        sender.showDetailViewController(nav , sender: nil)
    }
    
    func safari(url: String){
        UIApplication.shared.open(url.url!, options: [:], completionHandler: nil)
    }
}
