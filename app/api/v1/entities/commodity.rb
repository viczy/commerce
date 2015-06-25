
module V1
	module Entities
		class Commodity < Grape::Entity
			expose :id, documentation: { type: 'integer', desc: 'Commodity id' }
	      	expose :title, documentation: { type: 'string', desc: 'Commodity title' }
	      	expose :summary,  documentation: { type: 'string', des: 'Commodity summary' }
	      	expose :price, documentation: { type: 'float', desc: 'Commodity price' }
	      	expose :cover, documentation: { type: 'string', desc: 'Commodity cover' }
		end
	end
end