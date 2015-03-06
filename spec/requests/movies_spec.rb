require 'rails_helper'

describe 'Movies', type: :feature do
  fixtures :movies

  let(:shawshank) { movies(:one) }
  let(:godfather) { movies(:two) }

  describe 'index' do
    before do
      visit movies_url
    end

    it "should render all director names", weight: 1 do
      Movie.all.each do |movie|
        expect(page).to have_content movie.director.name
      end
    end
  end

  describe 'show' do
    before do
      visit movie_url(godfather)
    end

    it "should render director name", weight: 1 do
      expect(page).to have_content godfather.director.name
    end

    it "should render roles by character name", weight: 1 do
      godfather.roles.each do |role|
        expect(page).to have_content role.character_name
      end
    end

    it "should render cast actors by name", weight: 1 do
      godfather.actors.each do |actor|
        expect(page).to have_content actor.name
      end
    end
  end

  describe 'new' do
    before do
      visit new_movie_url
    end

    it "should render form with select for directors", weight: 1 do
      Director.all.each do |director|
        expect(page).to have_content director.name
        expect(page).to have_css "option[value='#{director.id}']"
      end
    end
  end

  describe 'edit' do
    before do
      visit edit_movie_url(godfather)
    end

    it "should render form with select for directors", weight: 1 do
      Director.all.each do |director|
        expect(page).to have_content director.name
        expect(page).to have_css "option[value='#{director.id}']"
      end
    end
  end
end