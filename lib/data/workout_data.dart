
class FriendsData {
  final String title;
  final String heartrate;
  final String oxygenpercent;
  final int heartrate1;
  final int SPO2;
  final String image;


  FriendsData({
    required this.title,
    required this.heartrate,
    required this.oxygenpercent,
    required this.heartrate1,
    required this.SPO2,
    required this.image,

  });

  @override
  String toString() {
    return 'FriendsData(title: $title, heartrate: $heartrate, oxygenpercent: $oxygenpercent, currentProgress: $heartrate1, progress: $SPO2, image: $image)';
  }
}