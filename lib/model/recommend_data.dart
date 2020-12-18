class RecommendDataModel {
	int curPage;
	List datas;

	RecommendDataModel.fromJson(Map<String, dynamic> json)
			: curPage = json['curPage'],
				datas = json['datas'];
}