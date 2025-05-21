# Display system info with neofetch on terminal startup
if command -v neofetch &>/dev/null; then
    neofetch
fi

alias elkhorn="ssh orangepi@elkhorn"
alias blueos="ssh pi@192.168.0.100"
alias vesc="QT_QPA_PLATFORM=xcb ./vesc_tool_6.05"
alias spent="python3 /home/matthew/scripts/check_spent_today.py"
