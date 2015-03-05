require 'test_helper'

class RolesControllerTest < ActionController::TestCase
  setup do
    @andy = roles(:one)
    @don = roles(:two)
  end

  test "index should render all movie names" do
    get :index
    Role.all.each do |role|
      assert_select 'dd', { text: regex_string(role.movie.title) }
    end
  end

  test "index should render all actor names" do
    get :index
    Role.all.each do |role|
      assert_select 'dd', { text: regex_string(role.actor.name) }
    end
  end

  test "show should render movie name" do
    get :show, id: @andy
    assert_select 'dd', { text: regex_string(@andy.movie.title) }
  end

  test "show should render actor name" do
    get :show, id: @andy
    assert_select 'dd', { text: regex_string(@andy.actor.name) }
  end

  test "new should render form with select for movies" do
    get :new
    Movie.all.each do |movie|
      assert_select 'option', { text: regex_string(movie.title) }
      assert_select "[value='#{movie.id}']"
    end
  end

  test "new should render form with select for actors" do
    get :new
    Actor.all.each do |actor|
      assert_select 'option', { text: regex_string(actor.name) }
      assert_select "[value='#{actor.id}']"
    end
  end

  test "edit should render form with select for movies" do
    get :edit, id: @andy
    Movie.all.each do |movie|
      assert_select 'option', { text: regex_string(movie.title) }
      assert_select "[value='#{movie.id}']"
    end
  end

  test "edit should render form with select for actors" do
    get :edit, id: @andy
    Actor.all.each do |actor|
      assert_select 'option', { text: regex_string(actor.name) }
      assert_select "[value='#{actor.id}']"
    end
  end
end