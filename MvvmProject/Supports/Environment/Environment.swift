import Foundation
public enum Environment{
    enum Keys {
        static let baseUrl = "BASE_URL"
    }
    private static let infoDictionary: [String : Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found ")
        }
        return dict
    }()
    
    static let baseUrl: URL = {
        guard  let stringValue = Environment.infoDictionary[Keys.baseUrl] as? String else {
            fatalError("Root URL not set in plist fot this environment")
        }
        guard let value = URL(string: stringValue) else{
            fatalError("Root URL is invalid")
        }
        return value
    }()
}
