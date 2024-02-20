//
//  BezierCurveUtility.swift
//
//
//  Created by Peter Easdown on 20/2/2024.
//

import Foundation
import CoreGraphics
import CGExtKit
import UXKit

/// Constructs a UXBezierPath from the specified points, using the CubicBezierCurve functionality provided within
/// BezierConfiguration.
///
/// - Parameter points: the array of `CGPoint`s
/// - Returns: A UXBezierPath providing a smoothed curved path along the entire array of `points`.
func pathFrom(points: [CGPoint]) -> UXBezierPath {
    let path = UXBezierPath()
    let startPos = points[0]

    let config = BezierConfiguration()
    let controlPoints = config.configureControlPoints(data: points)
            
    for i in 0..<points.count {
        let point = points[i]
        if i == 0 {
            path.move(to: .zero)
        }else {
            let segment = controlPoints[i - 1]
            path.addCurve(to: point - startPos, controlPoint1: segment.firstControlPoint - startPos, controlPoint2: segment.secondControlPoint - startPos)
        }
    }
   
    return path
}


