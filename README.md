**Danh Bạ Nghề Nghiệp❤️ Made with Flutter**

**Giới thiệu:**

**Danh Bạ Nghề Nghiệp** là một ứng dụng danh sách tên người và công việc của họ đơn giản được xây dựng bằng Flutter và Firebase. Nó cho phép người dùng tạo, chỉnh sửa, xóa cập nhập các tác vụ. Ứng dụng sử dụng Firebase để xác thực và lưu trữ đám mây.

**Điều kiện tiêu quyết:**

Trước khi bắt đầu, hãy đảm bảo bạn đã cài đặt các phần sau:

- Flutter
- Firebase

**Cấu trúc thư mục:**

- lib: Chứa mã nguồn của ứng dụng.
- data: Chứa các lớp và logic liên quan đến dữ liệu.
- reusable: Chứa các widget.
- screens: Chứa các màn hình của ứng dụng.
- home_page.dart: Màn hình chính hiển thị danh sách công việc và các chức năng quản lý.
- signin_screen.dart: Màn hình đăng nhập.
- signup_screen.dart: Màn hình đăng ký.
- Reset_password.dart: Màn hình đổi mật khẩu.
- edit_task_screen.dart: Màn hình để sửa tên công việc.
- main.dart: Nơi chính để khởi tạo ứng dụng và xác định các màn hình cơ bản.

**Các thư viện sử dụng:**

- Material.dart Thư viện này cung cấp nhiều widget và chủ đề thiết kế Material Design mà bạn có thể sử dụng để xây dựng giao diện người dùng.
- firebase_auth: Chức năng Firebase Authentication là dịch vụ xác thực người dùng của Firebase. Trong ToDoFlutter, được sử dụng để đăng nhập và đăng ký người dùng.
- firebase_core: Chức năng Firebase Core là thư viện cơ bản để khởi tạo và cấu hình Firebase trong ứng dụng Flutter. Trong ToDoFlutter, được sử dụng để khởi tạo Firebase.
- cloud_firestore: Chức năng Firebase Cloud Firestore là một cơ sở dữ liệu NoSQL thời gian thực của Firebase. Trong ToDoFlutter, được sử dụng để lưu trữ và đồng bộ dữ liệu công việc giữa các thiết bị.

**Các bước quan trọng:**

- Xác Thực Người Dùng: Sử dụng Firebase Auth để đăng nhập và đăng ký người dùng.
- Quên mật khẩu: Cho phép người dùng lấy lại mật khẩu của mình
- Lưu Trữ Dữ Liệu: Sử dụng Hive để lưu trữ danh sách công việc cục bộ và sử dụng Cloud Firestore để lưu trữ trên đám mây.
- Cập Nhật Giao Diện Người Dùng: Sử dụng StreamBuilder để theo dõi thay đổi trong danh sách công việc và cập nhật giao diện người dùng một cách tự động.
- Thêm Thông tin: Cho phép người dùng thêm thông tin và đồng bộ ngay lập tức với Cloud Firestore.
- Sửa Tên Thông tin: Cho phép người dùng sửa tên công việc và đồng bộ ngay lập tức với Cloud Firestore.
- Xóa Thông tin: Cho phép người dùng xóa công việc và đồng bộ ngay lập tức với Cloud Firestore.
- Chức năng tìm kiếm theo tên người dùng: giúp người dùng nhanh chóng tìm và truy xuất thông tin cụ thể về một cá nhân trong danh sách, nâng cao hiệu quả và trải nghiệm sử dụng ứng dụng

**Chi tiết các bước:**

1. Tạo Giao Diện Người Dùng (UI) 1.1 Màn Hình Đăng Nhập và Đăng Ký:

- Tạo các trang login_screen.dart và signup_screen.dart.
- Sử dụng TextFormField để nhập email và mật khẩu.
- Sử dụng Firebase Auth để xác thực người dùng khi họ đăng nhập hoặc đăng ký.

1.2 Màn Hình Chính:

- Tạo home_screen.dart để hiển thị danh sách công việc và các chức năng quản lý.
- Sử dụng StreamBuilder để theo dõi thay đổi trong danh sách công việc và cập nhật giao diện tự động.
- Thêm , sửa , xóa thông tin

1. Lưu Trữ Dữ Liệu

2.1 Sử Dụng Hive:

- Tích hợp hive và hive_flutter để lưu trữ danh sách công việc cục bộ.
- Tạo lớp ToDoDataBase để quản lý các phương thức thêm, sửa, xóa và lấy danh sách công việc từ Hive.

2.2 Sử Dụng Firebase:

- Sử dụng Firebase Core để khởi tạo Firebase trong ứng dụng.
- Sử dụng Cloud Firestore để lưu trữ và đồng bộ dữ liệu công việc trên đám mây.
- Xác định các phương thức để đồng bộ dữ liệu giữa Hive và Cloud Firestore.

1. Xử Lý Logic Ứng Dụng:

- Tạo lớp Danh bạn để biểu diễn một công việc.
- Tích hợp logic xử lý công việc như thêm, sửa và xóa .
- Sử dụng StreamController để theo dõi thay đổi trong danh sách công việc và thông báo cho StreamBuilder cập nhật giao diện.

1. Xử Lý Xác Thực Người Dùng

- Sử dụng Firebase Auth để xác thực người dùng.
- Tạo các phương thức đăng nhập, đăng ký và đăng xuất.
- Hiển thị các màn hình tương ứng dựa trên trạng thái xác thực.

**Người khác có thể mở rộng:**

- Nhắc Nhở: Thêm tính năng nhắc nhở cho các thông tin cần thiết.
- Chia Sẻ Danh bạ: Cho phép người dùng chia sẻ công việc với người khác.
- Thiết Lập Ưu Tiên: Cho phép người dùng đặt ưu tiên cho thông tin quan trọng.
- Tích Hợp Nhiều Người Dùng: Thêm tính năng để nhiều người dùng có thể sử dụng ứng dụng trên cùng một danh sách công việc.

**Cách cài đặt và chạy ứng dụng:**

B1: Mở visual studio code

B2: clone code về

B3: Chạy terminal "flutter run --no-sound-null-safety"

B4: Run chạy code trên web

**Cách sử dụng:**

1. Khởi chạy ứng dụng trên trình mô phỏng hoặc thiết bị vật lý.
2. Đăng ký tài khoản mới hoặc đăng nhập bằng tài khoản hiện có.
3. Thêm, chỉnh sửa hoặc xóa nhiệm vụ bằng giao diện ứng dụng.
4. Đánh dấu các nhiệm vụ đã hoàn thành bằng cách chuyển đổi hộp kiểm.
5. Đăng xuất bằng cách sử dụng tùy chọn menu.
