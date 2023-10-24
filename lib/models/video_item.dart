class VideoItem {
  final String title;
  final String link;

  VideoItem({required this.title, required this.link});

  factory VideoItem.fromMap(Map<String, dynamic> data) {
    return VideoItem(
      title: data['title'] ?? '',
      link: data['link'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'link': link,
    };
  }
}
