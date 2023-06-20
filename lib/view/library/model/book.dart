class Book {
  String? id;
  String? title;
  String? series;
  String? author;
  String? year;
  String? publisher;
  String? identifier;
  String? coverurl;
  String? descr;
  String? extension;
  String? ipfsCid;

  Book(
      {this.id,
      this.title,
      this.series,
      this.author,
      this.year,
      this.publisher,
      this.identifier,
      this.coverurl,
      this.descr,
      this.extension,
      this.ipfsCid});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    series = json['series'];
    author = json['author'];
    year = json['year'];
    publisher = json['publisher'];
    identifier = json['identifier'];
    coverurl = json['coverurl'];
    descr = json['descr'];
    extension = json['extension'];
    ipfsCid = json['ipfs_cid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['series'] = this.series;
    data['author'] = this.author;
    data['year'] = this.year;
    data['publisher'] = this.publisher;
    data['identifier'] = this.identifier;
    data['coverurl'] = this.coverurl;
    data['descr'] = this.descr;
    data['extension'] = this.extension;
    data['ipfs_cid'] = this.ipfsCid;
    return data;
  }
}
