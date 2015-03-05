require 'test_helper'

class DirectorsControllerTest < ActionController::TestCase
  setup do
    @coppola = directors(:two)
  end

  test "show should render movie names for director" do
    get :show, id: @coppola
    @coppola.movies.each do |movie|
      assert_select 'li', movie.title
    end
  end
end