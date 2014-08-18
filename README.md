# ESRI

Parser and Processor of http://www.baruch.cuny.edu/geoportal/data/esri/esri_usa.htm

## Prerequisites

- PostgreSQL server with PostGIS Extensions Enabled
- Ruby / Gems / Bundler

## Getting Started

Intall required gems

```
bundle

Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

Display info about datasets

```
bundle exec ./bin/esri dataset info

{
  "name": "Blockgroups",
  "features": "polygons",
  "type": "shapefile",
  "year": "2012",
  "link": "usa/census/blkgrp.zip",
  "link_title": "blkgrp.zip",
  "url": "http://www.baruch.cuny.edu/geoportal/data/esri/usa/census/blkgrp.zip"
}
```

Download links

```
bundle exec ./bin/esri dataset links

http://www.baruch.cuny.edu/geoportal/data/esri/usa/trans/airports.zip
http://www.baruch.cuny.edu/geoportal/data/esri/usa/trans/highways.zip
http://www.baruch.cuny.edu/geoportal/data/esri/usa/trans/intrstat.zip
http://www.baruch.cuny.edu/geoportal/data/esri/usa/trans/mjr_hwys.zip
http://www.baruch.cuny.edu/geoportal/data/esri/usa/trans/rail100k.zip
```

Download datasets

```
bundle exec ./bin/esri dataset download
```

Unpack datasets

```
bundle exec ./bin/esri dataset unpack
```