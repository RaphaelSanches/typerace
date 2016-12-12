/*

  LETRINHAS CLASS

*/

class Letrinhas {
  float x[];
  float y[];
  int letra[];
  int quantidade;
  int tamanho[];
  PFont font;
  
  Letrinhas(int quantidade){
    x = new float[quantidade];
    y = new float[quantidade];
    letra = new int[quantidade];
    tamanho = new int[quantidade];
    this.quantidade = quantidade;
    font = createFont("MyriadPro.ttf", 100);
    textFont(font);
    textSize(15);
  
    for(int i = 0; i < quantidade; i++){
      x[i] = random(0, width);
      y[i] = random(0, (height/3)*2);
      letra[i] = (int)random(0, 23);
      tamanho[i] = (int)random(5, 20);
    }
  }
  
  void animar(){
    noStroke();
    fill(255);
    for(int i = 0; i < quantidade; i++){
      textSize(tamanho[i]);
      text(keys[1][letra[i]], x[i], y[i]);
    }
  }
}




    