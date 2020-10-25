import UIKit

/**
    Given views A and B, find nearest common view containing both views.
    Similar to this problem:
    https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
*/

func nearestCommonView(a: UIView, b: UIView) -> UIView? {
    var containingView: UIView?
    let aSuperviews = a.getSuperviews()

    b.forEachSuperview { view, shouldBreak in
        if aSuperviews.contains(view) {
            containingView = view
            shouldBreak = true
        }
    }

    return containingView
}

extension UIView {
    func getSuperviews() -> Set<UIView> {
        var superviewSet = Set<UIView>()
        forEachSuperview { view, _ in
            superviewSet.insert(view)
        }

        return superviewSet
    }

    func forEachSuperview(shouldIncludeSelf: Bool = true, closure: @escaping (_ view: UIView, _ shouldBreak: inout Bool) -> ()) {
        var tempView: UIView? = shouldIncludeSelf ? self : self.superview
        var shouldBreak = false

        while let view = tempView {
            closure(view, &shouldBreak)
            if shouldBreak { break }
            tempView = tempView?.superview
        }
    }
}

// TEST:
var views = [
    UIView(),
    UIView(),
    UIView(),
    UIView(),
    UIView()
]

views[2].addSubview(views[0])
views[2].addSubview(views[1])
views[4].addSubview(views[2])
views[4].addSubview(views[3])

var output = nearestCommonView(a: views[0], b: views[1])
var expectedOutput = views[2]

print(output == expectedOutput ? "Accepted" : "Failed")
