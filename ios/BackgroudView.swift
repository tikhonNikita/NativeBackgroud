import UIKit

class BackgroundView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBlurEffect()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addBlurEffect()
    }
    
    private func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}
