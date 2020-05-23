class Node {
    var value: String?
    var next: Node?
    
    init(_ value: String, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

func removeNode(_ node: Node?) {
    guard let next = node?.next else {
        node?.value = nil
        return
    }

    node?.value = next.value
    node?.next = next.next
}

func getNodeValues(startingFrom node: Node) -> [String?] {
    var values: [String?] = []
    var runner: Node? = node
    
    while runner != nil {
        values.append(runner?.value)
        runner = runner?.next
    }
    
    return values
}

var n3 = Node("3")
var n2 = Node("2", next: n3)
var n1 = Node("1", next: n2)

let expectedOutput = ["1", "2"]
let output: [String] = {
    removeNode(n3)
    return getNodeValues(startingFrom: n1).compactMap { $0 }
}()
let result = output == expectedOutput ? "Accepted" : "Failed"
print(result)
