require 'spec_helper'

describe PicturesController do

  before :each do
    @category = FactoryGirl.create(:category)
    @category.pictures.create(title: 'image_new', image: File.open(Rails.root.join('spec/factories/image/img.gif')))
  end

  after :each do
    Picture.destroy_all
  end

  context 'GET #index' do

    it 'render #index' do
      get :index
      assert_template :index
      assert_template layout: 'layouts/application'
      assert_response :success
    end

    it 'assigns pictures to @pictures' do
      get :index
      assigns(:pictures).blank?.should be false
      assigns(:pictures).include?(Picture.last).should be true
    end

  end

  context 'GET #home' do

    it 'render #home' do
      get :home
      assert_template :home
      assert_template layout: 'layouts/application'
      assert_response :success
    end

    it 'assigns pictures to @pictures' do
      get :home
      assigns(:pictures).blank?.should be false
      assigns(:pictures).include?(Picture.last).should be true
    end

  end

  context 'GET #show' do

    it 'render #show' do
      get :show, id: Picture.last.id, title: @category.title
      assert_template :show
      assert_template layout: 'layouts/application'
      assert_response :success
    end

    it 'assigns picture to @picture' do
      get :show, id: Picture.last.id, title: @category.title
      assigns(:picture).blank?.should be false
      assigns(:picture).should.equal? Picture.last
    end

  end

end