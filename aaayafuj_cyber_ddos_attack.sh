#!/bin/bash

# Target IP address
echo "Enter your IP target here ->>> "
read TARGET

# Display a warning about illegal scans
echo "WARNING: Running these scans without permission is ILLEGAL!"

# Function to display the legal menu
display_legal_menu() {
    echo "==========================="
    echo "LEGAL Nmap Scans (with permission)"
    echo "==========================="
    echo "                                __        _       _                _"
    echo "  __ _  __ _  __ _ _   _  __ _ / _|_   _ (_)     | |__   __ _  ___| | __"
    echo " / _\` |/ _\` |/ _\` | | | |/ _\` | |_| | | || |_____| '_ \ / _\` |/ __| |/ /"
    echo "| (_| | (_| | (_| | |_| | (_| |  _| |_| || |_____| | | | (_| | (__|   <"
    echo " \__,_|\__,_|\__,_|\__, |\__,_|_|  \__,_|/ |     |_| |_|\__,_|\___|_|\_\\"
    echo "                   |___/               |__/"

    echo "1. TCP SYN Scan (Ports 1-65389)"
    echo "2. Aggressive Scan"
    echo "3. UDP Scan (Ports 1-65389)"
    echo "4. SYN Scan with Bad Checksum"
    echo "5. Scan Without Ping"
    echo "6. Null Scan (Stealth Scan)"
    echo "7. FIN Scan (Stealth Scan)"
    echo "8. All scans in one go"
    echo "9. Exit"
}

# Function to display the illegal menu
display_illegal_menu() {
    echo "==========================="
    echo "ILLEGAL Nmap Scans (run without permission)"
    echo "==========================="
    echo "                                __        _              _     _                        _   _             _"
    echo "  __ _  __ _  __ _ _   _  __ _ / _|_   _ (_)          __| | __| | ___  ___          __ _| |_| |_ __ _  ___| | __"
    echo " / _\` |/ _\` |/ _\` | | | |/ _\` | |_| || || |_____ / _\` |/ _\` |/ _ \/ __|_____ / _\` | __| __/ _\` |/ __| |/ /"
    echo "| (_| | (_| | (_| | |_| | (_| |  _| |_| || |_____| (_| | (_| | (_) \__ \_____|| (_| | |_| || (_| | (__|   <"
    echo " \__,_|\__,_|\__,_|\__, |\__,_|_|  \__,_|/ |      \__,_|\__,_|\___/|___/      \__,_|\__|\__\__,_|\___|_|\_\\"
    echo "                   |___/               |__/"
    echo "1. TCP SYN Scan (Ports 1-65389)"
    echo "2. Aggressive Scan"
    echo "3. UDP Scan (Ports 1-65389)"
    echo "4. SYN Scan with Bad Checksum"
    echo "5. Scan Without Ping"
    echo "6. Null Scan (Stealth Scan)"
    echo "7. FIN Scan (Stealth Scan)"
    echo "8. All scans in one go"
    echo "9. Exit"
}

# Function to run the legal scans
run_legal_scan() {
    case $1 in
        1)
            echo "Running TCP SYN Scan on ports 1-65389 (LEGAL only with permission)..."
            nmap -sS -p 1-65389 $TARGET
            ;;
        2)
            echo "Running Aggressive Scan (LEGAL only with permission)..."
            nmap -A $TARGET
            ;;
        3)
            echo "Running UDP Scan on ports 1-65389 (LEGAL only with permission)..."
            nmap -sU -p 1-65389 $TARGET
            ;;
        4)
            echo "Running SYN Scan with Bad Checksum (LEGAL only with permission)..."
            nmap -sS --badsum $TARGET
            ;;
        5)
            echo "Running Scan Without Ping (LEGAL only with permission)..."
            nmap -Pn $TARGET
            ;;
        6)
            echo "Running Null Scan (Stealth Scan) (LEGAL only with permission)..."
            nmap -sN -p- $TARGET
            ;;
        7)
            echo "Running FIN Scan (Stealth Scan) (LEGAL only with permission)..."
            nmap -sF -p- $TARGET
            ;;
        8)
            echo "Running all scans in one go (LEGAL only with permission)..."
            nmap -sS -p 1-65389 $TARGET
            nmap -A $TARGET
            nmap -sU -p 1-65389 $TARGET
            nmap -sS --badsum $TARGET
            nmap -Pn $TARGET
            nmap -sN -p- $TARGET
            nmap -sF -p- $TARGET
            ;;
        9)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid number (1-9)."
            ;;
    esac
}

# Function to run the illegal scans
run_illegal_scan() {
    case $1 in
        1)
            echo "Running TCP SYN Scan on ports 1-65389 (ILLEGAL without permission)..."
            nmap -sS -p 1-65389 $TARGET
            ;;
        2)
            echo "Running Aggressive Scan (ILLEGAL without permission)..."
            nmap -A $TARGET
            ;;
        3)
            echo "Running UDP Scan on ports 1-65389 (ILLEGAL without permission)..."
            nmap -sU -p 1-65389 $TARGET
            ;;
        4)
            echo "Running SYN Scan with Bad Checksum (ILLEGAL without permission)..."
            nmap -sS --badsum $TARGET
            ;;
        5)
            echo "Running Scan Without Ping (ILLEGAL without permission)..."
            nmap -Pn $TARGET
            ;;
        6)
            echo "Running Null Scan (Stealth Scan) (ILLEGAL without permission)..."
            nmap -sN -p- $TARGET
            ;;
        7)
            echo "Running FIN Scan (Stealth Scan) (ILLEGAL without permission)..."
            nmap -sF -p- $TARGET
            ;;
        8)
            echo "Running all scans in one go (ILLEGAL without permission)..."
            nmap -sS -p 1-65389 $TARGET
            nmap -A $TARGET
            nmap -sU -p 1-65389 $TARGET
            nmap -sS --badsum $TARGET
            nmap -Pn $TARGET
            nmap -sN -p- $TARGET
            nmap -sF -p- $TARGET
            ;;
        9)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid number (1-9)."
            ;;
    esac
}

# Main function for menu-driven script
main_menu() {
    echo "Select the type of scan you want to perform:"
    echo "1. Legal Nmap Scans"
    echo "2. Illegal Nmap Scans"
    echo "3. Exit"

    read -p "Enter your choice (1-3): " menu_choice

    case $menu_choice in
        1)
            # Show legal scans menu
            display_legal_menu
            read -p "Enter your choice (1-9): " choice
            run_legal_scan $choice
            ;;
        2)
            # Show illegal scans menu with warning
            echo "WARNING: Running these scans without permission is ILLEGAL!"
            display_illegal_menu
            read -p "Enter your choice (1-9): " choice
            run_illegal_scan $choice
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid number (1-3)."
            ;;
    esac
}

# Run the main menu
main_menu
