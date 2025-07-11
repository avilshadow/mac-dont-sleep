import Foundation
import CoreGraphics

class MouseJiggler {
    func jiggleMouse() {
        let loc = CGEvent(source: nil)?.location ?? CGPoint(x: 500, y: 500)

        let move1 = CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: CGPoint(x: loc.x + 1, y: loc.y), mouseButton: .left)
        let move2 = CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: loc, mouseButton: .left)

        move1?.post(tap: CGEventTapLocation.cghidEventTap)
        usleep(100_000)
        move2?.post(tap: CGEventTapLocation.cghidEventTap)
    }

    func isNightTime() -> Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        return hour < 9 || hour >= 20
    }
}
