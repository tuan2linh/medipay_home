class Hospital {
  final String name;
  final String address;
  final double distanceKm;
  final String logoUrl;
  final String openingHours;
  final bool isFavorite;
  final bool isMedicalLinked;

  Hospital({
    required this.name,
    required this.address,
    required this.distanceKm,
    required this.logoUrl,
    required this.openingHours,
    this.isFavorite = false,
    this.isMedicalLinked = false,
  });
}
