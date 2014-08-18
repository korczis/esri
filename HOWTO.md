# How To

## Create Geospatial index

```
CREATE INDEX idx_gis_esri_zip_poly_geom ON gis_esri_zip_poly USING gist(geom);
```
