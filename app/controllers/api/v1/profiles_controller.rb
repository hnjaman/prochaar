module Api
  module V1
    class ProfilesController < ApplicationController
      before_action :set_profile

      def show
        render json: @profile
      end

      def update
        if @profile.update(profile_params)
          render json: @profile
        else
          render json: @profile.errors, status: :unprocessable_entity
        end
      end

      private

      def profile_params
        params.permit(:first_name, :last_name, :gender, :photo,
                                        :date_of_birth, :full_address, :contact_number,
                                        :district, :division, :street_address, :zip_code,
                                        :latitude, :longitude)
      end

      def set_profile
        @profile = Profile.find(params[:id])
      end

    end
  end
end