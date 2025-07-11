GPT generated README
# pyMouseJiggler & Utilities

This repository contains several utilities and scripts for preventing your Mac from sleeping, locking, or logging out, as well as Swift-based mouse jiggler applications.

## Contents

### 1. `frugo.sh`
A Bash script that keeps your Mac awake during the day and prevents logout at night:
- **Daytime (09:00–19:59):** Prevents display sleep and idle sleep.
- **Nighttime (20:00–08:59):** Allows display sleep but prevents system logout.
- Uses the `caffeinate` command for power management.
- Logs actions with timestamps (in Ukrainian).

### 2. `jiggler.py`
A Python script (details not shown here) likely used to simulate mouse movement or prevent system sleep.

### 3. `run.sh`
A shell script (details not shown here) for running or managing the utilities in this folder.

### 4. Swift Mouse Jiggler App (`swift/`)
Contains a Swift-based macOS application for mouse jiggling:
- `MouseJiggler.swift`, `MouseJigglerApp.swift`, `MouseJiggler`: Core app files.
- `jiggle.swift`, `jiggleh.swift`: Likely contain logic for simulating mouse movement.
- `buildapp.sh`: Script to build the Swift app.
- `Info.plist`, `com.user.mousejiggler.plist`: macOS property list files for app configuration and launch agent setup.

---

## How to Build & Run

### 1. `frugo.sh`
Make the script executable and run it:
```sh
chmod +x frugo.sh
./frugo.sh
```

### 2. `jiggler.py`
Make sure you have Python 3 installed. Then run:
```sh
python3 jiggler.py
```

### 3. Swift Mouse Jiggler App
Navigate to the `swift/` directory and run the build script:
```sh
cd swift
chmod +x buildapp.sh
./buildapp.sh
```
This will build the Swift app. You can then run the resulting binary (e.g., `./MouseJiggler` or `./jiggle`).

#### To run the app:
```sh
./MouseJiggler
```
Or, if you want to run the command-line jiggler:
```sh
./jiggle
```

### 4. `run.sh`
If present, make it executable and run:
```sh
chmod +x run.sh
./run.sh
```

---

## Notes
- Scripts are tailored for macOS.
- Some scripts log messages in Ukrainian.
- The Swift app can be built using the provided `buildapp.sh` script.
- You may need to allow the app to run in System Preferences > Security & Privacy if you see a warning.

---

## License
MIT License (or specify your license here)

