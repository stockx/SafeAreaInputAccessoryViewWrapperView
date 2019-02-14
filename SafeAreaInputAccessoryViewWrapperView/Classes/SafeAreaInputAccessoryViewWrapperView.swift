//
//  SafeAreaInputAccessoryViewWrapperView.swift
//  StockX
//
//  Created by Jeff Burt on 10/5/17.
//  Copyright © 2017 StockX. All rights reserved.
//

import UIKit

/**
 SafeAreaInputAccessoryViewWrapperView is useful for wrapping a view to be used
 as an inputAccessoryView. Without this, setting the view as an
 inputAccessoryView will ignore safe area layouts. For example, the Home screen
 indicator on iPhone X will battle for the same spot. This class ensures that
 the view respects safe area layouts and does not cover up system UI elements
 such as the Home screen indicator on iPhone X.
 */
public class SafeAreaInputAccessoryViewWrapperView: UIView {
    private var addedConstraints = [NSLayoutConstraint]() {
        didSet {
            NSLayoutConstraint.deactivate(oldValue)
            NSLayoutConstraint.activate(addedConstraints)
        }
    }
    
    deinit {
        addedConstraints = []
    }
    
    public init(for view: UIView) {
        super.init(frame: .zero)
        
        addSubview(view)
        
        // Allow 'self' to be sized based on autolayout constraints. Without
        // this, the frame would have to be set manually.
        autoresizingMask = .flexibleHeight
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        defer {
            let leadingAnchor: NSLayoutXAxisAnchor
            let trailingAnchor: NSLayoutXAxisAnchor
            let topAnchor: NSLayoutYAxisAnchor
            let bottomAnchor: NSLayoutYAxisAnchor
            
            if #available(iOS 11, *) {
                leadingAnchor = safeAreaLayoutGuide.leadingAnchor
                trailingAnchor = safeAreaLayoutGuide.trailingAnchor
                topAnchor = safeAreaLayoutGuide.topAnchor
                bottomAnchor = safeAreaLayoutGuide.bottomAnchor
            }
            else {
                leadingAnchor = self.leadingAnchor
                trailingAnchor = self.trailingAnchor
                topAnchor = self.topAnchor
                bottomAnchor = self.bottomAnchor
            }
            
            addedConstraints =
                [view.leadingAnchor.constraint(equalTo: leadingAnchor),
                 view.trailingAnchor.constraint(equalTo: trailingAnchor),
                 view.topAnchor.constraint(equalTo: topAnchor),
                 view.bottomAnchor.constraint(equalTo: bottomAnchor)]
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var intrinsicContentSize: CGSize {
        // Allow 'self' to be sized based on autolayout constraints. Without
        // this, the frame would have to be set manually.
        return .zero
    }
}

public extension SafeAreaInputAccessoryViewWrapperView {
    /// Returns the size of this wrapper view by computing it from the size of it's content.
    /// NOTE: This is not used internally, but rather, it's a convenience helper for views that
    /// might need to adjust their constraints or insets based on this size.
    /// This will also work when changing the size of the application window due to iPad Multitasking.
    public func computedSize() -> CGSize {
        return systemLayoutSizeFitting(CGSize(width: UIApplication.shared.keyWindow?.bounds.width ?? UIScreen.main.bounds.width,
                                              height: .greatestFiniteMagnitude),
                                       withHorizontalFittingPriority: .required,
                                       verticalFittingPriority: .fittingSizeLevel)
    }
}
