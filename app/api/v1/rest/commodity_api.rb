

module V1
    module REST
        class CommodityApi < Grape::API
          resource :commodities do 

            desc 'Get commodity list'
            get do
              commodities = Commodity.all
              present commodities, with: Entities::Commodity
            end

            desc 'Get a commodity'
            params do
              requires :id
            end
            get ':id' do
              present Commodity.find(params[:id]), with: Entities::Commodity
            end

            desc 'Create a new commodity'
            params do
              requires :title, type: String, desc: "title"
              requires :price, type: Float, desc: "price"
              requires :cover, type: String, desc: "cover"
              optional :summary, type: String, desc: "summary"
            end
            post do
              commodity = Commodity.create!({
                title: params[:title],
                price: params[:price],
                cover: params[:cover],
                summary: params[:summary]
              })
              present commodity, with: Entities::Commodity
            end


            desc 'Update an existing commodity'
            params do
              requires :id, type: String, desc: "id"
              optional :title, type: String, desc: "title"
              optional :price, type: Float, desc: "price"
              optional :cover, type: String, desc: "cover"
              optional :summary, type: String, desc: "summary"
            end
            put ':id' do
              commodity = Commodity.find params[:id]
              commodity.update({
                title: (params[:title]).blank? ? commodity.title : params[:title],
                price: (params[:price].blank?) ? commodity.price : params[:price],
                cover: (params[:cover].blank?) ? commodity.cover : params[:cover],
                summary: (params[:summary].blank?) ? commodity.summary : params[:summary]
              })
              present commodity, with: Entities::Commodity
            end

            desc 'Destroy a commodity'
            params do
              requires :id, type: String, desc: 'Commodity id'
            end
            delete ':id' do
              commodity = Commodity.find(params[:id])
              commodity.destroy
              present '0'
            end

          end 
        end
    end
end
