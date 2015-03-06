require 'rails_helper'

# TODO: rename file
describe 'Actors', type: :feature do
  fixtures :actors

  let(:brando) { actors(:two) }

  describe 'show' do
    before do
      visit actor_url(brando)
    end

    it "should render roles by character name", weight: 1 do
      brando.roles.each do |role|
        expect(page).to have_content role.character_name
      end
    end

    it "should render movies by title", weight: 1 do
      brando.movies.each do |movie|
        expect(page).to have_content movie.title
      end
    end
  end
end