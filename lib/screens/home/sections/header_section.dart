import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGreeting(),
        const SizedBox(height: 16),
        _buildMediPayCard(),
        const SizedBox(height: 16),
        _buildMainActionButtons(),
      ],
    );
  }

  // Phần 1: Lời chào ở trên cùng
  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'MediPay',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 228, 56, 56), // Màu đỏ cam
                ),
              ),
              TextSpan(
                text: ' kính chào 😊',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Chúc Anh/Chị thật nhiều sức khoẻ!',
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 29, 28, 28),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // Phần 2: Khung thông tin chính màu vàng cam
  Widget _buildMediPayCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 243, 239, 155),
            const Color.fromARGB(255, 243, 196, 124),
            const Color.fromARGB(255, 241, 164, 47),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Hình ảnh mờ ảo của hai bàn tay che chở trái tim
          Row(
            children: [
              // Bên trái khung
              Expanded(
                child: Row(
                  children: [
                    // Biểu tượng ví/P
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.amber[400]!, Colors.orange[300]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withValues(alpha: 0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Thông tin text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tài khoản thông hành MediPay',
                            style: TextStyle(
                              color: Color.fromARGB(255, 26, 23, 23),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Khám không chờ đợi',
                            style: TextStyle(
                              color: Color.fromARGB(255, 26, 23, 23),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Bên phải khung - Nút liên kết
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add,
                      size: 16,
                      color: Color.fromARGB(255, 26, 23, 23),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Liên kết',
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 23, 23),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Phần 3: Ba nút chức năng lớn
  Widget _buildMainActionButtons() {
    return Row(
      children: [
        // Nút đặt lịch khám - Màu hồng cam
        Expanded(
          flex: 2, // Giảm tỷ lệ chiều rộng
          child: _buildActionButton(
            icon: Icons.calendar_today,
            title: 'Đặt lịch khám',
            color: const Color.fromARGB(255, 240, 87, 82),
          ),
        ),
        const SizedBox(width: 16), // Giảm khoảng cách
        // Nút tra cứu phiếu thu - Màu tím
        Expanded(
          flex: 2,
          child: _buildActionButton(
            icon: Icons.search,
            title: 'Tra cứu phiếu thu',
            color: const Color.fromARGB(255, 179, 111, 238), // Tím
          ),
        ),
        const SizedBox(width: 16),
        // Nút hồ sơ sức khỏe - Màu xanh lá
        Expanded(
          flex: 2,
          child: _buildActionButton(
            icon: Icons.favorite,
            title: 'Hồ sơ sức khoẻ',
            color: const Color.fromARGB(255, 27, 187, 94), // Xanh lá
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      height: 130, // Tăng chiều cao từ 100 lên 120
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.4),
            color,
            color.withValues(alpha: 0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              // Handle button tap
            },
            child: Stack(
              clipBehavior: Clip.none, // Cho phép vòng tròn tràn ra ngoài
              children: [
                // Icon ở góc trên bên phải (tràn ra ngoài)
                Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    width: 60, // Tăng kích thước vòng tròn từ 50 lên 60
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 28,
                    ), // Tăng icon từ 24 lên 28
                  ),
                ),
                // Text ở phía dưới bên trái
                Positioned(
                  bottom: 16, // Tăng bottom margin
                  left: 12,
                  right: 12,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17, // Tăng từ 13 lên 16
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
