import 'package:flutter/material.dart';
import '../models/hospital_model.dart';

class HospitalCard extends StatelessWidget {
  final Hospital hospital;
  final VoidCallback? onTap;

  const HospitalCard({super.key, required this.hospital, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16), // Chỉ giữ margin bottom
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ), // Tăng border radius từ 16 lên 20
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(
            20,
          ), // Tăng border radius từ 16 lên 20
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 20,
            ), // Chỉ giữ padding bottom và left
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Phần trên: Logo và Tags
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo bệnh viện
                    _buildHospitalLogo(),
                    const Spacer(),
                    // Tags ở góc phải
                    _buildTags(),
                  ],
                ),
                const SizedBox(height: 16), // Tăng spacing từ 12 lên 16
                // Tên bệnh viện
                Text(
                  hospital.name,
                  style: const TextStyle(
                    fontSize: 21, // Tăng font size từ 18 lên 20
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 54, 54, 54),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 9), // Tăng spacing từ 4 lên 6
                // Địa chỉ
                Text(
                  hospital.address,
                  style: TextStyle(
                    fontSize: 14, // Tăng font size từ 14 lên 15
                    color: const Color.fromARGB(255, 41, 40, 40),
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16), // Tăng spacing từ 12 lên 16
                // Thông tin phụ ở dưới cùng
                Row(
                  children: [
                    // Giờ mở cửa
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 22,
                            color: const Color.fromARGB(255, 5, 5, 5),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              hospital.openingHours,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 5, 5, 5),
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Khoảng cách
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 22,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${hospital.distanceKm} Km',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 5, 5, 5),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHospitalLogo() {
    return Container(
      margin: const EdgeInsets.only(top: 16), // Thêm margin top cho logo
      width: 70, // Tăng width từ 60 lên 70
      height: 70, // Tăng height từ 60 lên 70
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ), // Tăng border radius từ 12 lên 14
        color: Colors.grey[100],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          14,
        ), // Tăng border radius từ 12 lên 14
        child: hospital.logoUrl.isNotEmpty
            ? Image.network(
                hospital.logoUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildDefaultLogo();
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.grey[400]!,
                      ),
                    ),
                  );
                },
              )
            : _buildDefaultLogo(),
      ),
    );
  }

  Widget _buildDefaultLogo() {
    return Image.asset(
      'assets/images/logo.png',
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        // Nếu logo.png cũng không load được, fallback về icon
        return Icon(
          Icons.local_hospital,
          color: Colors.grey[400],
          size: 35,
        ); // Tăng size từ 30 lên 35
      },
    );
  }

  Widget _buildTags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Tag "Cơ sở đã thích" - chỉ hiện khi isFavorite = true
        if (hospital.isFavorite)
          Container(
            width: 175, // Tăng chiều dài của tag
            margin: const EdgeInsets.only(bottom: 8), // Tăng margin từ 6 lên 8
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ), // Tăng padding từ 8,4 lên 10,6
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(
                    255,
                    238,
                    247,
                    241,
                  ).withValues(alpha: 0.1),
                  const Color.fromARGB(
                    255,
                    14,
                    196,
                    81,
                  ).withValues(alpha: 0.25),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(0), // Bỏ bo tròn góc phải bên dưới
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.stars,
                  size: 14, // Tăng size từ 12 lên 14
                  color: const Color(0xFF22C55E),
                ),
                const SizedBox(width: 6), // Tăng spacing từ 4 lên 6
                Expanded(
                  // Text chiếm không gian còn lại (khoảng 2/3)
                  child: Text(
                    'Cơ sở đã thích',
                    style: TextStyle(
                      fontSize: 14, // Tăng font size từ 10 lên 11
                      color: const Color(0xFF22C55E),
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        // Tag "Đơn vị liên kết thông hành y tế" - chỉ hiện khi isMedicalLinked = true
        if (hospital.isMedicalLinked)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ), // Tăng padding từ 8,4 lên 10,6
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(
                    255,
                    247,
                    246,
                    245,
                  ).withValues(alpha: 0.1),
                  const Color.fromARGB(
                    255,
                    235,
                    184,
                    31,
                  ).withValues(alpha: 0.25),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(0), // Bỏ bo tròn góc phải bên dưới
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 14,
                  color: Colors.amber[700],
                ), // Tăng size từ 12 lên 14
                const SizedBox(width: 6), // Tăng spacing từ 4 lên 6
                Text(
                  'Đơn vị liên kết thông hành y tế',
                  style: TextStyle(
                    fontSize: 14, // Tăng font size từ 11 lên 14
                    color: Colors.amber[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
