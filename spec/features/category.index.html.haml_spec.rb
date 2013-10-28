require 'spec_helper'

describe 'Category index html', js: true do

  before :each do
    2.times do
      category = FactoryGirl.build(:category)
      Globalize.with_locale(:ru) do
        category.title_locale = 'Model_attribute ru'
      end
      Globalize.with_locale(:en) do
        category.title_locale = 'Model_attribute en'
      end
      category.save
      category.pictures.create(title: 'Image new', image: File.open(Rails.root.join('spec/factories/image/img.gif')))
    end
  end

  after :each do
    Picture.destroy_all
  end

  it 'index en' do
    visit categories_path
    expect(page).to have_content 'Pictures on categories Ror Gallery site'
    expect(page).to have_content 'Model_attribute en'
  end

  it 'index ru' do
    visit categories_path(locale: :ru)
    expect(page).to have_content 'Категории картинок сайта Ror Gallery'
    expect(page).to have_content 'Model_attribute ru'
  end

end