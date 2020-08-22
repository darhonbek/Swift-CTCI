import Foundation

func multiplyByTwo(_ n: Int) -> Int {
    sleep(UInt32.random(in: 0...3))
    print(n*2)
    return n * 2
}

// Solution #1 - using Operation and OperationQueue

class MultiplyOperation: Operation {
    var number: Int
    var result: Int?

    init(_ number: Int) {
        self.number = number
    }

    override func main() {
        result = multiplyByTwo(number)
    }
}

func multiplyNumbers(_ arr: [Int]) -> [Int] {
    var answer: [Int] = Array(repeating: 0, count: arr.count)

    let serialQueue = OperationQueue()
    serialQueue.maxConcurrentOperationCount = 1

    let concurrentQueue = OperationQueue()

    for (index, value) in arr.enumerated() {
        let operation = MultiplyOperation(value)
        operation.completionBlock = {
            guard let result = operation.result else { return }
            serialQueue.addOperation {
                answer[index] = result
            }
        }
        concurrentQueue.addOperation(operation)
    }

    concurrentQueue.waitUntilAllOperationsAreFinished()

    return answer
}

// Solution #2 - using DispatchQueue and DispatchGroup

func multiplyNumbersUsingDispatchQueue(_ arr: [Int]) -> [Int] {
    var answer: [Int] = Array(repeating: 0, count: arr.count)
    let serialQueue = DispatchQueue(label: "com.darkhonbek.serialQueue")
    let concurrentQueue = DispatchQueue(label: "com.darkhonbek.concurrentQueue", attributes: .concurrent)
    let dispatchGroup = DispatchGroup()

    for (index, value) in arr.enumerated() {
        dispatchGroup.enter()

        concurrentQueue.async {
            defer {
                dispatchGroup.leave()
            }

            let result = multiplyByTwo(value)

            serialQueue.sync {
                answer[index] = result
            }
        }
    }

    dispatchGroup.wait()

    return answer
}

// Solution #3 - using DispatchQueue.concurrentPerform()

func multiplyNumbersConcurrently(_ arr: [Int]) -> [Int] {
    var answer: [Int] = Array(repeating: 0, count: arr.count)
    DispatchQueue.concurrentPerform(iterations: arr.count) { answer[$0] = multiplyByTwo(arr[$0]) }
    return answer
}



let input = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
let expectedOutput = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]

//let output = multiplyNumbers(input)
//let output = multiplyNumbersUsingDispatchQueue(input)
let output = multiplyNumbersConcurrently(input)

print(output == expectedOutput ? "Accepted" : "Failed")
