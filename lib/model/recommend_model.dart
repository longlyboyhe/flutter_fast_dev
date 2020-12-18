class RecommendModel {
	String chapterName;
	String title;
	int id;
	String link;
	String niceDate;

	RecommendModel.fromJson(Map<String, dynamic> json)
			: title = json['title'],
				chapterName = json['chapterName'],
				id = json['id'],
				link = json['link'],
				niceDate = json['niceDate'];

	Map<String, dynamic> toJson() => {
		'title': title,
		'chapterName': chapterName,
		'id': id,
		'link': link,
		'niceDate': niceDate,
	};

	@override
	String toString() {
		StringBuffer sb = new StringBuffer('{');
		sb.write("\"title\":\"$title\"");
		sb.write("\"chapterName\":\"$chapterName\"");
		sb.write(",\"id\":$id");
		sb.write(",\"link\":\"$link\"");
		sb.write(",\"niceDate\":\"$niceDate\"");
		sb.write('}');
		return sb.toString();
	}
}