// The Swift Programming Language
// https://docs.swift.org/swift-book
//  Created by Dio Putra Utama on 08/04/25.
//

#if canImport(UIKit)
import SwiftUI
import UIKit

struct DShimmerModifier: ViewModifier {
    var baseColor: UIColor
    var shimmerColor: UIColor
    var cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay(
                DShimmerViewRepresentable(
                    baseColor: baseColor,
                    shimmerColor: shimmerColor,
                    cornerRadius: cornerRadius
                )
            )
            .mask(content)
    }
}

extension View {
    func dshimmer(baseColor: UIColor = UIColor.lightGray.withAlphaComponent(0.4),
                  shimmerColor: UIColor = UIColor.white.withAlphaComponent(0.6),
                  cornerRadius: CGFloat = 8

    ) -> some View {
        self.modifier(DShimmerModifier(baseColor: baseColor,
                                       shimmerColor: shimmerColor,
                                       cornerRadius: cornerRadius))
    }
}

public class DShimmer: UIView {
    private let gradientLayer = CAGradientLayer()

    var baseColor: UIColor = UIColor.lightGray.withAlphaComponent(0.4) {
        didSet { backgroundColor = baseColor }
    }

    var shimmerColor: UIColor = UIColor.white.withAlphaComponent(0.6) {
        didSet { updateGradientColors() }
    }

    var cornerRadiusValue: CGFloat = 0 {
        didSet { layer.cornerRadius = cornerRadiusValue }
    }

    override init(frame: CGRect) {
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
        gradientLayer.frame = bounds
    }

    func startAnimating() {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1, -0.5, 0]
        animation.toValue = [1, 1.5, 2]
        animation.duration = 1.2
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: "shimmer")
    }

    func stopAnimating() {
        gradientLayer.removeAnimation(forKey: "shimmer")
    }
}


public struct DShimmerViewRepresentable: UIViewRepresentable {
    var baseColor: UIColor = UIColor.lightGray.withAlphaComponent(0.4)
    var shimmerColor: UIColor = UIColor.white.withAlphaComponent(0.6)
    var cornerRadius: CGFloat = 8

    public func makeUIView(context: Context) -> DShimmer {
        let shimmer = DShimmer()
        shimmer.baseColor = baseColor
        shimmer.shimmerColor = shimmerColor
        shimmer.cornerRadiusValue = cornerRadius
        return shimmer
    }

    public func updateUIView(_ uiView: DShimmer, context: Context) {
        uiView.baseColor = baseColor
        uiView.shimmerColor = shimmerColor
        uiView.cornerRadiusValue = cornerRadius
    }
}

#endif
