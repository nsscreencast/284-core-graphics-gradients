import UIKit
import PlaygroundSupport

final class CustomView: UIView {
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }

		let colorSpace = CGColorSpaceCreateDeviceRGB()
		let color = CGColor(colorSpace: colorSpace, components: [1, 1, 1, 1])!

		context.setFillColor(color)
		context.fill(bounds)

		let colors = [
			CGColor(colorSpace: colorSpace, components: [0.2, 0.2, 0.8, 1])!,
			CGColor(colorSpace: colorSpace, components: [0.6, 0.4, 1, 1])!
		] as CFArray

		let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)!

//		let center = CGPoint(x: rect.midX, y: rect.midY)
//		context.drawRadialGradient(gradient, startCenter: center, startRadius: rect.width, endCenter: center, endRadius: 0, options: [.drawsBeforeStartLocation])

		context.drawLinearGradient(gradient, start: CGPoint(x: 30, y: 30), end: CGPoint(x: 290, y: 290), options: [.drawsBeforeStartLocation])
	}
}

PlaygroundPage.current.liveView = CustomView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
