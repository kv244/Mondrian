class DS{
  private LinkedList ds;
  private int maxSize, currSize;
  
  public DS(int iSize){ 
    this.maxSize = iSize;
    this.ds = new LinkedList();
    this.currSize = 0;
  }
  
  // there has to be a better way to see if full
  public void addNewest(rectData rect){
    ds.add(rect);
    if(currSize <= maxSize)currSize++;
  }
  
  public boolean reachMaxSize(){
    if(currSize >= maxSize) return true;
    return false;
  }
   
  public rectData removeOldest(){
    //println(currSize);
    return (rectData)ds.remove();
  } 
}