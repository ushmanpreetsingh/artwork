# app/controllers/artworks_controller.rb
class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.includes(:artist, :collection).all
  end
  
  def show
    @artwork = Artwork.find(params[:id])
    @artist = @artwork.artist
    @collection = @artwork.collection
  end
      def collection_navigation
        @artworks = Artwork.all
        @artwork = Artwork.find(params[:id])
      end 
        def collection_navigation
          @artworks = Artwork.all
        end
       
        def index
          if params[:search]
            @artworks = Artwork.where("title LIKE ?", "%#{params[:search]}%")
          else
            @artworks = Artwork.all
          end
        end
         
       
      
           
end
