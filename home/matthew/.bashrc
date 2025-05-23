# Display system info with neofetch on terminal startup
if command -v neofetch &>/dev/null; then
    neofetch
fi

# Pacman aliases:
alias pacmanautoremove="sudo pacman -Qdtq | sudo pacman -Rns -"
alias pacmanautoremove2="sudo pacman -Qqd | sudo pacman -Rsu --print -"
alias pacmanlist="pacman -Qe" # list explicityly installed packages
# SSH aliases:
alias elkhorn="ssh orangepi@elkhorn"
alias blueos="ssh pi@192.168.0.100"


# Software aliases:
alias vesc="QT_QPA_PLATFORM=xcb ./vesc_tool_6.05"

# Scripting aliases:
alias spent="python3 /home/matthew/scripts/check_spent_today.py"
