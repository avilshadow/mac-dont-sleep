# python3 -m pip install pyautogui

# jiggler.py

import pyautogui
import time
import random

print("Mouse Jiggler is running. Press Ctrl+C to stop.")

# Disable the fail-safe to prevent the script from stopping if the mouse moves to a corner
pyautogui.FAILSAFE = False

try:
    while True:
        # Choose a random amount to move the mouse by: -1 or 1 pixel
        # We use choice([-1, 1]) to guarantee a small movement.
        delta_x = random.choice([-1, 1])
        delta_y = random.choice([-1, 1])

        # The move() function moves the mouse relative to its current position
        pyautogui.move(delta_x, delta_y)

        # This part is just for logging to the console
        localtime = time.localtime()
        result = time.strftime("%I:%M:%S %p", localtime)
        print(f"Jiggled mouse by ({delta_x}, {delta_y}) at {result}")

        time.sleep(60)

except KeyboardInterrupt:
    print("\nScript stopped by user.")
except Exception as e:
    print(f"\nAn error occurred: {e}")