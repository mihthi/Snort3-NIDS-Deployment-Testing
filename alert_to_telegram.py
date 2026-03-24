import requests
import time

# Thông tin Bot Telegram của bạn 
TOKEN = "786475.....Xm" # API Token từ BotFather
CHAT_ID = "56xxxx01" # Chat ID của người nhận

def send_to_telegram(text):
    url = f"https://api.telegram.org/bot{TOKEN}/sendMessage"
    payload = {"chat_id": CHAT_ID, "text": f"🚨 SNORT ALERT:\n{text}"}
    try:
        requests.post(url, json=payload)
    except Exception as e:
        print(f"Error: {e}")

# Giám sát file log của Snort [cite: 67]
with open("/var/log/snort/alert_fast", "r") as f:
    f.seek(0, 2)
    while True:
        line = f.readline()
        if line:
            send_to_telegram(line.strip())
        time.sleep(1)
