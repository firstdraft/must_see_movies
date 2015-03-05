require 'test_helper'

class ActorsControllerTest < ActionController::TestCase
  setup do
    @brando = actors(:two)
  end
  
  test "show should render roles by character name" do
    get :show, id: @brando
    @brando.roles.each do |role|
      assert_select 'li', {text: regex_string(role.character_name) }
    end
  end

  test "show should render movies by title" do
    get :show, id: @brando
    @brando.movies.each do |movie|
      assert_select 'li', { text: regex_string(movie.title) }
    end
  end
end