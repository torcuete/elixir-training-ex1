defmodule Ex1.MovieController do
  use Ex1.Web, :controller

  alias Ex1.Movies

  def index(conn, _params) do
    movieList = Movies.all
    render conn, "index.html", movieList: movieList
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"movie" => movie}) do
    Movies.insert(movie)
    redirect conn, to: movie_path(conn, :index)
  end
end
