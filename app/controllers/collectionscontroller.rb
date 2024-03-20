# app/controllers/collections_controller.rb
class CollectionsController < ApplicationController
    def index
      @collections = Collection.all
    end
  end
  