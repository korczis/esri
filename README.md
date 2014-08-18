# ESRI

Parser and Processor of http://www.baruch.cuny.edu/geoportal/data/esri/esri_usa.htm

## Prerequisites

- PostgreSQL server with PostGIS Extensions Enabled
- Ruby / Gems / Bundler

## Getting Started

Intall required gems

```
bundle
```

Download links

```
bundle exec ./bin/esri dataset links
```

Download datasets

```
bundle exec ./bin/esri dataset download
```

Unpack datasets

```
bundle exec ./bin/esri dataset unpack
```