Dự án này tập trung vào việc nghiên cứu, cài đặt và cấu hình hệ thống phát hiện xâm nhập mã nguồn mở Snort 3 (phiên bản 3.7.1.0). Hệ thống được triển khai trên môi trường ảo hóa VMware Workstation để giám sát và đưa ra cảnh báo thời gian thực đối với các cuộc tấn công mạng phổ biến.

📋 Mục tiêu đồ án

Xây dựng hệ thống NIDS: Triển khai trên Ubuntu 22.04 và CentOS 7.


Phát hiện tấn công: Thiết lập bộ quy tắc (local.rules) để nhận diện các hành vi xâm nhập.


Đánh giá hiệu năng: Tối ưu hóa tỷ lệ phát hiện (TPR) và giảm thiểu báo động giả (FPR).

🛠️ Cấu trúc các file cấu hình
Dự án bao gồm các file cốt lõi đã được tinh chỉnh bám sát thực tế:

snort.lua: File cấu hình chính, định nghĩa mạng nội bộ 192.168.208.0/24.

local.rules: Chứa các luật phát hiện tấn công (ICMP Flood, Port Scanning, Brute Force, SYN Flood).


testing_scenarios.sh: Tập hợp các kịch bản tấn công dùng để demo.

🚀 Hướng dẫn vận hành hệ thống
Phần này tổng hợp các câu lệnh quan trọng mà tôi đã thực hiện trong quá trình triển khai trên terminal:

1. Kiểm tra cấu hình (Configuration Validation)
Trước khi chạy, cần xác nhận các file cấu hình và luật không có lỗi cú pháp:

Bash
sudo snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/snort/rules/local.rules -T
Lưu ý: Hệ thống sẽ trả về thông báo Snort successfully validated the configuration nếu thành công.

2. Khởi chạy giám sát thời gian thực
Sử dụng lệnh sau để Snort bắt đầu lắng nghe lưu lượng trên card mạng ảo (ví dụ: ens33):

Bash
sudo snort -i ens33 -c /usr/local/etc/snort/snort.lua -A alert_fast
-i ens33: Chọn giao diện mạng để giám sát.

-A alert_fast: Hiển thị cảnh báo rút gọn ngay lập tức trên màn hình.

🧪 Kịch bản kiểm thử (Demo Scenarios)
Các cuộc tấn công giả lập đã được thực hiện thành công từ máy tấn công nhắm vào địa chỉ 192.168.208.129:

ICMP Flood: ping -f 192.168.208.129.

Quét cổng (Nmap): nmap -sS 192.168.208.129 hoặc nmap -sX 192.168.208.129.

Ping of Death: sudo hping3 -1 -d 65000 --frag -c 5 192.168.208.129.

DoS (SYN Flood): sudo hping3 -S --flood -p 80 192.168.208.129.

Brute Force SSH: hydra -l root -P mylist.txt -t 4 ssh://192.168.208.129.

📂 Nguyên lý hoạt động
Snort 3 vận hành thông qua các giai đoạn:


Packet Decoder: Giải mã gói tin từ card mạng ảo.


Preprocessor: Tiền xử lý và chuẩn hóa dữ liệu.


Detection Engine: So khớp với tập luật local.rules.


Logging/Alerting: Xuất cảnh báo khi có sự trùng khớp.
