import Foundation
import Foundation
import RxSwift
import Moya
import SwiftDate

//public enum AccessKeys : String {
//    case token = "token"
//    case shenzou = "shenzou"
//    
//}

public enum MDAppMode : String {
    case production = "production"
    case development = "development"

    public var description: String {
        return self.rawValue
    }
}


struct StoreSchedule {
    var isMondayAvailable = false
    var isTuesdayAvailable = false
    var isWednsdayAvailable = false
    var isThursdayAvailable = false
    var isFridayAvailable = false
    var isSaturdayAvailable = false
    var isSundayAvailable = false
}

public struct StoreOpt {
    var name = ""
    var id = 0
    var phone = ""
    var address = ""
    var website = ""
    var description = ""
}

//    let stoken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsImlzcyI6Imh0dHA6XC9cLzU0LjE0NS4xNjQuNDQ6ODg4OFwvYXBpXC91c2VyXC9sb2dpbiIsImlhdCI6MTQ4NTM4NzkxMSwiZXhwIjoxNDkzMjc3MTMxLCJuYmYiOjE0ODUzODc5MTEsImp0aSI6ImJmYmEyMjkwZmZlZTFhZWRmMjRmYTZhZTE2ZDQwMGRlIn0.qXjz2Vxf-07Wpdc-0JCO2eqt2CrfcOeUr2G6cV5Ufcg"

//    let stoken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsImlzcyI6Imh0dHA6XC9cLzU0LjE0NS4xNjQuNDQ6ODg4OFwvYXBpXC91c2VyXC9sb2dpbiIsImlhdCI6MTQ4ODg3MjUyOCwiZXhwIjoxNDk2NzYxNzQ4LCJuYmYiOjE0ODg4NzI1MjgsImp0aSI6IjFlNjI5ZGYyMzkxNDRiYjdlZGZmZTNmYThkNzczMDI5In0.lxVZUHIc1WizUaJy84fVneHDxeQNFiJO_sWTPYQGXaI"

    let stoken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIsImlzcyI6Imh0dHA6XC9cLzU0LjE0NS4xNjQuNDQ6ODg4OFwvYXBpXC91c2VyXC9sb2dpbiIsImlhdCI6MTQ4ODkwMDg2OSwiZXhwIjoxNDk2NzkwMDg5LCJuYmYiOjE0ODg5MDA4NjksImp0aSI6IjA0MzFkYWNmNGJlYjQ4MWRhMTVmZWQ2MjhlMDdmZmJjIn0.6mC3k8i4bYr7JUaOlnzAmEqBEk2AdLBCreaSWfNpyAM"


final class MDApp : NSObject {
    static let api = RxMoyaProvider<MDAPI>(plugins:[AccessTokenPlugin(token:stoken)])

//        let atp = AccessTokenPlugin(token:"")
//        let token = ""
//        let accessTokenPlugin = AccesssTokenPlugin(token:token)
//        let r =  RxMoyaProvider<TestAPI>(plugins:[])
    struct info {
        static var appStartDate = DateInRegion().string(format: .iso8601(options: [.withFullDate]))
    } // fin config
    
    struct store {
        static var initVC:UINavigationController? = nil
        static var schedule = StoreSchedule()
        static var opt:StoreOpt = StoreOpt()
    }

    struct config {
        static var appMode = MDAppMode.development
    } // fin config
    
    struct appointment {
        static var initVC:UINavigationController? = nil
        static var startAt = ""
        static var endAt = ""
        static var customerId = ""
        static var storeId = ""
        static var petInfo = PetView()
        
        static func setFromToday(start:String,end:String){
            let current =  DateInRegion().string(format: .iso8601(options: [.withFullDate]))
            MDApp.appointment.startAt = "\(current.description) \(start)"
            MDApp.appointment.endAt = "\(current.description) \(end)"
        }
    }
    

//    class modelsMgr {
//        public var user:UserModel!
//        static let ins = modelsMgr()
//    }
}
