require 'csv'
output_file = File.new(Time.now.strftime("%m-%d-%Y_%H-%M-%S")+".xml", "w+")
print "CSV file to read: "
input_file = gets.chomp
csv = CSV::parse(File.open(input_file) {|f| f.read} )
fields = csv.shift
puts "Writing XML..."
File.open(output_file, 'w') do |f|
  f.puts '<?xml version="1.0"?>'
  f.puts '<root xmlns:orders="http://foo.com/bar"><File>'
  csv.each do |record|
    f.puts " <Order>"
    for i in 0..(fields.length - 1)
      f.puts "  <#{fields[i]}>#{record[i]}</#{fields[i]}>"
    end
    f.puts" </Order>"
  end
  f.puts "</File></root>"
end
puts "Contents of #{input_file} written as XML to #{output_file}."
