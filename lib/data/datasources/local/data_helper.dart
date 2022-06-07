class DataHelper {
  final String? title;
  final String? desc;
  bool isSelected;
  final String? iconPath;
  final String? icon;
  final String? url;
  final String? type;
  final int? id;

  DataHelper({
    this.title,
    this.desc,
    this.iconPath,
    this.isSelected = false,
    this.icon,
    this.url,
    this.type,
    this.id
  });
}
