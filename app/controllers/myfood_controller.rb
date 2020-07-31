# frozen_string_literal: true

class MyfoodController < ApplicationController
    def edit
        @user = User.find(params[:id])
    end
end
