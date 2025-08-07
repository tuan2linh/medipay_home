import 'package:flutter/material.dart';
import '../../../mocks/hope_mock.dart';
import '../../../widgets/hope_card.dart';

class HopeSection extends StatelessWidget {
  const HopeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dấu gạch ngang phân cách
        Container(
          margin: const EdgeInsets.only(
            top: 0,
            bottom: 18,
          ), // Tăng bottom từ 16 lên 24
          height: 1,
          color: Colors.grey[300],
        ),
        // Header với tiêu đề và "Xem thêm"
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.park, color: Colors.green[600], size: 24),
                  const SizedBox(width: 8),
                  const Text(
                    'Mầm hy vọng',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 54, 54, 54),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Xử lý khi bấm "Xem thêm"
                },
                child: Text(
                  'Xem thêm',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Danh sách card cuộn ngang
        SizedBox(
          height: 540, // Tăng từ 520 lên 540 để phù hợp với card dài hơn
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: mockHopeItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index < mockHopeItems.length - 1 ? 16 : 0,
                ),
                child: SizedBox(
                  width: 320, // Tăng từ 280 lên 320
                  child: HopeCard(
                    hopeItem: mockHopeItems[index],
                    onTap: () {
                      // Xử lý khi bấm vào card
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
