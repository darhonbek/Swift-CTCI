func insertionSort(array: inout [Int]) {
    for i in 1 ..< array.count {
        var key = i
        var j = i - 1

        while j >= 0, array[key] < array[j] {
            array.swapAt(key, j)
            key = j
            j -= 1
        }
    }
}

var array = [2, 5, 3, 9, 1]
insertionSort(array: &array)
print(array)
