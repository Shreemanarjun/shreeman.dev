// ignore_for_file: public_member_api_docs, sort_constructors_first

class Platforms {
  final String? android;
  final String? ios;
  final String? web;
  final String? windows;
  const Platforms({this.android, this.ios, this.web, this.windows});

  @override
  bool operator ==(covariant Platforms other) {
    if (identical(this, other)) return true;

    return
      other.android == android &&
      other.ios == ios &&
      other.web == web &&
      other.windows == windows;
  }

  @override
  int get hashCode {
    return android.hashCode ^
      ios.hashCode ^
      web.hashCode ^
      windows.hashCode;
  }
}
