require 'rails_helper'

RSpec.describe SitesController, type: :controller do
  describe '#home' do
    it 'renders the home template' do
      get(:home)
      expect(response).to render_template('home')
    end
  end
end
