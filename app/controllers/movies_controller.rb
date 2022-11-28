class MoviesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end

  # summary action using the new serializer to render the requested information
  def summary
    movie = Movie.find(params[:id])
    render json: movie, serializer: MovieSummarySerializer
  end

  # summaries action
  def summaries
    movies = Movie.all
    render json: movies, each_serializer: MovieSummarySerializer
  end

  private

  def render_not_found_response
    render json: { error: "Movie not found" }, status: :not_found
  end
end


# each_serializer: MovieSummarySerializer in the summaries action allows the use of cutom created movie summary serializer to render each of the movies in the collection