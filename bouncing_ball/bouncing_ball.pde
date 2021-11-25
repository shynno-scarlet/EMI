final int w = 1600;
final int h = 900;

float xPos = w / 2;
float yPos = 20;

final float a = .981; // Standard Acceleration / 10
float v = 0; // Velocity
final float vLoss = .15; // Geschwindigkeitsverlust beim Aufprall

float xDir = 5; // X Bewegungsfaktor
int r = floor(random(128))+128, g = floor(random(128))+128, b = floor(random(128))+128; // Fill Farben

float[] last2Diff  = {1,2};

void setup() {
  size(1600, 900);
  frameRate(60); 
}

float roundDigits(float val, int digits){
  return round(val * pow (10, digits)) / pow(10, digits);
}

void draw(){  
  float diff = roundDigits(abs(h - yPos), 5);
  
  if(diff != last2Diff[0] && diff != last2Diff[1]){
    last2Diff[1] = last2Diff[0];
    last2Diff[0] = diff;
    
    v += a;
    yPos += v;
    xPos += xDir;
    
    println(h - yPos); //<>//
    
    if(yPos > h)
    {
      yPos = h;
      v = -v * (1 - vLoss);
      
      r = floor(random(128))+128;
      g = floor(random(128))+128;
      b = floor(random(128))+128;
    }
    
    if(xPos > w || xPos < 0) xDir = -xDir;
      
    background(42,45,49);
    fill(r,g,b);
    circle(xPos,yPos,25);
  }
}
