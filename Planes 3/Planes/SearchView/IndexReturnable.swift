
import Foundation
protocol IndexReturnable {
    
    associatedtype Object
    var itemsForSelection : [Object] { get set }
    func getItem(at index: Int) -> Object
}
