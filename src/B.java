class B {
  int p36;
  int p6;
  int p11;
  int p37;
  int p39;
  long p21;
  long p33;
  long p14;
  int[] p15 = {0, -1, -2, -1};
  int[] p16 = {0, -3, -3, 1, 1};
  int[] p10 = {-2, 0, -3, 2};
  static int p27;
  static int p13;
  static int p31;
  static int p2;
  static int p20;
  public B() {
    p36 = 9;
    p6 = 6;
    p11 = 0;
    p37 = 9;
    p39 = 9;
    p21 = 8L;
    p33 = 1L;
    p14 = 1L;
  }
  public void p1() {
    System.out.println("метод p1 в классе B");
    System.out.println(--p20);
  }
  public void p22() {
    System.out.println("метод p22 в классе B");
    System.out.println(p15[2] + p15[2]);
  }
  public void p28() {
    System.out.println("метод p28 в классе B");
    System.out.println(p16[2]);
  }
  public void p23() {
    System.out.println("метод p23 в классе B");
    System.out.println(p11 << 2);
  }
  public void p5() {
    System.out.println("метод p5 в классе B");
    System.out.println(p37);
  }
  public void p8() {
    System.out.println("метод p8 в классе B");
    System.out.println(p37 >> 2);
  }
  public static void p34() {
    System.out.println("метод p34 в классе B");
    System.out.println(p2);
  }
  public static void p7() {
    System.out.println("метод p7 в классе B");
    System.out.println((p2 + 3));
  }
  public static void p30() {
    System.out.println("метод p30 в классе B");
    System.out.println(p20);
  }
  public static void p17() {
    System.out.println("метод p17 в классе B");
    System.out.println((p20 - 5));
  }
  public void p29(B r) {
    r.p1();
  }
  public void p29(E r) {
    r.p22();
  }
}
