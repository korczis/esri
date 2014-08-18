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

8060e7|OK  |   0.9MiB/s|/Users/tomaskorcak/dev/esri/tmp/dtl_wat.zip
dc1d92|OK  |   322KiB/s|/Users/tomaskorcak/dev/esri/tmp/rail100k.zip
3bd75a|OK  |   695KiB/s|/Users/tomaskorcak/dev/esri/tmp/mjr_hwys.zip
9d3ff8|OK  |   0.9MiB/s|/Users/tomaskorcak/dev/esri/tmp/highways.zip
ab66ab|OK  |   1.7MiB/s|/Users/tomaskorcak/dev/esri/tmp/dtl_riv.zip

Status Legend:
(OK):download completed.
```

Unpack datasets

```
bundle exec ./bin/esri dataset unpack
```