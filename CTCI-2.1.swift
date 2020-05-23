class Screen {
    let name: String
    var next: Screen?
    
    init(_ name: String, next: Screen? = nil) {
        self.name = name
        self.next = next
    }
}

// O(n) speed, O(n) memory
func removeDuplicates(from screen: Screen) {
    var visitedScreens: Set<String> = [screen.name]
    var previousScreen: Screen?
    var nextScreen = screen.next
    
    while nextScreen != nil {
        guard let screenName = nextScreen?.name else { continue }
        
        if visitedScreens.contains(screenName) {
            previousScreen?.next = nextScreen?.next
        } else {
            visitedScreens.insert(screenName)
            previousScreen = nextScreen
        }
        
        nextScreen = nextScreen?.next
    }
}

// O(n^2) speed, O(1) memory
func removeDuplicatesO1Memory(from screen: Screen) {
    var currentScreen: Screen? = screen
    
    while currentScreen != nil {
        var runner = currentScreen
        
        while runner?.next != nil {
            if runner?.next?.name == currentScreen?.name {
                runner?.next = runner?.next?.next
            } else {
                runner = runner?.next
            }
        }
        
        currentScreen = currentScreen?.next
    }
}

func getScreenOrder(startingFrom screen: Screen) -> [String] {
    var screens: [String] = []
    screens.append(screen.name)
    var nextScreen = screen.next
    
    while nextScreen != nil {
        guard let screenName = nextScreen?.name else { continue }
        screens.append(screenName)
        nextScreen = nextScreen?.next
    }
    
    return screens
}

let s7 = Screen("4")
let s6 = Screen("4", next: s7)
let s5 = Screen("1", next: s6)
let s4 = Screen("3", next: s5)
let s3 = Screen("2", next: s4)
let s2 = Screen("2", next: s3)
let s1 = Screen("1", next: s2)

let input = s1
let expectedOutput = ["1", "2", "3", "4"]
let output: [String] = {
    removeDuplicatesO1Memory(from: s1)
    return getScreenOrder(startingFrom: s1)
}()
let result = output == expectedOutput ? "Accepted" : "Failed"
print(result)
