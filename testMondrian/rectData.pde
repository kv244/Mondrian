class rectData{
  public int rx;
  public int ry;
  public int rHeight;
  public int rWidth;
  public color rCol;
  private RECTYPE type; 

  
  // TODO needs tweaking
  private void colorize(){
    if(random(100) > 50){
      if(random(100) > 75)
        this.rCol = color(255,0,0);
      else{
        if(random(100) > 30)
          this.rCol = color(255,255,0);
        else
          this.rCol = color(random(255), random(255), random(255));
      }
    }else{
      this.rCol = color(0,0,0);
    }
  }
  
  public void colorize(color c){
    this.rCol = c;
  }
  
  // by convention, this will make a tall rect of random width
  // parameter is maxWidth
  public rectData(int a){
    this.rx = (int)random(width);
    this.ry = 0;
    this.rWidth = (int)random(a);
    this.rHeight = height;
    colorize();
  }

  // by convention, this will make a wide rect of random height
  // parameter is maxWidth, other ignored
  public rectData(int a, int b){
    this.rx = 0;
    this.ry = (int)random(height);
    this.rWidth = width;
    this.rHeight = (int)random(a);
    colorize();
 }
  
  public void drawRect(){
    stroke(this.rCol);
    fill(this.rCol);
    rect(this.rx, this.ry, this.rWidth, this.rHeight);
  }  
  
  public void removeRect(){
    // this will be determined by the blendMode setting
    // i need to remove only the particular color of shapeX
    int currY, currX;
    color existing;
    
    for(currY = this.ry; currY <= this.ry + this.rHeight; currY++){
      for(currX = this.rx; currX <= this.rx + this.rWidth; currX++){
        existing = get(currX, currY);
        if(existing == rCol) 
          set(currX, currY, white);
      }
    }   
  }
  
  // "rough" remove of background color of shapeX
  public void removeRect(int rough){
    blendMode(SUBTRACT); // TODO try this
    //this.colorize(this.white);
    this.colorize(this.rCol);
    stroke(255,255,255);
    this.drawRect();
    stroke(0);
    blendMode(ADD);
  }
}