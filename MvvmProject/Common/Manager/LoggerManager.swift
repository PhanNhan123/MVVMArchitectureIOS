import Foundation
import SwiftyBeaver

struct Logger {
    private static var log: SwiftyBeaver.Type = {
        let console = ConsoleDestination()
        let logger = SwiftyBeaver.self
        logger.addDestination(console)
        return logger
    }()
    
    static func verbose(_ message: Any){
        log.verbose(message)
    }
    static func debug(_ message: Any){
        log.debug(message)
    }
    static func info(_ message: Any){
        log.info(message)
    }
    static func error(_ message: Any){
        log .error(message)
    }
}


