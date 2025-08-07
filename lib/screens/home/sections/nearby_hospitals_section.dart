import 'package:flutter/material.dart';
import '../../../widgets/hospital_card.dart';
import '../../../mocks/hospital_mock.dart';

class NearbyHospitalsSection extends StatelessWidget {
  const NearbyHospitalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Đường phân cách
        Container(
          // width: double.infinity,
          height: 1,
          color: Colors.grey[300],
          margin: const EdgeInsets.only(bottom: 24),
        ),
        // Tiêu đề phần
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Bên trái: Icon và text
            Row(
              children: [
                // Biểu tượng bệnh viện màu đỏ
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.domain,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                const SizedBox(width: 8),
                // Text "Bệnh viện gần anh/chị"
                const Text(
                  "Bệnh viện gần anh/chị",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
            // Bên phải: "Xem thêm"
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                "Xem thêm",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Danh sách bệnh viện
        ...mockHospitals.map(
          (hospital) => HospitalCard(
            hospital: hospital,
            // Bỏ onTap - chỉ hiển thị thông tin
          ),
        ),
      ],
    );
  }
}
