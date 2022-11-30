import Foundation
import UIKit
class UserCell: UITableViewCell{
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var loginLabel : UILabel!
    @IBOutlet weak var linkLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func bind(user: UserModel){
        loginLabel.text = user.login
        linkLabel.text = user.html_url
    }
}
    
