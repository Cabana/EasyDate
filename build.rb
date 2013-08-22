require 'closure-compiler'
require 'coffee-script'

compiler = Closure::Compiler.new(compilation_level: 'SIMPLE_OPTIMIZATIONS')

files = [
  'vendor/split.js',
  'lib/easy_date.coffee'
]

js = files.inject '' do |result, js_component|
  result += if js_component =~ /.*\.coffee$/
              CoffeeScript.compile File.read(js_component)
            else
              File.read(js_component)
            end
end

contents = compiler.compile js

File.open 'build/easy_date.js', "w" do |file|
  file.write contents
end
