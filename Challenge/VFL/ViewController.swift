import UIKit

final class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let views: [UIView] = [.red, .green, .blue].map {(color: UIColor) in
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = color
      return view
    }
    
    views.forEach(view.addSubview)
    
    NSLayoutConstraint.activate(
        ["H": 8, "V": 20].flatMap {direction, gap in
            NSLayoutConstraint.constraints(
                withVisualFormat: "\(direction):[upperLeft(size)]-(gap)-[middle(size)]-(gap)-[bottomRight(size)]",
                metrics: ["gap": gap, "size": 50],
                views: Dictionary(uniqueKeysWithValues: zip(["upperLeft", "middle", "bottomRight"], views)
            )
        )
        }
      + [
        views[1].centerXAnchor.constraint(equalTo: view.centerXAnchor),
        views[1].centerYAnchor.constraint(equalTo: view.centerYAnchor)
      ]
    )
  }
}
