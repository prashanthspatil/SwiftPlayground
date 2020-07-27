import UIKit
import Foundation

let hosturl = "domain.*"

enum Router {
    case getResourceOne
    case getResourceTwo
    case getResourceThree

    var scheme: String {
        return "https"
    }

    var host: String {
        return hosturl
    }

    var path: String {
        switch self {
        case .getResourceOne:
            return "resource_one"
        case .getResourceTwo:
            return "resource_two"
        case .getResourceThree:
            return "resource_three"
        }
    }

    var method: String {
        return "GET"
    }
}

class ServiceLayer {
    class func request<T: Codable>(router: Router, completion: @escaping (Result<[T], Error>) -> Void) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        
        guard let endpoint = components.url else { return }
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = router.method

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in

            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "Undefined error")
                return
            }
            guard response != nil else {
                return
            }
            guard let data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                let responseObject = try decoder.decode([T].self, from: data)

                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}

class Model: Codable {
    var title: String?
    // ..
    // ..
}
ServiceLayer.request(router: Router.getResourceOne) { (result: Result<[Model], Error>) in
    switch result {
    case let .success(resource):
        print(resource)
        // Update UI
    case .failure:
        print(result)
    }
}
