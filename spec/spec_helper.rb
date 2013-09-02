require 'rubygems'
require 'bundler/setup'
require "pdiff"

STATIC_EXAMPLE = {
  baseline: File.expand_path("fixtures/foo.png", File.dirname(__FILE__)),
  consistent_element: File.expand_path("fixtures/foo_copy.png", File.dirname(__FILE__)),
  changed_element: File.expand_path("fixtures/bar.png", File.dirname(__FILE__)),
}