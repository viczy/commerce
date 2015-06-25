

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

            # desc 'Create a new commodity'
            # params do
            #   requires :all, except: [:id], using: Entities::Commodity.documentation.except(:id)
            # end
            # post do
            #   commodity = Commodity.create! params
            #   present commodity, with: Entities::Commodity
            # end


            # desc 'Update an existing commodity'
            # params do
            #   requires :id, type: String, desc: 'Commodity id'
            #   group :commodity do
            #     optional :price, type: Float, desc: 'Commodity price'
            #     optional :summary, type: String,  desc: 'Commodiy des'
            #   end
            # end
            # put ':id' do
            #   commodity = Commodity.find params[:id]
            #   commodity.update_attributes parameters.require(:member).permit(:price, :summary)
            #   present commodity, with: Entities::Commodity
            # end

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
