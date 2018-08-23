class Calc {
  int num;
  //万有引力定数
  float G;
  //水,金,火,木,土,天,海,太
  //惑星の半径
  float[]R={2440, 6052, 3390, 69911, 58232, 25362, 24622, 695508};
  //惑星の質量
  //10^23は抜きにしてるから調節してっちょ
  float[]M={3.285*pow(10,23), 48.67*pow(10,23), 6.39*pow(10,23), 18980*pow(10,23), 5683*pow(10,23), 868.1*pow(10,23), 1024.3*pow(10,23), 19890000*pow(10,23)};
  //光の速さ
  float c;

  Calc(int planetNum) {
    num=planetNum;
    //========Gの確立
    G=6.67408*pow(10,11); 
    
    //=======cの調節
    c=299792.458;
  }

  float calculation() {
    float coefficient=1/sqrt(1-2*G*M[num]/R[num]/c/c);
    return coefficient;
  }
}
