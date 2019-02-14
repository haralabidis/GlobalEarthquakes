import Foundation

struct AppError: Error {
    
    var locString: String
    var reason: String?
    var code: Int
}

// The errorDescription is the only part that actually comes generically with Error
extension AppError: LocalizedError {
    
    // This is actually part of LocalizedError
    var errorDescription: String? {
        return locString
    }
}

extension Error {
    var errorCode: Int {
        return (self as! AppError).code
    }
    var failureReason: String? {
        return (self as! AppError).reason
    }
}
