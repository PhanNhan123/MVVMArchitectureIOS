import Foundation
import RxSwift
import Alamofire

class BaseService {
    private static let baseURL = Environment.baseUrl
    private let queue = DispatchQueue(label: "BaseService.NetWork.Queue")
    
    private let headers: HTTPHeaders = [
        "Accept" : "applicaion/json"
    ]
    
    init(){}
    
    func get<T:Codable>(path: String, parameters: [String: Any]?) -> Observable<T>{
        return request(method: .get, path: path, parameters: parameters)
    }
    func post<T:Codable>(path: String, parameters: [String: Any]?) -> Observable<T>{
        return request(method: .post, path: path, parameters: parameters)
    }
    func request<T:Codable>(method:  HTTPMethod, path: String, parameters: [String: Any]?) -> Observable<T>{
        let url  = "\(BaseService.self.baseURL)/\(path)"
        Logger.debug("api method=\(method) url=\(url)")
        return Observable.create{ observer in
            let request = AF.request(url, method: method, parameters: parameters, headers:  self.headers)
                .responseDecodable(queue: self.queue){(response:AFDataResponse<T>) in
                    switch response.result {
                    case .success(let data):
                        Logger.debug("api success data=\(data)")
                        observer.onNext(data)
                        observer.onCompleted()
                    case .failure(let error):
                        Logger.error( "api faiture error=\(error)")
                        observer.onError(error)
                    }
                }
            return Disposables.create{
                request.cancel()
            }
        }
    }
}
