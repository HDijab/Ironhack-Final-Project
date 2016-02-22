require 'rails_helper'

RSpec.describe SitesController, type: :controller do
  describe '#home' do
    it 'renders the home template' do
      get(:home)
      expect(response).to render_template('home')
    end
  end

  describe '#easy_walk' do
    it 'renders the easy_walk template' do
      get(:easy_walk)
      expect(response).to render_template('easy_walk')
    end
  end
end
