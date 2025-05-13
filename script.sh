#!/bin/bash

while true
do
option=$(dialog --clear --stdout --title "Service Manager" \
--menu "Choose an option:" 20 60 12 \
  1 "List Services" \
  2 "List Services with Resource Usage" \
  3 "Show System CPU and RAM Usage" \
  4 "Show Disk Storage Left" \
  5 "Show Service Status Summary" \
  6 "Show Network Information" \
  7 "HTOP - System Monitor" \
  8 "Start a Service" \
  9 "Stop a Service" \
  10 "Restart a Service" \
  11 "Check Service Status" \
  12 "Exit")

case $option in
  1)
    systemctl list-units --type=service | less
    ;;
  2)
    tmpfile=$(mktemp)
    printf "%-35s %-10s %-8s %-8s\n" "SERVICE" "STATUS" "CPU(%)" "MEM(%)" > "$tmpfile"
    
    systemctl list-units --type=service --no-legend | awk '{print $1}' | while read service; do
      status=$(systemctl is-active "$service")
      pid=$(systemctl show -p MainPID --value "$service")
      
      if [[ "$pid" != "0" && -n "$pid" ]]; then
        read cpu mem <<< $(ps -p "$pid" -o %cpu,%mem --no-headers)
      else
        cpu="--"
        mem="--"
      fi
      
      printf "%-35s %-10s %-8s %-8s\n" "$service" "$status" "$cpu" "$mem" >> "$tmpfile"
    done
    
    dialog --title "Service Resource Usage" --textbox "$tmpfile" 30 80
    rm -f "$tmpfile"
    ;;
  3)
    tmpfile=$(mktemp)
    echo "CPU and RAM Usage:" > "$tmpfile"
    top -bn1 | grep "Cpu(s)" >> "$tmpfile"
    free -h >> "$tmpfile"
    dialog --title "System CPU and RAM Usage" --textbox "$tmpfile" 30 80
    rm -f "$tmpfile"
    ;;
  4)
    df -h > /tmp/disk_usage.txt
    dialog --title "Disk Storage Left" --textbox /tmp/disk_usage.txt 30 80
    rm -f /tmp/disk_usage.txt
    ;;
  5)
    tmpfile=$(mktemp)
    echo "Service Status Summary:" > "$tmpfile"
    echo "Active: $(systemctl list-units --type=service --state=active --no-legend | wc -l)" >> "$tmpfile"
    echo "Inactive: $(systemctl list-units --type=service --state=inactive --no-legend | wc -l)" >> "$tmpfile"
    echo "Failed: $(systemctl list-units --type=service --state=failed --no-legend | wc -l)" >> "$tmpfile"
    dialog --title "Service Status Summary" --textbox "$tmpfile" 30 80
    rm -f "$tmpfile"
    ;;
  6)
    tmpfile=$(mktemp)
    echo -e "\nNetwork Information:\n" > "$tmpfile"
    ip -o -4 addr show | awk '{print "Interface: " $2 "\nIP Address: " $4 "\n"}' >> "$tmpfile"
    ip -o -6 addr show | awk '{print "Interface: " $2 "\nIP Address: " $4 "\n"}' >> "$tmpfile"
    ip link show | awk '/^[0-9]+:/ {print "\n" $2} /ether/ {print "MAC Address: " $2}' >> "$tmpfile"
    dialog --title "\Zb\Z1Network Information" --colors --textbox "$tmpfile" 30 80
    rm -f "$tmpfile"
    ;;
  7)
    htop
    ;;
  8)
    service=$(dialog --inputbox "Enter service name to start:" 8 40 --stdout)
    systemctl start "$service"
    ;;
  9)
    service=$(dialog --inputbox "Enter service name to stop:" 8 40 --stdout)
    systemctl stop "$service"
    ;;
  10)
    service=$(dialog --inputbox "Enter service name to restart:" 8 40 --stdout)
    systemctl restart "$service"
    ;;
  11)
    service=$(dialog --inputbox "Enter service name to check status:" 8 40 --stdout)
    systemctl status "$service" | less
    ;;
  12)
    clear
    break
    ;;
  *)
    break
    ;;
esac
done