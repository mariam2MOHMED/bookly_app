
class BookModel {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({this.kind, this.id, this.etag, this.selfLink, this.volumeInfo, this.saleInfo, this.accessInfo, this.searchInfo});

  BookModel.fromJson(Map<String, dynamic> json) {
    kind = json["kind"];
    id = json["id"];
    etag = json["etag"];
    selfLink = json["selfLink"];
    volumeInfo = json["volumeInfo"] == null ? null : VolumeInfo.fromJson(json["volumeInfo"]);
    saleInfo = json["saleInfo"] == null ? null : SaleInfo.fromJson(json["saleInfo"]);
    accessInfo = json["accessInfo"] == null ? null : AccessInfo.fromJson(json["accessInfo"]);
    searchInfo = json["searchInfo"] == null ? null : SearchInfo.fromJson(json["searchInfo"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["kind"] = kind;
    _data["id"] = id;
    _data["etag"] = etag;
    _data["selfLink"] = selfLink;
    if(volumeInfo != null) {
      _data["volumeInfo"] = volumeInfo?.toJson();
    }
    if(saleInfo != null) {
      _data["saleInfo"] = saleInfo?.toJson();
    }
    if(accessInfo != null) {
      _data["accessInfo"] = accessInfo?.toJson();
    }
    if(searchInfo != null) {
      _data["searchInfo"] = searchInfo?.toJson();
    }
    return _data;
  }
}

class SearchInfo {
  String? textSnippet;

  SearchInfo({this.textSnippet});

  SearchInfo.fromJson(Map<String, dynamic> json) {
    textSnippet = json["textSnippet"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["textSnippet"] = textSnippet;
    return _data;
  }
}

class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Pdf? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  AccessInfo({this.country, this.viewability, this.embeddable, this.publicDomain, this.textToSpeechPermission, this.epub, this.pdf, this.webReaderLink, this.accessViewStatus, this.quoteSharingAllowed});

  AccessInfo.fromJson(Map<String, dynamic> json) {
    country = json["country"];
    viewability = json["viewability"];
    embeddable = json["embeddable"];
    publicDomain = json["publicDomain"];
    textToSpeechPermission = json["textToSpeechPermission"];
    epub = json["epub"] == null ? null : Epub.fromJson(json["epub"]);
    pdf = json["pdf"] == null ? null : Pdf.fromJson(json["pdf"]);
    webReaderLink = json["webReaderLink"];
    accessViewStatus = json["accessViewStatus"];
    quoteSharingAllowed = json["quoteSharingAllowed"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["country"] = country;
    _data["viewability"] = viewability;
    _data["embeddable"] = embeddable;
    _data["publicDomain"] = publicDomain;
    _data["textToSpeechPermission"] = textToSpeechPermission;
    if(epub != null) {
      _data["epub"] = epub?.toJson();
    }
    if(pdf != null) {
      _data["pdf"] = pdf?.toJson();
    }
    _data["webReaderLink"] = webReaderLink;
    _data["accessViewStatus"] = accessViewStatus;
    _data["quoteSharingAllowed"] = quoteSharingAllowed;
    return _data;
  }
}

class Pdf {
  bool? isAvailable;
  String? acsTokenLink;

  Pdf({this.isAvailable, this.acsTokenLink});

  Pdf.fromJson(Map<String, dynamic> json) {
    isAvailable = json["isAvailable"];
    acsTokenLink = json["acsTokenLink"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["isAvailable"] = isAvailable;
    _data["acsTokenLink"] = acsTokenLink;
    return _data;
  }
}

class Epub {
  bool? isAvailable;

  Epub({this.isAvailable});

  Epub.fromJson(Map<String, dynamic> json) {
    isAvailable = json["isAvailable"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["isAvailable"] = isAvailable;
    return _data;
  }
}

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;

  SaleInfo({this.country, this.saleability, this.isEbook});

  SaleInfo.fromJson(Map<String, dynamic> json) {
    country = json["country"];
    saleability = json["saleability"];
    isEbook = json["isEbook"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["country"] = country;
    _data["saleability"] = saleability;
    _data["isEbook"] = isEbook;
    return _data;
  }
}

class VolumeInfo {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String>? categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({this.title, this.authors, this.publisher, this.publishedDate, this.description, this.industryIdentifiers, this.readingModes, this.pageCount, this.printType, this.categories, this.maturityRating, this.allowAnonLogging, this.contentVersion, this.panelizationSummary, this.imageLinks, this.language, this.previewLink, this.infoLink, this.canonicalVolumeLink});

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    authors = json["authors"] == null ? null : List<String>.from(json["authors"]);
    publisher = json["publisher"];
    publishedDate = json["publishedDate"];
    description = json["description"];
    industryIdentifiers = json["industryIdentifiers"] == null ? null : (json["industryIdentifiers"] as List).map((e) => IndustryIdentifiers.fromJson(e)).toList();
    readingModes = json["readingModes"] == null ? null : ReadingModes.fromJson(json["readingModes"]);
    pageCount = json["pageCount"];
    printType = json["printType"];
    categories = json["categories"] == null ? null : List<String>.from(json["categories"]);
    maturityRating = json["maturityRating"];
    allowAnonLogging = json["allowAnonLogging"];
    contentVersion = json["contentVersion"];
    panelizationSummary = json["panelizationSummary"] == null ? null : PanelizationSummary.fromJson(json["panelizationSummary"]);
    imageLinks = json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"]);
    language = json["language"];
    previewLink = json["previewLink"];
    infoLink = json["infoLink"];
    canonicalVolumeLink = json["canonicalVolumeLink"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    if(authors != null) {
      _data["authors"] = authors;
    }
    _data["publisher"] = publisher;
    _data["publishedDate"] = publishedDate;
    _data["description"] = description;
    if(industryIdentifiers != null) {
      _data["industryIdentifiers"] = industryIdentifiers?.map((e) => e.toJson()).toList();
    }
    if(readingModes != null) {
      _data["readingModes"] = readingModes?.toJson();
    }
    _data["pageCount"] = pageCount;
    _data["printType"] = printType;
    if(categories != null) {
      _data["categories"] = categories;
    }
    _data["maturityRating"] = maturityRating;
    _data["allowAnonLogging"] = allowAnonLogging;
    _data["contentVersion"] = contentVersion;
    if(panelizationSummary != null) {
      _data["panelizationSummary"] = panelizationSummary?.toJson();
    }
    if(imageLinks != null) {
      _data["imageLinks"] = imageLinks?.toJson();
    }
    _data["language"] = language;
    _data["previewLink"] = previewLink;
    _data["infoLink"] = infoLink;
    _data["canonicalVolumeLink"] = canonicalVolumeLink;
    return _data;
  }
}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  ImageLinks.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json["smallThumbnail"];
    thumbnail = json["thumbnail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["smallThumbnail"] = smallThumbnail;
    _data["thumbnail"] = thumbnail;
    return _data;
  }
}

class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  PanelizationSummary({this.containsEpubBubbles, this.containsImageBubbles});

  PanelizationSummary.fromJson(Map<String, dynamic> json) {
    containsEpubBubbles = json["containsEpubBubbles"];
    containsImageBubbles = json["containsImageBubbles"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["containsEpubBubbles"] = containsEpubBubbles;
    _data["containsImageBubbles"] = containsImageBubbles;
    return _data;
  }
}

class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({this.text, this.image});

  ReadingModes.fromJson(Map<String, dynamic> json) {
    text = json["text"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["text"] = text;
    _data["image"] = image;
    return _data;
  }
}

class IndustryIdentifiers {
  String? type;
  String? identifier;

  IndustryIdentifiers({this.type, this.identifier});

  IndustryIdentifiers.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    identifier = json["identifier"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["identifier"] = identifier;
    return _data;
  }
}
