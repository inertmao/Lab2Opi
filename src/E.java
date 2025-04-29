class E extends B {
  public E() {
    p36 = 9;
    p39 = 0;
    p14 = 7L;
  }
  public void p28() {
    System.out.println("метод p28 в классе E");
    System.out.println(p11 << 2);
  }
  public void p5() {
    System.out.println("метод p5 в классе E");
    System.out.println(p6 + 4);
  }
  public static void p34() {
    System.out.println("метод p34 в классе E");
    System.out.println(p27);
  }
  public static void p7() {
    System.out.println("метод p7 в классе E");
    System.out.println((p27 + 2));
  }
  public static void p30() {
    System.out.println("метод p30 в классе E");
    System.out.println(p27--);
  }
  public static void p17() {
    System.out.println("метод p17 в классе E");
    System.out.println(p13);
  }
  public void p29(B r) {
    r.p28();
  }
  public void p29(E r) {
    r.p23();
  }
}
