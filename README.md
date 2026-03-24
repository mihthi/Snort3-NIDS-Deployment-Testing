# 🚨 Triển khai Hệ thống Phát hiện Xâm nhập Mạng (NIDS) sử dụng Snort 3 trên VMware 

Dự án này tập trung vào việc **nghiên cứu, cài đặt và cấu hình hệ thống phát hiện xâm nhập mã nguồn mở Snort 3 (phiên bản 3.7.1.0)** trong môi trường ảo hóa.

Hệ thống đóng vai trò như **một lớp bảo mật giám sát**, giúp **nhận diện sớm các hành vi bất thường hoặc các cuộc tấn công trái phép trong mạng**.

---

# 🎯 Mục tiêu & Phạm vi dự án

## 📚 Nghiên cứu IDS
Tìm hiểu các kiến thức nền tảng về hệ thống phát hiện xâm nhập:

- Khái niệm và vai trò của **Intrusion Detection System (IDS)**
- Nguyên lý hoạt động của:
  - **NIDS (Network-based IDS)** – giám sát lưu lượng mạng
  - **HIDS (Host-based IDS)** – giám sát trên từng máy chủ

## ⚙️ Triển khai thực tế
Cài đặt và tối ưu hóa **Snort 3** trên hai nền tảng Linux phổ biến:

- **Ubuntu 22.04**
- **CentOS 7**

## 🖥️ Môi trường thử nghiệm
Toàn bộ mô hình được triển khai trong **VMware Workstation**, giúp:

- Kiểm soát hoàn toàn môi trường mạng
- Mô phỏng các kịch bản tấn công
- Thử nghiệm và đánh giá hệ thống một cách linh hoạt

## 🤖 Tự động hóa cảnh báo
Tích hợp **Telegram Bot** để:

- Nhận cảnh báo xâm nhập
- Theo dõi hệ thống **trực tiếp trên điện thoại theo thời gian thực**

---

# ⚙️ Các thành phần triển khai chính

Dự án được tổ chức dựa trên **ba trụ cột kỹ thuật cốt lõi**:

---

## 🧠 Cấu hình hệ thống – `snort.lua`

Đây là **file cấu hình trung tâm của Snort**, đóng vai trò như **"bộ não" của hệ thống**.

Chức năng chính:

- Định nghĩa **phạm vi mạng nội bộ cần bảo vệ**
- Cấu hình các **module phân tích gói tin**
- Nạp các **rule phát hiện tấn công**

---

## 📜 Kỹ thuật xây dựng luật – `local.rules`

File này chứa các **bộ quy tắc (rules)** được xây dựng để nhận diện các loại tấn công phổ biến.

Hệ thống phát hiện **5 loại tấn công trọng điểm**:

### ICMP Flood & Ping of Death
Các cuộc tấn công **từ chối dịch vụ (DoS)** thông qua giao thức **ICMP**.

### Port Scanning
Phát hiện các kỹ thuật **dò quét cổng** phổ biến như:

- **SYN Scan**
- **FIN Scan**
- **Xmas Scan**
- **ACK Scan**

### Brute Force SSH
Phát hiện các cuộc tấn công **dò mật khẩu đăng nhập SSH trái phép**.

### SYN Flood
Tấn công **DoS** khai thác **quy trình bắt tay 3 bước (TCP Three-way Handshake)** của giao thức TCP.

---

## 📡 Hệ thống cảnh báo từ xa

Hệ thống sử dụng **script Python** để kết nối **Snort với Telegram API**.

Chức năng:

- Đọc log cảnh báo từ Snort
- Gửi thông báo tới **Telegram Bot**
- Giúp quản trị viên **theo dõi hệ thống mọi lúc mọi nơi**
