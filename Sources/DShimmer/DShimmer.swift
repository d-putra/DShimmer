// The Swift Programming Language
// https://docs.swift.org/swift-book
//  Created by Dio Putra Utama on 08/04/25.
//

#if canImport(UIKit)
import SwiftUI
import UIKit

public class DShimmer: UIView {
    private let gradientLayer = CAGradientLayer()
    private let keyName = "dshimmer"

    var baseColor: UIColor = UIColor.lightGray.withAlphaComponent(0.4) {
        didSet { backgroundColor = baseColor }
    }

    var shimmerColor: UIColor = UIColor.white.withAlphaComponent(0.4) {
        didSet { updateGradientColors() }
    }

    var cornerRadiusValue: CGFloat = 0 {
        didSet { layer.cornerRadius = cornerRadiusValue }
    }

    var rotationDegree: CGFloat = 30 {
        didSet { updateRotation() }
    }


    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupShimmer()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupShimmer()
    }

    private func setupShimmer() {
        backgroundColor = baseColor
        clipsToBounds = true
        layer.cornerRadius = cornerRadiusValue

        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.locations = [0, 0.5, 1]
        updateGradientColors()

        layer.addSublayer(gradientLayer)
        startAnimating()
    }

    private func updateGradientColors() {
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            shimmerColor.cgColor,
            UIColor.clear.cgColor
        ]
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        let extra: CGFloat = bounds.width
        gradientLayer.frame = bounds.insetBy(dx: -extra, dy: -extra)
        gradientLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
    }

    func startAnimating() {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1, -0.5, 0]
        animation.toValue = [1, 1.5, 2]
        animation.duration = 1.2
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: keyName)
    }

    func stopAnimating() {
        gradientLayer.removeAnimation(forKey: keyName)
    }

    private func updateRotation() {
        let radians = rotationDegree * .pi / 180
        gradientLayer.setAffineTransform(CGAffineTransform(rotationAngle: radians))
    }

}


public struct DShimmerView: UIViewRepresentable {
    var baseColor: UIColor = UIColor.lightGray.withAlphaComponent(0.4)
    var shimmerColor: UIColor = UIColor.white.withAlphaComponent(0.6)
    var cornerRadius: CGFloat = 8
    var rotationDegree: CGFloat = 0

    public init(baseColor: UIColor = UIColor.lightGray.withAlphaComponent(0.4), shimmerColor: UIColor = UIColor.white.withAlphaComponent(0.6), cornerRadius: CGFloat = 8, rotationDegree: CGFloat = 0) {
        self.baseColor = baseColor
        self.shimmerColor = shimmerColor
        self.cornerRadius = cornerRadius
        self.rotationDegree = rotationDegree
    }

    public func makeUIView(context: Context) -> DShimmer {
        let shimmer = DShimmer()
        shimmer.baseColor = baseColor
        shimmer.shimmerColor = shimmerColor
        shimmer.cornerRadiusValue = cornerRadius
        shimmer.rotationDegree = rotationDegree
        return shimmer
    }

    public func updateUIView(_ uiView: DShimmer, context: Context) {
        uiView.baseColor = baseColor
        uiView.shimmerColor = shimmerColor
        uiView.cornerRadiusValue = cornerRadius
        uiView.rotationDegree = rotationDegree
    }

    public func baseColor(_ color: UIColor) -> DShimmerView {
        DShimmerView(
            baseColor: color,
            shimmerColor: shimmerColor,
            cornerRadius: cornerRadius,
            rotationDegree: rotationDegree
        )
    }

    public func shimmerColor(_ color: UIColor) -> DShimmerView {
        DShimmerView(
            baseColor: baseColor,
            shimmerColor: color,
            cornerRadius: cornerRadius,
            rotationDegree: rotationDegree
        )
    }

    public func cornerRadius(_ radius: CGFloat) -> DShimmerView {
        DShimmerView(
            baseColor: baseColor,
            shimmerColor: shimmerColor,
            cornerRadius: radius,
            rotationDegree: rotationDegree
        )
    }

    public func rotationDegree(_ radius: CGFloat) -> DShimmerView {
        DShimmerView(
            baseColor: baseColor,
            shimmerColor: shimmerColor,
            cornerRadius: cornerRadius,
            rotationDegree: radius
        )
    }
}
#endif
