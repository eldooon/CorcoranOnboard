//
//  AgentSuiteStyle.swift
//  CorcoranOnboard
//
//  Created by Eldon on 1/30/17.
//  Copyright © 2017 Eldon. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//
//  This code was generated by Trial version of PaintCode, therefore cannot be used for commercial purposes.
//



import UIKit

public class AgentSuiteStyle : NSObject {

    //// Cache

    private struct Cache {
        static var imageOfTaxi: UIImage?
        static var taxiTargets: [AnyObject]?
        static var imageOfSpacio: UIImage?
        static var spacioTargets: [AnyObject]?
        static var imageOfMoreButton: UIImage?
        static var moreButtonTargets: [AnyObject]?
    }

    //// Drawing Methods

    public dynamic class func drawTaxi(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)


        //// Color Declarations
        let color2 = UIColor(red: 1.000, green: 0.889, blue: 0.189, alpha: 1.000)

        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 13, y: 14, width: 125, height: 125))
        color2.setFill()
        ovalPath.fill()


        //// Text Drawing
        let textRect = CGRect(x: 25, y: 27, width: 100, height: 100)
        let textTextContent = "T"
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        let textFontAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 45), NSForegroundColorAttributeName: UIColor.black, NSParagraphStyleAttributeName: textStyle]

        let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: textRect)
        textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context.restoreGState()
        
        context.restoreGState()

    }

    public dynamic class func drawSpacio(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)


        //// Color Declarations
        let color5 = UIColor(red: 1.000, green: 0.628, blue: 0.000, alpha: 1.000)

        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 13.5, y: 13.5, width: 125, height: 125))
        color5.setFill()
        ovalPath.fill()


        //// Text Drawing
        let textRect = CGRect(x: 26, y: 26, width: 100, height: 100)
        let textTextContent = "S"
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        let textFontAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 45), NSForegroundColorAttributeName: UIColor.black, NSParagraphStyleAttributeName: textStyle]

        let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: textRect)
        textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context.restoreGState()
        
        context.restoreGState()

    }

    public dynamic class func drawMoreButton(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 25, height: 25), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 25, height: 25), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 25, y: resizedFrame.height / 25)


        //// Color Declarations
        let color6 = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)

        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 3, y: 6, width: 19, height: 3))
        color6.setFill()
        rectanglePath.fill()


        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: 3, y: 11, width: 19, height: 3))
        color6.setFill()
        rectangle2Path.fill()


        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: 3, y: 16, width: 19, height: 3))
        color6.setFill()
        rectangle3Path.fill()
        
        context.restoreGState()

    }

    //// Generated Images

    public dynamic class var imageOfTaxi: UIImage {
        if Cache.imageOfTaxi != nil {
            return Cache.imageOfTaxi!
        }

        UIGraphicsBeginImageContextWithOptions(CGSize(width: 150, height: 150), false, 0)
            AgentSuiteStyle.drawTaxi()

        Cache.imageOfTaxi = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return Cache.imageOfTaxi!
    }

    public dynamic class var imageOfSpacio: UIImage {
        if Cache.imageOfSpacio != nil {
            return Cache.imageOfSpacio!
        }

        UIGraphicsBeginImageContextWithOptions(CGSize(width: 150, height: 150), false, 0)
            AgentSuiteStyle.drawSpacio()

        Cache.imageOfSpacio = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return Cache.imageOfSpacio!
    }

    public dynamic class var imageOfMoreButton: UIImage {
        if Cache.imageOfMoreButton != nil {
            return Cache.imageOfMoreButton!
        }

        UIGraphicsBeginImageContextWithOptions(CGSize(width: 25, height: 25), false, 0)
            AgentSuiteStyle.drawMoreButton()

        Cache.imageOfMoreButton = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return Cache.imageOfMoreButton!
    }

    //// Customization Infrastructure

    @IBOutlet dynamic var taxiTargets: [AnyObject]! {
        get { return Cache.taxiTargets }
        set {
            Cache.taxiTargets = newValue
            for target: AnyObject in newValue {
                let _ = target.perform(NSSelectorFromString("setImage:"), with: AgentSuiteStyle.imageOfTaxi)
            }
        }
    }

    @IBOutlet dynamic var spacioTargets: [AnyObject]! {
        get { return Cache.spacioTargets }
        set {
            Cache.spacioTargets = newValue
            for target: AnyObject in newValue {
                let _ = target.perform(NSSelectorFromString("setImage:"), with: AgentSuiteStyle.imageOfSpacio)
            }
        }
    }

    @IBOutlet dynamic var moreButtonTargets: [AnyObject]! {
        get { return Cache.moreButtonTargets }
        set {
            Cache.moreButtonTargets = newValue
            for target: AnyObject in newValue {
                let _ = target.perform(NSSelectorFromString("setImage:"), with: AgentSuiteStyle.imageOfMoreButton)
            }
        }
    }




    @objc public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
