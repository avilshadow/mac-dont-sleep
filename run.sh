#!/bin/bash

# A script to set up a Python virtual environment and run the jiggler.py script.

# --- Configuration ---
VENV_DIR="venv"
PYTHON_SCRIPT="jiggler.py"
REQUIREMENTS="pyautogui"

# --- Script Logic ---

# Function to print a separator line
print_header() {
    echo "----------------------------------------"
    echo "$1"
    echo "----------------------------------------"
}

# 1. Check if the Python script exists
if [ ! -f "$PYTHON_SCRIPT" ]; then
    print_header "ERROR"
    echo "Python script '$PYTHON_SCRIPT' not found."
    echo "Please make sure it's in the same directory as this shell script."
    exit 1
fi

# 2. Check for and create the virtual environment if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    print_header "SETUP: Creating Virtual Environment"
    python3 -m venv "$VENV_DIR"
    if [ $? -ne 0 ]; then
        echo "Failed to create virtual environment. Please ensure 'python3' and 'venv' are installed."
        exit 1
    fi
else
    echo "Virtual environment already exists. Skipping creation."
fi

# 3. Activate the virtual environment
source "$VENV_DIR/bin/activate"

# 4. Install the required package
print_header "SETUP: Installing Requirements"
pip install $REQUIREMENTS

# 5. Run the Python script
print_header "ACTION: Running the Jiggler"
echo "The mouse jiggler is now active."
echo "Press Ctrl+C in this terminal window to stop it."
echo ""

python "$PYTHON_SCRIPT"

# 6. Deactivate the virtual environment upon script exit (e.g., after Ctrl+C)
deactivate
echo ""
print_header "COMPLETE"
echo "Jiggler stopped and virtual environment deactivated."