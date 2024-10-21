Dir.glob( File.join(File.dirname(__FILE__), "*") ).each do |item|
  puts item
  puts item.to_s.gsub!("/home/chandu/", "/")
end
