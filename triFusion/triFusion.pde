int[] t = {0, 5, 6, 8, 7, 4};

void triFusion(int[] list) {
  
  // condition to stop recursion
  if(list.length == 1) {
    return;
  }
  
  int l = list.length;
  int n = (int) l/2;
  
  // println("l", l);
  // println("n", l-n);
  
  // define two list (left and right)
  int[] listG = new int[n];
  int[] listD = new int[l - n];
  
  // fill each list
  for (int i = 0; i < n; i++) {
    listG[i] = list[i];
  }
  
  int y = 0;
  for (int i = n; i < list.length; i++) {
    listD[y] = list[i];
    y++;
  }
  
  // recursion
  triFusion(listG);
  triFusion(listD);
  
  // merge and sort both list
  int iG = 0;
  int iD = 0;
  
  for( int i = 0; i < l; i++) {
    if(iG > listG.length - 1) {
      list[i] = listD[iD];
      iD += 1;
    } else if(iD > listD.length - 1) {
      list[i] = listG[iG];
      iG += 1;
    } else if(listG[iG] < listD[iD]) {
      list[i] = listG[iG];
      iG += 1;
    } else {
      list[i] = listD[iD];
      iD += 1;
    }
  }
  
}

void setup() {
  triFusion(t);
  println(t);
}