require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  setup do
    @shawshank = movies(:one)
    @godfather = movies(:two)
  end

  test "index should render all director names" do
    get :index
    Movie.all.each do |movie|
      assert_select 'dd', {text: movie.director.name}
    end
  end

  test "show should render director name" do
    get :show, id: @godfather
    assert_select 'dd', {text: @godfather.director.name}
  end

  test "show should render roles by character name" do
    get :show, id: @godfather
    @godfather.roles.each do |role|
      assert_select 'li', /#{Regexp.quote(role.character_name)}/
    end
  end

  test "new should render form with select for directors" do
    get :new
    Director.all.each do |director|
      assert_select 'option', {text: director.name}
      assert_select "[value='#{director.id}']"
    end
  end

  test "edit should render form with select for directors" do
    get :edit, id: @godfather
    Director.all.each do |director|
      assert_select 'option', {text: director.name}
      assert_select "[value='#{director.id}']"
    end
  end
end