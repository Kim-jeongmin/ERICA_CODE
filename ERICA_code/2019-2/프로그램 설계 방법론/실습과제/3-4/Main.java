class Main {
  public static void main(String[] args) {
    Location loc1 = new Location(37.567, 126.978); 
    Location loc2 = new Location(35.179,129.076); 
    System.out.println(loc1.distance(loc2)); // 325.23184366269084 출력
  }
}