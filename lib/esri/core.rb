# encoding: utf-8

require 'pathname'

# ESRI module
module Esri
  BASE_DIR = File.join(File.dirname(__FILE__), '..', '..')
  DATA_DIR = File.join(BASE_DIR, 'data')
  LIB_DIR = File.join(BASE_DIR, 'lib')
  SRC_DIR = File.join(LIB_DIR, 'esri')
  TMP_DIR = File.join(BASE_DIR, 'tmp')
  LINK_FILE = File.join(TMP_DIR, 'links.txt')
end
