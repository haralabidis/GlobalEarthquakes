import Foundation

protocol URLSessionProtocol {
  func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
  
  func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
    
    let task = dataTask(with: url, completionHandler: completionHandler) as URLSessionDataTask
    return task as URLSessionDataTaskProtocol
    
  }
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {

}




