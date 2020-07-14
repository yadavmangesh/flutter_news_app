class Utils {
  static String getInitial(String title) {
    if (title != null) {
      if (title.length > 2) {
        return title.substring(0, 2);
      } else if (title.length == 2) {
        return title;
      } else {
        return "NA";
      }
    }
  }

  static String getAuther(String auther) {
    return auther != 'null' ? auther : 'Unknown';
  }

  static String getPublishDate(String publishedAt) {
    if (publishedAt != null) {
      return publishedAt.split("T")[0];
    } else {
      return "Unknown";
    }
  }
}
