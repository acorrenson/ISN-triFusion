int[] t = {0, 5, 6, 8, 7, 4};

void triFusion(int[] list) {
  
  if(list.length == 1) {
    return;
  }
  
  int l = list.length;
  int n = (int) l/2;
  
  println("l", l);
  println("n", l-n);
  
  int[] listG = new int[n];
  int[] listD = new int[l - n];

  for (int i = 0; i < n; i++) {
    listG[i] = list[i];
    println("G", listG[i]);
  }
  
  int y = 0;
  for (int i = n; i < list.length; i++) {
    listD[y] = list[i];
    println("D", listD[y]);
    y++;
  }
  
  triFusion(listG);
  triFusion(listD);
  
  int[] nlG = new int[listG.length];
  int[] nlD = new int[listD.length];
  
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