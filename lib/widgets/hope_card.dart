import 'package:flutter/material.dart';
import '../models/hope_model.dart';

class HopeCard extends StatefulWidget {
  final HopeItem hopeItem;
  final VoidCallback? onTap;

  const HopeCard({super.key, required this.hopeItem, this.onTap});

  @override
  State<HopeCard> createState() => _HopeCardState();
}

class _HopeCardState extends State<HopeCard> {
  // Cache các giá trị tính toán để tránh tính lại trong build()
  late final double progressPercentage;
  late final String formattedDonatedAmount;
  late final String formattedTargetAmount;

  @override
  void initState() {
    super.initState();
    // Tính toán một lần trong initState
    progressPercentage =
        widget.hopeItem.donatedAmount / widget.hopeItem.targetAmount;
    formattedDonatedAmount = _formatCurrency(widget.hopeItem.donatedAmount);
    formattedTargetAmount = _formatCurrency(widget.hopeItem.targetAmount);
  }

  Widget _buildTimeUnit(String value, String unit) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 54, 54, 54),
            height: 1.0, // Giảm line height để text sát nhau hơn
          ),
        ),
        Text(
          unit,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
            height: 1.5, // Giảm line height
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Hình ảnh chính và đồng hồ đếm ngược
              _buildImageWithCountdown(),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 2. Tiêu đề chiến dịch
                    Text(
                      widget.hopeItem.title,
                      style: const TextStyle(
                        fontSize: 18, // Tăng từ 16 lên 18
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 54, 54, 54),
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8), // Tăng từ 6 lên 8
                    // 3. Đơn vị bảo trợ
                    _buildHospitalInfo(),
                    const SizedBox(height: 8), // Tăng từ 6 lên 8
                    // 4. Mô tả tóm tắt
                    Text(
                      widget.hopeItem.description,
                      style: TextStyle(
                        fontSize: 14, // Tăng từ 13 lên 14
                        color: const Color.fromARGB(255, 66, 66, 66),
                        height: 1.4,
                      ),
                      maxLines: 3, // Tăng từ 2 lên 3 để hiển thị nhiều hơn
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 14), // Tăng từ 10 lên 12
                    // 5. Tiến độ quyên góp
                    _buildProgressSection(),
                    const SizedBox(height: 16), // Tăng từ 10 lên 12
                    // 6. Bằng chứng xã hội
                    _buildSocialProof(),
                    const SizedBox(height: 24), // Tăng từ 12 lên 16
                    // 7. Nút kêu gọi hành động
                    _buildActionButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageWithCountdown() {
    return SizedBox(
      height: 180, // Tăng từ 140 lên 180
      width: double.infinity,
      child: Stack(
        children: [
          // Hình ảnh chính
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              widget.hopeItem.imageUrl,
              height: 180, // Tăng từ 140 lên 180
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180, // Tăng từ 140 lên 180
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.image_not_supported,
                    color: Colors.grey[500],
                    size: 50,
                  ),
                );
              },
            ),
          ),

          // Đồng hồ đếm ngược ở góc trên trái
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white.withValues(
                  alpha: 0.9,
                ), // Hiệu ứng frosted glass
                borderRadius: BorderRadius.circular(
                  20,
                ), // Bo tròn như viên thuốc
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon đồng hồ
                  Container(
                    width: 20, // Giảm từ 24 xuống 20
                    height: 20, // Giảm từ 24 xuống 20
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 87, 34), // Màu đỏ cam
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 12, // Giảm từ 14 xuống 12
                    ),
                  ),
                  const SizedBox(width: 6),
                  // Ngày
                  _buildTimeUnit('01', 'ngày'),
                  Container(
                    width: 1,
                    height: 20,
                    color: Colors.grey.withValues(alpha: 0.3),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                  ),
                  // Giờ
                  _buildTimeUnit('01', 'giờ'),
                  Container(
                    width: 1,
                    height: 10,
                    color: Colors.grey.withValues(alpha: 0.3),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                  ),
                  // Phút
                  _buildTimeUnit('44', 'phút'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHospitalInfo() {
    return Row(
      children: [
        // Logo bệnh viện
        Container(
          width: 28, // Tăng từ 24 lên 28
          height: 28, // Tăng từ 24 lên 28
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), // Tăng từ 12 lên 14
            color: Colors.grey[100],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14), // Tăng từ 12 lên 14
            child: Image.asset(
              widget.hopeItem.hospitalLogo,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.local_hospital,
                  color: Colors.grey[400],
                  size: 24, // Tăng từ 16 lên 18
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 10), // Tăng từ 8 lên 10
        // Tên bệnh viện
        Expanded(
          child: Text(
            widget.hopeItem.hospitalName,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Số tiền quyên góp
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: formattedDonatedAmount,
                style: const TextStyle(
                  fontSize: 18, // Tăng từ 16 lên 18
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 250, 91, 42),
                ),
              ),
              TextSpan(
                text: '/$formattedTargetAmount',
                style: TextStyle(
                  fontSize: 16, // Tăng từ 14 lên 16
                  color: const Color.fromARGB(255, 66, 65, 65),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Thanh tiến độ
        Container(
          height: 8, // Tăng từ 6 lên 8
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4), // Tăng từ 3 lên 4
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progressPercentage.clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF8B5CF6), // Màu tím
                borderRadius: BorderRadius.circular(4), // Tăng từ 3 lên 4
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialProof() {
    return Row(
      children: [
        // Avatar của người quyên góp
        SizedBox(
          width: 70, // Tăng từ 60 lên 70
          height: 28, // Tăng từ 24 lên 28
          child: Stack(
            children: [
              for (
                int i = 0;
                i < widget.hopeItem.donorAvatars.length && i < 3;
                i++
              )
                Positioned(
                  left: i * 18.0, // Tăng từ 15.0 lên 18.0
                  child: Container(
                    width: 28, // Tăng từ 24 lên 28
                    height: 28, // Tăng từ 24 lên 28
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        14,
                      ), // Tăng từ 12 lên 14
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // Tăng từ 10 lên 12
                      child: Image.asset(
                        widget.hopeItem.donorAvatars[i],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.person,
                              color: Colors.grey[500],
                              size: 14, // Tăng từ 12 lên 14
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 10), // Tăng từ 8 lên 10
        // Số lượng người quyên góp
        Text(
          '+${widget.hopeItem.totalDonors} lượt quyên góp',
          style: TextStyle(
            fontSize: 13, // Tăng từ 12 lên 13
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton() {
    return Container(
      width: double.infinity,
      height: 44, // Tăng từ 40 lên 44
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 244, 114, 54),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12), // Tăng từ 20 lên 22
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10), // Tăng từ 18 lên 20
          onTap: () {
            // Xử lý khi bấm nút quyên góp
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tăng từ 18 lên 20
              SizedBox(width: 10), // Tăng từ 8 lên 10
              Text(
                'Chung tay góp sức  ',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18, // Tăng từ 14 lên 15
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(Icons.volunteer_activism, color: Colors.red, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  String _formatCurrency(int amount) {
    if (amount >= 1000000) {
      double millions = amount / 1000000;
      if (millions == millions.toInt()) {
        return '${millions.toInt()},000,000đ';
      } else {
        return '${millions.toStringAsFixed(1)}tr đ';
      }
    } else if (amount >= 1000) {
      return '${amount ~/ 1000},000đ';
    } else {
      return '$amountđ';
    }
  }
}
