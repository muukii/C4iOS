//
//  C4View.swift
//  C4iOS
//
//  Created by travis on 2014-11-06.
//  Copyright (c) 2014 C4. All rights reserved.
//

import Foundation
import C4Core
import UIKit

public class C4View : NSObject, VisibleMediaObject {
    internal var view : UIView = UIView()
    
    convenience public init(frame: C4Rect) {
        self.init()
        self.view.frame = CGRect(frame)
    }
    
    public override init() {
        super.init()
        self.setupObserver()
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Media:Object
    //MARK: - Visible
    public var frame: C4Rect {
        get {
            return C4Rect(self.view.frame)
        }
        set(val) {
            self.view.frame = CGRect(val)
        }
    }
    
    public var bounds: C4Rect {
        get {
            return C4Rect(self.view.bounds)
        }
        set(val) {
            self.view.bounds = CGRect(val)
        }
    }
    
    public var center: C4Point {
        get {
            return C4Point(self.view.center)
        }
        set(val) {
            let dx = self.width / 2.0
            let dy = self.height / 2.0
            self.center = C4Point(val.x + dx, val.y + dy)
        }
    }
    
    public var width: Double {
        get {
            return Double(self.view.frame.size.width)
        }
    }
    
    public var height: Double {
        get {
            return Double(self.view.frame.size.height)
        }
    }

    public var origin: C4Point {
        get { return C4Point(self.view.frame.origin)}
        set(val) { self.view.frame = CGRect(C4Rect(val,self.size)) }
    }
    
    public var size: C4Size {
        get { return C4Size(self.view.frame.size) }
        set(val) { self.view.frame = CGRect(C4Rect(origin,val)) }
    }
    
    internal var proportion: Double = 1.0
    public var constrainsProportions: Bool = false {
        didSet {
            proportion = width / height
        }
    }
 
    public var backgroundColor: C4Color = C4Color(red: 0, green: 0, blue: 0, alpha: 1) {
        didSet {
            self.view.backgroundColor = UIColor(backgroundColor)
        }
    }
    
    public var opacity: Double {
        get { return Double(self.view.alpha) }
        set(val) { self.view.alpha = CGFloat(val) }
    }
    
    public var hidden: Bool {
        get {
            return self.view.hidden
        }
        set(val) {
            self.view.hidden = val
        }
    }

    public var border: Border = Border() {
        didSet {
            self.border.layer = self.view.layer
        }
    }
    
    public var shadow: Shadow = Shadow() {
        didSet {
            self.shadow.layer = self.view.layer
        }
    }

    public var rotation: Rotation = Rotation() {
        didSet {
            self.rotation.layer = self.view.layer
        }
    }
    
    public var perspectiveDistance: Double = 0 {
        didSet {
            //set perspective distance on layer
        }
    }
    //MARK: - Animatable
    //nothing yet
    
    //MARK: - EventSource
    public func post(event: String) {
        NSNotificationCenter.defaultCenter().postNotificationName(event, object: self)
    }
    
    public func on(event notificationName: String, run executionBlock: Void -> Void) -> AnyObject {
        return self.on(event: notificationName, from: nil, run: executionBlock)
    }
    
    public func on(event notificationName: String, from objectToObserve: AnyObject?, run executionBlock: Void -> Void) -> AnyObject {
        let nc = NSNotificationCenter.defaultCenter()
        return nc.addObserverForName(notificationName, object: objectToObserve, queue: NSOperationQueue.currentQueue(), usingBlock: { (n: NSNotification!) in
            executionBlock()
        });
    }
    
    public func cancel(observer: AnyObject) {
        let nc = NSNotificationCenter.defaultCenter()
        nc.removeObserver(observer, name: nil, object: nil)
    }
    
    public func cancel(event: String, observer: AnyObject) {
        let nc = NSNotificationCenter.defaultCenter()
        nc.removeObserver(observer, name: event, object: nil)
    }
    
    public func cancel(event: String, observer: AnyObject, object: AnyObject) {
        let nc = NSNotificationCenter.defaultCenter()
        nc.removeObserver(observer, name: event, object: object)
    }
    
    public func watch(property: String, of object: NSObject) {
        //would be great to simplify Key Value Observing
    }

    //MARK: - Touchable
    public var interactionEnabled: Bool = true {
        didSet {
            self.view.userInteractionEnabled = interactionEnabled
        }
    }
    
    internal var tapAction : TapAction?
    internal var tapRecognizer: UITapGestureRecognizer?
    
    public func onTap(run: TapAction) {
        tapAction = run

        if tapRecognizer == nil {
            tapRecognizer = UITapGestureRecognizer(target: self, action: "handleTap:")
            view.addGestureRecognizer(tapRecognizer!)
        }
    }

    internal func handleTap(sender: UITapGestureRecognizer) {
        if let action = tapAction? {
            action(location: C4Point(sender.locationInView(self.view)))
        }
    }
    
    public func onPan(run: PanAction) {
        
    }
    
    public func onPinch(run: PinchAction) {
        
    }
    
    public func onRotate(run: RotationAction) {
        
    }
    
    public func onLongPress(run: LongPressAction) {
        
    }
    
    public func onSwipe(run: SwipeAction) {
        
    }
    
    //MARK: - Setup Observer
    internal var observer: NSObjectProtocol = NSObject()
    internal func setupObserver() {
        let nc = NSNotificationCenter.defaultCenter()
        let mq = NSOperationQueue.mainQueue()
        self.observer = nc.addObserverForName("", object: nil, queue: mq) { _ in self.observe() }
    }
    
    internal func observe(){}
    
    deinit { NSNotificationCenter.defaultCenter().removeObserver(self.observer) }
    
    //MARK: - Maskable
    public var mask: Mask {
        get { return self.view.layer.mask }
        set(val) { }
    }
    
    //MARK: - AddRemoveSubview
    public func add<T: AddRemoveSubview>(subview: T) {
        
    }
    public func remove<T: AddRemoveSubview>(subview: T) {}
    public func removeFromSuperview() {}
}

extension UIView : AddRemoveSubview {
    public func add<T: AddRemoveSubview>(subview: T) {
        if subview is UIView {
            if let v = subview as? UIView {
                self.addSubview(v)
            }
        } else {
            if let v = subview as? C4View {
                self.addSubview(v.view)
            }
        }
    }
    public func remove<T: AddRemoveSubview>(subview: T) {
        if subview is UIView {
            if let v = subview as? UIView {
                v.removeFromSuperview()
            }
        } else {
            if let v = subview as? C4View {
                v.view.removeFromSuperview()
            }
        }
    }
}