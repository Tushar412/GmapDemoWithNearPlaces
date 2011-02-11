class GooglemapController < ApplicationController
  def index
    @map = GMap.new("map_div")
    zipcodes=ZipCode.find_by_sql(" SELECT o.ZipCode, o.Latitude, o.Longitude, o.State,(3956 * (2 * ASIN(SQRT(POWER(SIN(((z.Latitude-o.Latitude)*0.017453293)/2),2) +COS(z.Latitude*0.017453293) *COS(o.Latitude*0.017453293) *POWER(SIN(((z.Longitude-o.Longitude)*0.017453293)/2),2))))) AS Distance
                                  FROM zip_codes z,zip_codes o,zip_codes a
                                  WHERE z.ZipCode = 03038  AND z.ZipCode = a.ZipCode AND (3956 * (2 * ASIN(SQRT(POWER(SIN(((z.Latitude-o.Latitude)*0.017453293)/2),2) + COS(z.Latitude*0.017453293) * COS(o.Latitude*0.017453293) * POWER(SIN(((z.Longitude-o.Longitude)*0.017453293)/2),2))))) <= 50 ORDER BY Distance")
    p "zipcodes"
    p zipcodes
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([zipcodes[0].Latitude,zipcodes[0].Longitude],10)
    zipcodes.each { |zip|
      @map.overlay_init(GMarker.new([zip.Latitude, zip.Longitude],:title => zip.State, :info_window => "Info! Info!"))
    }
  end
end
