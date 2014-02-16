APP_DIR=File.expand_path(File.dirname(__FILE__))
ENV["APP_DIR"]=APP_DIR

ENV["RACK_ENV"]="production"

# add our root and lib dirs to the load path
$:.unshift APP_DIR
$:.unshift "#{APP_DIR}/lib/"
#$:.unshift "#{APP_DIR}/lib/models/"
#$:.unshift "#{APP_DIR}/lib/helpers/"

require "app"

run GrowlerMenuApplication
