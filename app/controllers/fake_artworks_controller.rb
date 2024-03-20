# app/controllers/fake_artworks_controller.rb
class FakeArtworksController < ApplicationController
    def index
      @fake_artworks = FakeArtwork.all
    end
  end
  