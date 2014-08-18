# ESRI

[![Build Status](https://travis-ci.org/korczis/esri.svg?branch=master)](https://travis-ci.org/korczis/esri)
[![Code Climate](https://codeclimate.com/github/korczis/esri/badges/gpa.svg)](https://codeclimate.com/github/korczis/esri)
[![Coverage Status](https://coveralls.io/repos/korczis/esri/badge.png)](https://coveralls.io/r/korczis/esri)

Parser and Processor of [USA ESRI Data](http://www.baruch.cuny.edu/geoportal/data/esri/esri_usa.htm)

## Prerequisites

- [PostgreSQL](http://www.postgresql.org/) server with [PostGIS](http://postgis.net/install/) Extensions enabled
  - database: datathon
  - username: datathon
  - password: datathon
  - permissons: can create table
- [Ruby](https://www.ruby-lang.org/en/) -  dynamic, open source programming language with a focus on simplicity and productivity. 
- [RVM](http://rvm.io/) - RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems.
- [RubyGems](https://rubygems.org/pages/download) - RubyGems is a package manager for the Ruby.
- [Bundler](http://bundler.io/) - Bundler provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed. 
- [Git](http://git-scm.com/downloads) - Git is a distributed version control system /
- [aria2](http://aria2.sourceforge.net/) - is a lightweight multi-protocol & multi-source command-line download utility. 

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

Extracting /Users/tomaskorcak/dev/esri/tmp/zip_poly/zip_poly.dbf, 18792521 Bytes
Extracting /Users/tomaskorcak/dev/esri/tmp/zip_poly/zip_poly.prj, 145 Bytes
Extracting /Users/tomaskorcak/dev/esri/tmp/zip_poly/zip_poly.sbn, 281356 Bytes
Extracting /Users/tomaskorcak/dev/esri/tmp/zip_poly/zip_poly.sbx, 6348 Bytes
Extracting /Users/tomaskorcak/dev/esri/tmp/zip_poly/zip_poly.shp, 629900316 Bytes
Extracting /Users/tomaskorcak/dev/esri/tmp/zip_poly/zip_poly.shp.xml, 176518 Bytes
Extracting /Users/tomaskorcak/dev/esri/tmp/zip_poly/zip_poly.shx, 242956 Bytes
```

Import to Database

```
bundle exec ./bin/esri database import
```

Lookup

```
bundle exec ./bin/esri.rb lookup zip "-122.4246 37.80145"
  zip
-------
 94109
(1 row)
```
