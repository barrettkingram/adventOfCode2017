Dir["./lib/*.rb"].each { |f| require f }
print "Day #{ARGV[0]}, Part #{ARGV[1]}: "
eval "Day#{ARGV[0]}.run_part#{ARGV[1]} '#{ARGV[2]}'"
