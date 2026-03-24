# Snort3-NIDS-Deployment-Testing
Dự án tập trung vào việc nghiên cứu, cài đặt và cấu hình hệ thống phát hiện xâm nhập mã nguồn mở Snort 3 (phiên bản 3.7.1.0). Hệ thống được triển khai trên môi trường ảo hóa VMware Workstation (sử dụng Ubuntu 22.04 và CentOS 7) để giám sát và đưa ra cảnh báo thời gian thực đối với các cuộc tấn công mạng phổ biến.

1. Thành phần cốt lõi của dự án
Dự án bao gồm các file cấu hình quan trọng mà tôi đã thiết lập và tối ưu hóa:


local.rules: Chứa các tập luật (rules) tự viết để nhận diện dấu hiệu tấn công.

snort.lua: File cấu hình chính điều khiển bộ máy Snort, định nghĩa dải mạng bảo vệ (HOME_NET).


INSTALL_CENTOS7.md: Hướng dẫn chi tiết các bước biên dịch Snort 3 từ nguồn trên CentOS 7.

2. Các kịch bản tấn công đã thực hiện (Demo)
Hệ thống đã được kiểm thử và đưa ra cảnh báo chính xác cho các loại hình tấn công sau:

3. Kiến trúc và Nguyên lý hoạt động
Hệ thống vận hành dựa trên việc so khớp mẫu (pattern matching) qua 4 thành phần chính:


Packet Decoder: Thu thập gói tin từ card mạng ảo (ví dụ: ens33).


Preprocessor: Xử lý sơ bộ, chuẩn hóa dữ liệu và phát hiện bất thường.


Detection Engine: So sánh nội dung gói tin với các tập luật trong local.rules.


Logging and Alerting: Ghi nhật ký và tạo cảnh báo ngay lập tức khi phát hiện xâm nhập.

4. Hướng dẫn vận hành
Kiểm tra cấu hình:
Sử dụng lệnh sau để xác nhận file cấu hình và luật không có lỗi:

Khởi động giám sát thời gian thực:
