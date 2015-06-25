
module V1
  	class Root < Grape::API
  		prefix 'api'
  		format :json
  		format :json
		version 'v1', using: :path

		mount REST::CommodityApi
		add_swagger_documentation api_version: 'v1', mount_path: '/doc', format: :json
	end 
end
