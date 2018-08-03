//天気のAPIのURL
String baseURL = "http://weather.livedoor.com/forecast/webservice/json/v1?city=";
//http://weather.livedoor.com/forecast/rss/primary_area.xml
//↑ここでid探す
String city = "130010";
String title;
JSONArray forecasts;
void setup(){
  size(200, 200);
  //APIのcityの部分にアクセス
  //今回だったら東京都　東京の天気にアクセスしてる
  JSONObject w = loadJSONObject(baseURL + city);
  //今回だったら東京都　東京の天気
  title = w.getString("title");
  //livedoorの天気のデータ一覧
  forecasts = w.getJSONArray("forecasts");
}
void draw(){
  background(255);
  fill(0);
  text(title, 10, 30);
  for(int i = 0; i < forecasts.size(); i++){
    //APIの情報に一つずつアクセス
    JSONObject f = forecasts.getJSONObject(i);
    //dateLabelは今日とか明日とか
    //telopは天気予報
    String s = f.getString("dateLabel") + ":" + f.getString("telop");
    //温度の情報をget
    JSONObject t = f.getJSONObject("temperature");
    //最低気温がわかったら
    if(!t.isNull("min")){
      //最低気温を入れる
      String d = t.getJSONObject("min").getString("celsius");
      s = s + ", min:" + d;
    }
    //最高気温がわかったら
    if(!t.isNull("max")){
      //最高気温を載せる
      String d = t.getJSONObject("max").getString("celsius");
      s = s + ", max:" + d;
    }
    
    text(s, 10, 50 + 20 * i);
  }
}
