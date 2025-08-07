import 'package:flutter/material.dart';
import 'sections/header_section.dart';
import 'sections/nearby_hospitals_section.dart';
import 'sections/hope_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _dragSheetSize = 0.62;

  @override
  Widget build(BuildContext context) {
    // Tính toán vị trí của air quality widget dựa trên drag sheet size
    double airQualityTop =
        MediaQuery.of(context).size.height *
        (0.26 + (_dragSheetSize - 0.62) * 0.3);

    // Giới hạn vị trí tối thiểu (không đi lên quá cao)
    double minTop = MediaQuery.of(context).size.height * 0.1;
    airQualityTop = airQualityTop < minTop ? minTop : airQualityTop;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          _buildTopBackground(),
          // Air Quality Widget
          Positioned(
            top: airQualityTop,
            left: 16,
            right: 16,
            child: _buildAirQualityWidget(),
          ),
          // Draggable Scrollable Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.62, // Bắt đầu ở 60% màn hình
            minChildSize: 0.62, // Không thể kéo xuống dưới 60%
            maxChildSize: 1.0, // Tối đa che toàn bộ màn hình
            builder: (context, scrollController) {
              return NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  setState(() {
                    _dragSheetSize = notification.extent;
                  });
                  return false;
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Handle bar
                      Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      // Content
                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            const HeaderSection(),
                            const SizedBox(height: 24),
                            // Phần bệnh viện gần đây
                            const NearbyHospitalsSection(),
                            const SizedBox(height: 24),
                            // Phần Mầm hi vọng
                            const HopeSection(),
                            const SizedBox(height: 100), // Bottom padding
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTopBackground() {
    return Container(
      width: double.infinity,
      height: 480,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/be41601428aa5662948bb264efc7eb602538955c.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAirQualityWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Biểu tượng trong bong bóng chat màu đỏ
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.air, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 10),
          // Nhãn thông tin
          const Expanded(
            child: Text(
              'Chất lượng không khí hôm nay',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF616161),
              ),
            ),
          ),
          // Chỉ số và trạng thái
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF22C55E).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '45',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF22C55E),
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Trung bình',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF22C55E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
