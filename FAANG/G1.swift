import UIKit

extension UIView {
    var recursiveDescription: String {
        var description = ""

        dfsTraverse(self) { [weak self] view, depth in
            guard let self = self else { return }

            self.printRepeatedPrefix(prefix: "| ", count: depth, to: &description)
            print(view.description, to: &description)
        }

        return description
    }

    private func dfsTraverse(_ view: UIView,
                             depth: Int = 0,
                             action: @escaping (UIView, Int) -> Void) {
        action(view, depth)

        view.subviews.forEach {
            dfsTraverse($0, depth: depth + 1, action: action)
        }
    }

    private func printRepeatedPrefix<T>(prefix: String,
                                        terminator: String = "",
                                        count: Int,
                                        to output: inout T) where T: TextOutputStream {
        for _ in 0 ..< count {
            print(prefix, terminator: terminator, to: &output)
        }
    }
}
