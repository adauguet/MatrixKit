import Foundation

struct Matrix<T> {
    
    let columns: Int
    let rows: Int
    
    private var array: Array<T?>
    
    internal init(rows: Int, columns: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(count: rows * columns, repeatedValue: nil)
    }
    
    internal func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    internal subscript(row: Int, column: Int) -> T {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return array[(row * columns) + column]!
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            array[(row * columns) + column] = newValue
        }
    }
}

extension Matrix where T : Comparable {
    
    internal func min() -> T? {
        return array.minElement(<)!
    }
    
    internal func max() -> T? {
        return array.maxElement(<)!
    }
}