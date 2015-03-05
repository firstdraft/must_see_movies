require 'test_helper'

class ActorsControllerTest < ActionController::TestCase
  setup do
    @brando = actors(:two)
  end
  
  test "show should render roles by character name" do
    get :show, id: @brando
    @brando.roles.each do |role|
      assert_select 'li', /#{Regexp.quote(role.character_name)}/
    end
  end
end