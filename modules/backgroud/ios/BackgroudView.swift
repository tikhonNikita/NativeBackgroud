import UIKit

@objc(BackgroundView)
public class BackgroundView: UIView {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "The text color"
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    private lazy var labelContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backgroundBlurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelBlurEffectView: UIVisualEffectView = {
        // Use a different blur effect as per requirements for the label container
        let blurEffect = UIBlurEffect(style: .systemChromeMaterial) // Adjust this style as required
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(backgroundBlurEffectView)
        addSubview(labelContainerView)
        labelContainerView.addSubview(labelBlurEffectView)
        labelContainerView.addSubview(label)
        
        setupConstraints()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        backgroundBlurEffectView.frame = bounds
        labelBlurEffectView.frame = labelContainerView.bounds
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundBlurEffectView.topAnchor.constraint(equalTo: topAnchor),
            backgroundBlurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundBlurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundBlurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            labelContainerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            labelBlurEffectView.topAnchor.constraint(equalTo: labelContainerView.topAnchor),
            labelBlurEffectView.leadingAnchor.constraint(equalTo: labelContainerView.leadingAnchor),
            labelBlurEffectView.trailingAnchor.constraint(equalTo: labelContainerView.trailingAnchor),
            labelBlurEffectView.bottomAnchor.constraint(equalTo: labelContainerView.bottomAnchor),
            
            label.leadingAnchor.constraint(equalTo: labelContainerView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: labelContainerView.trailingAnchor, constant: -8),
            label.topAnchor.constraint(equalTo: labelContainerView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: labelContainerView.bottomAnchor, constant: -8)
        ])
    }
    
    @objc
    public func setTextColor(_ color: UIColor) {
        label.textColor = color
    }
}
