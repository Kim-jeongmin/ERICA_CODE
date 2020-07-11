class Main {
  
  public static void main(String[] args) {
    // 도시 인구, 도시의 인구 증가율 (%), 도시 이름
    City aCity = new City(500000, 1.5, "Ansan");
    int newPopulation;
    int years = 10;
    newPopulation = aCity.computeFuturePopulation(years);
    System.out.println(newPopulation);
  }
  
}