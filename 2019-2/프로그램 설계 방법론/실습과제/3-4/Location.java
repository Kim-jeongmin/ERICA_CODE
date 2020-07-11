public class Location {

  private double latitude;   // 위도 
  private double longitude;   // 경도 
  public Location (double lat, double lon) {
    this.latitude = lat;
    this.longitude = lon;
  }
  public double getLatitude() { 
    return this.latitude;
  }
  public double getLongitude() {
    return this.longitude; 
  }
  public double distance (Location other) {
    double RADIUS_EARTH = 6371.0;   // 지구의 반지름 
    double lat1 = this.latitude;
    double lon1 = this.longitude;
    double lat2 = other.latitude;
    double lon2 = other.longitude;
    return RADIUS_EARTH*Math.acos(Math.cos(Math.toRadians(90-lat1))*Math.cos(Math.toRadians(90-lat2))+Math.sin(Math.toRadians(90-lat1))*Math.sin(Math.toRadians(90-lat2))*Math.cos(Math.toRadians(lon1-lon2)));
  }
}