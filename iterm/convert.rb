#!/usr/bin/env ruby
require 'plist'

file = "ir_black.itermcolors"

Plist.parse_xml(file).each do |key,value|
  puts key
  r=value["Red Component"]*255
  b=value["Blue Component"]*255
  g=value["Green Component"]*255

  puts "value is ##{r.round.to_s(16)}#{g.round.to_s(16)}#{b.round.to_s(16)}\n\n"
end
