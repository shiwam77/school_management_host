class AdminMenuItem {
  String? title;
  String? icon;
  bool? isHeader;
  String? route;
  List<AdminMenuItem>? children;

  AdminMenuItem({
    this.title,
    this.icon,
    this.isHeader,
    this.route,
    List<AdminMenuItem>? children,
  }) : children = children ?? [];

  factory AdminMenuItem.fromJson(Map<String, dynamic> json) => AdminMenuItem(
        title: json["title"],
        route: json["route"],
        icon: json["icon"] ?? "",
        isHeader: json["is_header"],
        children: json["children"] == null
            ? []
            : List<AdminMenuItem>.from(
                json["children"]!.map((x) => AdminMenuItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon ?? "",
        "is_header": "$isHeader",
        "route": route,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}
