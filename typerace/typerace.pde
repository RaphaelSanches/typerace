/*
  
 TYPERACE
 
 Criado por:
 Michelly Sorge
 Raphael Sanches
 
 */

// BIBLIOTECAS
//------------------------------------
import sprites.utils.*;
import sprites.maths.*;
import sprites.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


// ClASSES
//------------------------------------
Starship player1;
Starship player2;
Sprite p1Sprite;
Sprite p2Sprite;
Sprite backgroundSprite;
Sprite logoSprite;
Sprite startButton;
Estrelas estrelas;
Letrinhas letrinhas;

Minim minim;
AudioPlayer turboSound;
AudioPlayer winSound;

// VAR
//------------------------------------


// Game modes
final int START = 0;
final int PLAY = 1;
final int PAUSED = 2;
final int END = 3;

int mode = START;


// Keys
char[][] keys = {  
  {
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  }
  , 
  {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  }
};
int winner;



void setup() {
  size(500, 800);  
  textSize(30);
  textAlign(CENTER); 


  // Sprites
  backgroundSprite = new Sprite(this, "background.png", -1);
  logoSprite = new Sprite(this, "logo.png", 0);
  startButton = new Sprite(this, "startButton.png", 0);
  p1Sprite = new Sprite(this, "p1SpriteSheet.png", 4, 1, 2);
  p1Sprite.setFrameSequence(0, 4, 7);
  p2Sprite = new Sprite(this, "p2SpriteSheet.png", 4, 1, 2);
  p2Sprite.setFrameSequence(0, 4, 7);


  // Sons
  minim = new Minim(this);
  turboSound = minim.loadFile("turbo.mp3");
  winSound = minim.loadFile("winSound.mp3");


  // Jogadores
  player1 = new Starship(width/2 - 100, height + 30, p1Sprite, turboSound);
  player2 = new Starship(width/2 + 100, height + 30, p2Sprite, turboSound);

  // Estrelas e letrinhas
  estrelas= new Estrelas(50);
  letrinhas = new Letrinhas(0);
}




void draw() {
  backgroundSprite.setXY(width/2, height/2);
  backgroundSprite.draw();
  fill(255, 255, 255);
  estrelas.animar();
  letrinhas.animar();

  switch(mode) {
  case START:
    startScreen(); 
    break;

  case PLAY:
    initGame();
    break;

  case END:
    endScreen();
    break;
  }

  equalKeys();
  
  // Verifica a condição de vitória
  win();
}



// Funções do jogo
//------------------------------------
void keyPressed() {

  if (key == ' ' && mode == START) {
    mode = PLAY;
  }
}

void startScreen() {
  logoSprite.setXY((width/2)-20, height/2);
  logoSprite.draw();
  startButton.setXY(width/2, (height/2)+30);
  startButton.draw();
}

void initGame() {  
  player1.run();
  player2.run();

  // Show keys
  textSize(40);
  fill(155, 205, 74);
  text(keys[1][player1.randomKey], player1.posicaox, player1.posicaoy);
  fill(255, 205, 90);
  text(keys[1][player2.randomKey], player2.posicaox, player2.posicaoy);
}

void endScreen() {
  winSound.play();
  textSize(40);

  if(winner == 1){
    fill(155, 205, 74);
  }
  else{
      fill(255, 205, 90);
  }
     
     text("O jogador " + winner + " venceu!", width/2, height/2);
}


void equalKeys() {
  if (player1.randomKey == player2.randomKey) {
    player1.randomize();
    player2.randomize();
  }
}


// Verifica a condição de vitória
void win() {

  if (player1.y < 0) {
    mode = END;
    winner = 1;
  }

  if (player2.y < 0) {
    mode = END;
    winner = 2;
  }
}
