module Api
  module Internal
    module V1
      class PopupSubmitsController < ApplicationController

        def index
          popup_submits = PopupSubmit.where(shop_id: current_shop.id)
          paginate popup_submits, per_page: PopupSubmit::PER_PAGE
        end


        def destroy
          popup_submit = current_shop.popup_submits.find_by(id: params[:id])

          if popup_submit.nil?
            render json: { errors: 'You cannot delete this' }, status: 422
            return
          end

          popup_submit.destroy
          head :ok
        end
      end
    end
  end
end

