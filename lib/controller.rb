require_relative 'gossip'
require_relative 'view'

class Controller
	def initialize
		@view = View.new
	end

	def create_gossip
		params = @view.create_gossip
		my_gossip = Gossip.new(params[:author], params[:content]) 
		my_gossip.save
	end

	def index_gossips
		gossips_array = Gossip.all
		@view.index_gossips(gossips_array) 
	end

	def destroy_gossip
		gossips_array = Gossip.all
		gossip_index = @view.destroy_gossip(gossips_array)
		Gossip.destroy_gossip(gossip_index)
	end

end
