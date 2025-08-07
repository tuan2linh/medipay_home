class HopeItem {
  final String id;
  final String title;
  final String description;
  final String hospitalName;
  final String hospitalLogo;
  final String imageUrl;
  final int donatedAmount;
  final int targetAmount;
  final DateTime endTime;
  final List<String> donorAvatars;
  final int totalDonors;

  HopeItem({
    required this.id,
    required this.title,
    required this.description,
    required this.hospitalName,
    required this.hospitalLogo,
    required this.imageUrl,
    required this.donatedAmount,
    required this.targetAmount,
    required this.endTime,
    required this.donorAvatars,
    required this.totalDonors,
  });
}
