require 'rails_helper'

# TODO: rename file
describe 'Roles', type: :feature do
  fixtures :roles

  let(:andy) { roles(:one) }
  let(:don) { roles(:two) }

  describe 'index' do
    before do
      visit roles_url
    end

    it "should render all movie names", weight: 1 do
      Role.all.each do |role|
        expect(page).to have_content role.movie.title
      end
    end

    it "should render all actor names", weight: 1 do
      Role.all.each do |role|
        expect(page).to have_content role.actor.name
      end
    end
  end

  describe 'show' do
    before do
      visit role_url(andy)
    end

    it "should render movie name", weight: 1 do
      expect(page).to have_content andy.movie.title
    end

    it "should render actor name", weight: 1 do
      expect(page).to have_content andy.actor.name
    end
  end

  describe 'new' do
    before do
      visit new_role_url
    end

    it "should render form with select for movies", weight: 1 do
      Movie.all.each do |movie|
        expect(page).to have_content movie.title
        expect(page).to have_css "option[value='#{movie.id}']"
      end
    end

    it "should render form with select for actors", weight: 1 do
      Actor.all.each do |actor|
        expect(page).to have_content actor.name
        expect(page).to have_css "option[value='#{actor.id}']"
      end
    end
  end

  describe 'edit' do
    before do
      visit edit_role_url(andy)
    end

    it "should render form with select for movies", weight: 1 do
      Movie.all.each do |movie|
        expect(page).to have_content movie.title
        expect(page).to have_css "option[value='#{movie.id}']"
      end
    end

    it "should render form with select for actors", weight: 1 do
      Actor.all.each do |actor|
        expect(page).to have_content actor.name
        expect(page).to have_css "option[value='#{actor.id}']"
      end
    end
  end
end