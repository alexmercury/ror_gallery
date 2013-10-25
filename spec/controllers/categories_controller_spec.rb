require 'spec_helper'

describe CategoriesController do

  before :each do
    10.times do
      category = FactoryGirl.build(:category)
      Globalize.with_locale(:ru) do
        category.title_locale = 'Model_attribute ru'
      end
      Globalize.with_locale(:en) do
        category.title_locale = 'Model_attribute en'
      end
      category.save
    end
  end

  context 'GET #index' do

    it 'render #index' do
      get :index
      assert_template :index
      assert_template layout: 'layouts/application'
      assert_response :success
    end

    it 'assigns categories to @categories' do
      get :index
      assigns(:categories).blank?.should be false
      assigns(:categories).include?(Category.last).should be true
    end

    it '@categories translations (ru, en)' do
      get :index
      assigns(:categories).first.title_locale(:ru).include?('ru').should be true
      assigns(:categories).first.title_locale(:en).include?('en').should be true
    end

  end

  context 'GET #show' do

    it 'render #show' do
      get :show, id: Category.last.slug
      assert_template :show
      assert_template layout: 'layouts/application'
      assert_response :success
    end

    it 'assigns category to @category' do
      get :show, id: Category.last.slug
      assigns(:category).blank?.should be false
      assigns(:category).should.equal? Category.last
    end

    it 'assigns pictures to @pictures' do
      puts 'Load image to DROPBOX'
      Category.last.pictures.create(title: 'Image new', image: File.open(Rails.root.join('spec/factories/image/img.gif')))
      puts 'DONE'
      get :show, id: Category.last.slug
      assigns(:pictures).blank?.should be false
      assigns(:pictures).include?(Picture.last).should be true
      Picture.destroy_all
    end

  end

  context 'before_filter :authenticate_user!' do
    it 'Not authenticate user (302)' do
      post :subscribe, category_id: Category.first.id
      assert_response 302
      post :unsubscribe, category_id: Category.first.id
      assert_response 302
    end
  end

  context 'POST #subscribe & #unsubscribe' do
    it 'subscribe & unsubscribe action' do
      user = FactoryGirl.create(:user)
      sign_in user
      post :subscribe, category_id: Category.first.id
      assert_response :success
      CategorySubscription.count.should be 1

      post :unsubscribe, category_id: Category.first.id
      assert_response :success
      CategorySubscription.count.should be 0
    end

    it 'NOT subscribe & unsubscribe action' do
      user = FactoryGirl.create(:user)
      sign_in user
      post :subscribe
      CategorySubscription.count.should be 0

      post :unsubscribe, category_id: 0
      CategorySubscription.count.should be 0
    end

  end

end