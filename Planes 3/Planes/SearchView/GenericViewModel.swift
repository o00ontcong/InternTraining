
import Foundation


struct GenericViewModel<T>: IndexReturnable {

    var itemsForSelection: [T]
    
    init(items: [T]) {
        self.itemsForSelection = items
    }
    
    func getItem(at index: Int) -> T {
        return self.itemsForSelection[index]
    }

}




