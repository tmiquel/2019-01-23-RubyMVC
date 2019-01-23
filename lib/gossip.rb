
class Gossip
attr_reader :author, :content

	def initialize(author, content)
		 @content = content
		 @author = author
	end

	def save
	    f = File.open(Dir.getwd + '/db/gossip.csv', 'a+')
	    f.write([@author, @content].join(','),"\n")
	    f.close
	end

	def self.all
		all_gossips_array = []
		CSV.foreach(Dir.getwd + '/db/gossip.csv') do |gossip_array|
			gossip = Gossip.new(gossip_array[0], gossip_array[1])
			all_gossips_array << gossip
		end
		all_gossips_array
	end

	def self.destroy_gossip(index_integer)
		array_of_gossips_arrays = 
		CSV.read(Dir.getwd + '/db/gossip.csv')

		array_of_gossips_arrays.delete_at(index_integer)

		f = File.open(Dir.getwd + '/db/gossip.csv', 'w+')
	    f.write(array_of_gossips_arrays.
	    	map { |gossip_array| gossip_array.join(',') }.
	    	 join("\n"))
	    f.close

	end

end
