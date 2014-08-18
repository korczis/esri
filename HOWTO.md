# How To

## Create Geospatial index

```
CREATE INDEX idx_gis_esri_zip_poly_geom ON gis_esri_zip_poly USING gist(geom);
```

## Lookup using Geospatial index

```
SELECT * FROM gis_esri_zip_poly WHERE st_contains(geom, ST_GeomFromText('POINT(-122.4246 37.80145)', 4326))
```

## Find invalid geoms

```
SELECT *, ST_IsValidReason(geom) from gis_esri_zip_poly where ST_IsValid(geom) = false
```

## Change geom column type

```
ALTER TABLE gis_esri_zip_poly ALTER COLUMN geom SET DATA TYPE geometry(MultiPolygon) USING ST_Multi(geom);
```

## Try fix wrong geom columns

```
UPDATE gis_esri_zip_poly SET geom = ST_SimplifyPreserveTopology(geom, 0.0001) WHERE ST_IsValid(geom) = false;
```
