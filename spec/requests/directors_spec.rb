require 'rails_helper'

# TODO: rename file
describe 'Directors', type: :feature do
  fixtures :directors

  let(:coppola) { directors(:two) }

  describe 'show' do
    before do
      visit director_url(coppola)
    end

    it "should render movie names for director", weight: 1 do
      coppola.movies.each do |movie|
        expect(page).to have_content movie.title
      end
    end
  end
end