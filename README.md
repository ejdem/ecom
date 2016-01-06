simple ecommerce application, in rails, with cancancan and devise

command to change all .html.erb to .html.haml
$ find . -name '*erb' | \
      xargs ruby -e 'ARGV.each { |i| puts "html2haml -r #{i} #{i.sub(/erb$/,"haml")}"}' | \
      bash

command to remove all .html.erb files      
find ./app/views -name "*.html.erb" -print0 | xargs -0 rm