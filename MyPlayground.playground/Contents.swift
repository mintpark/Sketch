//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import SnapKit

/*
 snapkit 적용은 맨 마지막.
 text setting 등의 렌더링 변경이 발생하면 SnapKit이 깨진다. 맨 마지막에 추가한 component만 적용되는 등 화면이 웃겨짐.
 */

final class QuestJoinIntroViewModel {
    // BoardModel
    private var title: String = "한달안에 토익100점"
    private var dateStart: String = "2019.05.01"
    private var dateEnd: String = "2019.05.30"
    private var joinerAttendCount: Int = 5
    private var joinerMaxCount: Int = 100
    private(set) var totalFee: Int = 1800000
    
    func getTitle() -> String {
        return title
    }
    
    func getDuration() -> String {
        return String(format: "\(dateStart) ~ \(dateEnd)")
    }
    
    func getJoinerAttendCount() -> String {
        return String(format: "\(joinerAttendCount)명 / \(joinerMaxCount)명")
    }
}

final class QuestJoinIntroView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let instructJoinerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let instructTotalFeeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let joinerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let totalFeeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    func setup(_ viewModel: QuestJoinIntroViewModel) {
        titleLabel.text = viewModel.getTitle()
        durationLabel.text = viewModel.getDuration()
        instructJoinerLabel.text = "참가자"
        instructTotalFeeLabel.text = "모인 참가비"
        joinerLabel.text = viewModel.getJoinerAttendCount()
        totalFeeLabel.text = String(viewModel.totalFee)
    }
    
    /**
     Should called at last. There is layout issue.
     */
    func setSnapKit() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(44)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(24)
        }
        
        addSubview(durationLabel)
        durationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(titleLabel)
            make.height.equalTo(11)
        }
        
        addSubview(instructJoinerLabel)
        instructJoinerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(durationLabel.snp.bottom).offset(17)
            make.leading.equalTo(durationLabel)
            make.height.equalTo(11)
            make.width.equalTo(66)
        }
        
        addSubview(joinerLabel)
        joinerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(durationLabel.snp.bottom).offset(17)
            make.leading.equalTo(instructJoinerLabel.snp.trailing).offset(25)
            make.height.equalTo(11)
            make.width.equalTo(66)
        }
        
        addSubview(instructTotalFeeLabel)
        instructTotalFeeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(instructJoinerLabel.snp.bottom).offset(8)
            make.leading.equalTo(instructJoinerLabel)
            make.height.equalTo(11)
            make.width.equalTo(66)
        }
        
        addSubview(totalFeeLabel)
        totalFeeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(instructTotalFeeLabel)
        }
    }
}
class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let sketchView = QuestJoinIntroView(frame: CGRect(x: 0, y: 0, width: 140, height: 200))
        sketchView.setup(QuestJoinIntroViewModel())
        sketchView.setSnapKit()
        
        view.addSubview(sketchView)
        sketchView.snp.makeConstraints { $0.edges.equalToSuperview() }
        self.view = view
    }
}
PlaygroundPage.current.liveView = MyViewController()

