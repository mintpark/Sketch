//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import SnapKit

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        view.snp.makeConstraints { $0.edges.equalToSuperview() }
        self.view = view
    }
}

PlaygroundPage.current.liveView = MyViewController()
