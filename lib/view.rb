class View

	def create_gossip
		puts
		puts "*" * 60
		puts "CREATION DU GOSSIP"
		puts "*" * 60
		puts "Quel est l'auteur du Gossip?"
		print " > "
		author_string = gets.chomp
		puts "Quel est ce Gossip?"
		print " > "
		content_string = gets.chomp
		puts "OK ! C'est noté :)"
		puts
		{ content: content_string, author: author_string }
	end

	def index_gossips(gossips_array, show_index = false) 
		if !show_index #Ne s'execute pas pour l'appel par la fonction destroy_gossip
			puts
			puts "*" * 60
			puts "TOUS LES GOSSIPS"
			puts "*" * 60
			puts
		end
		index_gossip = 0 if show_index
		gossips_array.each do |gossip|
			puts "Index : #{index_gossip}" if show_index
			puts "Auteur : #{gossip.author}"
			puts "LE GOSSIP : #{gossip.content}"
			puts "-" * 60
			index_gossip += 1 if show_index
		end
		puts
	end

	def destroy_gossip(gossips_array)
		puts
		puts "*" * 60
		puts "DESTRUCTION D'UN GOSSIP"
		puts "*" * 60
		puts
		puts "Ci-dessous figure tous les potins connus actuellement. Je vais te demander d'en choisir un en indiquant son index"
		puts
		self.index_gossips(gossips_array, true)
		puts "Quel est l'index du gossip à détruire?"
		print " > "
		index_gossip = gets.chomp.to_i
		puts
		puts "OK. Le potin #{index_gossip} est détruit."
		puts
		index_gossip
	end

end
