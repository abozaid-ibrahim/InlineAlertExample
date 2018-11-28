//
//  InlineAlert.swift
//  InlineAlertExample
//
//  Created by Abuzeid Ibrahim on 11/28/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//


import UIKit


final class VFInlineAlert:UIView,InlineAlert{
    var style:Style{
        return Style()
    }
    init(frame: CGRect, icon: UIImage  = #imageLiteral(resourceName: "infoCircle")) {
        super.init(frame: frame)
        initView(icon: icon)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView(icon: #imageLiteral(resourceName: "infoCircle"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let stackView = UIStackView()
    
    func append(view: UIView) -> Self {
        stackView.addSubview(view)
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
        //        label.widthAnchor.constraint(equalToConstant: stackView.bounds.width - style.bodyPadding ).isActive = true
        stackView.addArrangedSubview(label)
        return self
    }
    
    func trimBottomSpace() -> Self {
        return self
    }
    
    func addVerticalSeperator() -> Self {
        let sep = UIView()
        sep.translatesAutoresizingMaskIntoConstraints = false
        
        sep.backgroundColor = style.seperatorColor
        sep.widthAnchor.constraint(equalToConstant: stackView.bounds.width - style.bodyPadding ).isActive = true
        sep.heightAnchor.constraint(equalToConstant: 1 ).isActive = true
        
        stackView.addArrangedSubview(sep)
        return self
    }
    func addPadding() -> Self {
        let padding = UIView()
        padding.translatesAutoresizingMaskIntoConstraints = false
        padding.backgroundColor = UIColor.clear
        padding.heightAnchor.constraint(equalToConstant: style.bodyPadding ).isActive = true
        stackView.addArrangedSubview(padding)
        return self
    }
    func addAction(title: String, action: @escaping ButtonAction) -> Self {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.widthAnchor.constraint(equalToConstant: stackView.bounds.width - style.bodyPadding ).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40 ).isActive = true
        button.setTitle(title, for: .normal)
        button.backgroundColor = style.buttonBG
        button.actionHandle(control: .touchUpInside,
                            forAction:{() -> Void in
                                action()
        })
        
        stackView.addArrangedSubview(button)
        return self
    }
    
    
    
}
extension VFInlineAlert{
     final class Style{
         var seperatorColor = UIColor.gray
         var buttonBG = UIColor.gray
         var primaryBGColor = UIColor.purple
         var leadingViewWidth:CGFloat = 40
         var bodyPadding:CGFloat = 10
         var bodyBG = UIColor.white
    }
}
private extension VFInlineAlert{
    func setLeadingView(icon:UIImage){
        let leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: style.leadingViewWidth, height: self.bounds.height)))
        leftView.backgroundColor = style.primaryBGColor
        let iconDim =  style.leadingViewWidth -  style.bodyPadding
        let iconView = UIImageView(frame: CGRect(x: style.bodyPadding*0.5 , y: style.bodyPadding, width: iconDim, height: iconDim))
        iconView.image = icon
        leftView.addSubview(iconView)
        self.addSubview(leftView)
    }
    
    func setBodyView(){
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
        stackView.spacing = style.bodyPadding
        let stFrame = CGRect(origin: CGPoint(x: style.leadingViewWidth + style.bodyPadding, y: style.bodyPadding),
                             size:  CGSize(
                                width: self.bounds.width - (style.leadingViewWidth + (2*style.bodyPadding)),
                                height: self.bounds.height - (2*style.bodyPadding)))
        let stackContainer = UIView(frame: stFrame)
        stackContainer.addSubview(stackView)
        stackContainer.backgroundColor = style.bodyBG
        stackView.frame = stackContainer.bounds
        self.addSubview(stackContainer)
        
        
    }
    func initView(icon:UIImage){
        self.setLeadingView(icon: icon)
        self.setBodyView()
        self.setCorners(borderColor:style.primaryBGColor)
    }
    
}
