/*

  ESTRELAS CLASS

*/

class Estrelas {
  float x[];
  float y[];
  float size[];
  float initialSize[];
  int quantidade;

  Estrelas(int quantidade){
    x = new float[quantidade];
    y = new float[quantidade];
    size = new float[quantidade];
    initialSize = new float[quantidade];
    this.quantidade = quantidade;
    
    for(int i = 0; i < quantidade; i++){
      x[i] = random(0, width);
      y[i] = random(0, (height/4)*3);
      initialSize[i] = random(1, 8);
      size[i] = initialSize[i];
    }
  }
  
  void piscar(){
    for(int i = 0; i < quantidade; i++){
      size[i] = size[i] + .1;
      
      if(size[i] >= 10){
      size[i] = initialSize[i];
      }
    }
  }
  
  void animar(){
    noStroke();
    fill(255);
    for(int i = 0; i < quantidade; i++){
      ellipse(x[i], y[i], size[i], size[i]);
    }
    piscar();
  }
}
    