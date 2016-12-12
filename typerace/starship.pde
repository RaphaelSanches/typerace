/*

  STARSHIP CLASS

*/

class Starship {
  Sprite spriteBase;
  float beforeY;
  float x;
  float y;
  float initialVy = 0.1;
  float vy = initialVy;
  float turbo = 4;
  float posicaox;
  float posicaoy;
  
  int randomKey;
  int wins = 0;
  
  // Time
  int turboActiveTime;
  // tempo em milisegundos
  int timeTurbo = 200;
  
  boolean turboActive = false;
  
  AudioPlayer turboSound;
  
  // Parâmetros: x, y, sprite e o som do turbo
  // posicao x, posicao y
  Starship(float _x, float _y, Sprite _spriteBase, AudioPlayer _turboSound){
    x = _x;
    y = _y;
    spriteBase = _spriteBase;
    turboSound = _turboSound;
    
    randomize();
  }
  
  // funções continuas
  void run(){
    display();
    fly(); 
    verifyKey();
    turbo();
  }
  
  // sprites
  void display(){
    spriteBase.setXY(x, y);
    spriteBase.update(2);
    spriteBase.draw();
  }
  
  // alone moving
  void fly(){
    y -= vy;
  }

  
  //turbo
  public void turbo(){
    
    if(turboActive){
      if(millis() < turboActiveTime + timeTurbo){

        this.vy = turbo;
      }
      
      else {
        this.vy = initialVy;
      }
    }
    
  }
  
  
  // Gera uma letra aleatóriamente
  void randomize() {
    this.randomKey = int(random(0, 26));
    this.posicaox = random(50, width-50);
    this.posicaoy = random(30, height-100);
    turboSound.rewind();
  }
  
  
  // Verifica se a letra apertada é igual a letra gerada aleatoriamente
  void verifyKey(){
    if (key == keys[0][this.randomKey] || key == keys[1][this.randomKey]) {
      
      // inicia o contador
      this.turboActiveTime = millis();
      
      //ativa o turbo
      this.turboActive = true;
      turboSound.play();
      randomize();
    }
  }
  
}