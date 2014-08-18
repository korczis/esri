# PostGIS 

## Reverse geo-lookup 

```
datathon=# SELECT zip FROM gis_esri_zip_poly WHERE st_contains(geom, ST_GeomFromText('POINT(-122.4246 37.80145)'));
  zip
-------
 94109
(1 row)

datathon=#
```

## Performance of Rverse geo-lookup 

```
datathon=# EXPLAIN ANALYZE SELECT zip FROM gis_esri_zip_poly WHERE st_contains(geom, ST_GeomFromText('POINT(-122.4246 37.80145)'));
                                                                  QUERY PLAN
----------------------------------------------------------------------------------------------------------------------------------------------
 Index Scan using idx_gis_esri_zip_poly_geom on gis_esri_zip_poly  (cost=0.28..8.54 rows=1 width=6) (actual time=0.146..0.194 rows=1 loops=1)
   Index Cond: (geom && '01010000006C787AA52C9B5EC08AB0E1E995E64240'::geometry)
   Filter: _st_contains(geom, '01010000006C787AA52C9B5EC08AB0E1E995E64240'::geometry)
   Rows Removed by Filter: 2
 Total runtime: 0.221 ms
(5 rows)

datathon=#
```