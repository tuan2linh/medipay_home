import '../models/hope_model.dart';

final List<HopeItem> mockHopeItems = [
  HopeItem(
    id: 'hope-001',
    title: 'Chung tay giúp bé Anh có trái tim khỏe mạnh',
    description:
        'Mang trong mình bệnh tim bẩm sinh, em Nguyễn Tú An – 7 tuổi trú tại xóm Bình Thuận, tỉnh Nghệ An có cơ hội phẫu thuật và sống khỏe mạnh.',
    hospitalName: 'Bệnh viện Nhi Đồng',
    hospitalLogo: 'assets/images/nhidong_logo.png',
    imageUrl: 'assets/images/hopeavatar.png',
    donatedAmount: 9000000,
    targetAmount: 15000000,
    endTime: DateTime.now().add(const Duration(days: 1, hours: 1, minutes: 44)),
    donorAvatars: [
      'assets/images/donor1.png',
      'assets/images/donor2.png',
      'assets/images/donor3.png',
    ],
    totalDonors: 300,
  ),
  HopeItem(
    id: 'hope-002',
    title: 'Chung tay giúp bé Anh có trái tim khỏe mạnh',
    description:
        'Mang trong mình bệnh tim bẩm sinh, em Nguyễn Tú An – 7 tuổi trú tại xóm Bình Thuận, tỉnh Nghệ An có cơ hội phẫu thuật và sống khỏe mạnh.',
    hospitalName: 'Bệnh viện Nhi Đồng',
    hospitalLogo: 'assets/images/nhidong_logo.png',
    imageUrl: 'assets/images/hopeavatar.png',
    donatedAmount: 9000000,
    targetAmount: 15000000,
    endTime: DateTime.now().add(const Duration(days: 1, hours: 1, minutes: 44)),
    donorAvatars: [
      'assets/images/donor1.png',
      'assets/images/donor2.png',
      'assets/images/donor3.png',
    ],
    totalDonors: 300,
  ),
];
