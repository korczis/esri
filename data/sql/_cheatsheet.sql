-- Create index
-- CREATE INDEX gis_geom ON tmp USING gist(geom);

-- Lookup
-- SELECT po_name FROM tmp WHERE st_contains(geom, ST_GeomFromText('POINT(-122.4246 37.80145)', 4326))

-- Find wrong geoms
-- select *, ST_IsValidReason(geom) from tmp where ST_IsValid(geom) = false

-- ALTER TABLE my_table ALTER COLUMN geom  SET DATA TYPE geometry(MultiPolygon) USING ST_Multi(geom);

-- Fix wrong geoms
-- UPDATE tmp SET geom = ST_SimplifyPreserveTopology(geom, 0.0001) WHERE ST_IsValid(geom) = false;

-- SELECT zip FROM tmp WHERE st_contains(geom, ST_GeomFromText('POINT(-122.4246 37.80145)'));