# frozen_string_literal: true
RSpec.describe 'categories/index', type: :view do
  it "works controller 'categories'" do
    expect(controller.request.path_parameters[:controller]).to eq('categories')
    expect(controller.controller_path).to eq('categories')
  end

  it "works action 'index'" do
    expect(controller.request.path_parameters[:action]).to eq('index')
  end

  it "go to 'categories_index_path'" do
    expect(controller.request.fullpath).to eq categories_index_path
  end
end
