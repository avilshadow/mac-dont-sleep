import Foundation
import CoreGraphics

func jiggleMouse() {
    // Отримуємо поточну позицію миші
    let loc = CGEvent(source: nil)?.location ?? CGPoint(x: 500, y: 500)
    
    // Рухаєм мишу туди-сюди
    let move1 = CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: CGPoint(x: loc.x + 1, y: loc.y), mouseButton: .left)
    let move2 = CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: loc, mouseButton: .left)
    
    move1?.post(tap: CGEventTapLocation.cghidEventTap)
    usleep(100_000)
    move2?.post(tap: CGEventTapLocation.cghidEventTap)
}

while true {
    jiggleMouse()
    sleep(60) // кожні 5 хв
}

//swiftc jiggle.swift -o jiggle
// ./jiggle &