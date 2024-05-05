class AppVersion {
  String? appVersion;
  String? file;

  AppVersion({
    this.appVersion,
    this.file,
  });

  factory AppVersion.fromJson(Map<String, dynamic> json) => AppVersion(
        appVersion: json["current_version"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "current_version": appVersion,
        "file": appVersion,
      };
}
