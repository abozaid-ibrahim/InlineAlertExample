//
//  InlineAlertImplementation.swift
//  InlineAlertExample
//
//  Created by Abuzeid Ibrahim on 12/3/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//
import UIKit

struct InlineAlertAccessibilityIdentifiers {
    static let seperator = "inline_seperator"
}

final class InlineAlert: UIView, InlineAlertView {
    var sizeDelegate: ViewSizeObserver?
    var view: UIView {
        return self
    }

    var style = Style()

    init(frame: CGRect, icon: UIImage = #imageLiteral(resourceName: "infoCircle")) {
        super.init(frame: frame)
        initView(icon: icon)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView(icon: #imageLiteral(resourceName: "infoCircle"))
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func observeValue(forKeyPath _: String?, of _: Any?, change: [NSKeyValueChangeKey: Any]?, context _: UnsafeMutableRawPointer?) {
        guard let changeValue = change,
            let frame = changeValue[NSKeyValueChangeKey.newKey] as? CGRect else {
            return
        }
        sizeDelegate?.newSize(frame: frame)
        view.frame = frame
        layoutIfNeeded()
    }

    deinit {
        stackView.removeObserver(self, forKeyPath: "bounds")
    }

    private let stackView = UIStackView()

    func append(view: UIView) -> Self {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: stackView.bounds.width - style.bodyPadding).isActive = true
        insertNewView(view)
        return self
    }

    func appendText(text: NSAttributedString) -> Self {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = text
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        insertNewView(label)
        return self
    }

    func appendText(text: String) -> Self {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        insertNewView(label)
        return self
    }

    func addVerticalSeperator() -> Self {
        let sep = UIView()
        sep.translatesAutoresizingMaskIntoConstraints = false
        sep.accessibilityIdentifier = InlineAlertAccessibilityIdentifiers.seperator
        sep.backgroundColor = style.seperatorColor
        sep.widthAnchor.constraint(equalToConstant: stackView.bounds.width - style.bodyPadding).isActive = true
        sep.heightAnchor.constraint(equalToConstant: 1).isActive = true
        insertNewView(sep)
        return self
    }

    func addPadding() -> Self {
        let padding = UIView()
        padding.translatesAutoresizingMaskIntoConstraints = false
        padding.backgroundColor = UIColor.clear
        padding.heightAnchor.constraint(equalToConstant: style.bodyPadding).isActive = true
        insertNewView(padding)
        return self
    }

    var viewContentHeight: CGFloat {
        return stackView.frame.height + (2 * style.bodyPadding)
    }

    func addAction(title: String, action: @escaping InlineAlertButtonAction) -> Self {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.widthAnchor.constraint(equalToConstant: stackView.bounds.width - style.bodyPadding).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.setTitle(title, for: .normal)
        button.backgroundColor = style.buttonBG

        button.addAction(for: .touchUpInside, { [weak self] in
            guard self != nil else { return }
            action()
        })
        insertNewView(button)
        return self
    }

    private func insertNewView(_ view: UIView) {
        stackView.addArrangedSubview(view)
        stackView.layoutIfNeeded()
    }
}

final class Style {
    var seperatorColor = #colorLiteral(red: 0.8979414105, green: 0.8980956078, blue: 0.8979316354, alpha: 1)
    var buttonBG = UIColor.lightGray
    var primaryBGColor = UIColor.darkGray
    var leadingViewWidth: CGFloat = 50
    var bodyPadding: CGFloat = 10
    var bodyBG = UIColor.white
}

private extension InlineAlert {
    func setLeadingView(icon: UIImage) {
        let leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: style.leadingViewWidth, height: bounds.height)))
        leftView.backgroundColor = style.primaryBGColor
        let iconDim = style.leadingViewWidth - (2 * style.bodyPadding)
        let iconView = UIImageView(frame: CGRect(x: style.bodyPadding, y: 2 * style.bodyPadding, width: iconDim, height: iconDim))
        iconView.image = icon
        leftView.addSubview(iconView)
        addSubview(leftView)
    }

    func setBodyView() {
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
        stackView.spacing = style.bodyPadding
        let stFrame = CGRect(origin: CGPoint(x: style.leadingViewWidth + style.bodyPadding, y: style.bodyPadding),
                             size: CGSize(
                                 width: bounds.width - (style.leadingViewWidth + (2 * style.bodyPadding)),
                                 height: bounds.height - (2 * style.bodyPadding)
        ))
        let stackContainer = UIView(frame: stFrame)
        stackContainer.addSubview(stackView)
        stackContainer.backgroundColor = style.bodyBG
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: stackContainer.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: stackContainer.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: stackContainer.topAnchor).isActive = true

        addSubview(stackContainer)
    }

    func initView(icon: UIImage) {
        setLeadingView(icon: icon)
        setBodyView()
        setCorners(borderColor: style.primaryBGColor, borderWidth: 1)
        backgroundColor = style.bodyBG
        stackView.addObserver(self, forKeyPath: "bounds", options: NSKeyValueObservingOptions.new, context: nil)
    }
}

protocol ViewSizeObserver {
    func newSize(frame: CGRect)
}
