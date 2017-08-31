#!/usr/bin/ruby

# generate_useradd.rb
# CIT 483/583-001 Fall 2016
# One of many possible solutions

# data given with assignment
users = {'smithj1' => 'John Smith', 'doej1' => "Jane Doe", 'publicj1' => "John Q. Public", 'mccordt' => 'Tim McCord'}
words = ['care', 'Less', 'toys', 'Game', 'rand', 'Ruby', 'star', 'Lite']
seps = ['-', '%', '&', '@', '#', '!']

# create the array of possible characters one time to save heap space
alphabet = [*"A".."Z", *"a".."z"]

# iterate over the user hash
# I mentioned that it was OK if you generated the salt in the loop even
# though the assignment said to do it outside the loop.  
users.each_key do |user|
  # p "Debug: #{user}"
  salt = '$6$' + alphabet.sample(16).join
  # p "Debug: #{salt}"
  plain = words.sample + seps.sample + words.sample
  # p "Debug: #{plain}"
  puts "Commmand:"
  puts "useradd -m -c \"#{users[user]}\" -p '#{plain.crypt(salt)}' #{user}"
end
# Other ways to generate the salt
# salt = "$5$" + (1..16).to_a.map() do
#   [("a".."z").to_a, ("A".."Z").to_a].flatten.sample
# end.join
# 
# salt = '$5$'+((('A'..'Z').to_a + ('a'..'z').to_a).shuffle[0,16].join)

