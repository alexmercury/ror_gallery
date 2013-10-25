require 'spec_helper'

describe PicturesController do

  before :each do
    @category = FactoryGirl.create(:category)
    @category.pictures.create(title: 'image_new', image: File.open(Rails.root.join('spec/factories/image/img.gif')))
    @picture = Picture.first
    @user = FactoryGirl.create(:user)
    @user.comments.create(description: 'Hello !!!', picture_id: @picture.id, user_id: @user.id)
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
      get :show, id: Picture.last.id, slug: @category.slug
      assert_template :show
      assert_template layout: 'layouts/application'
      assert_response :success
    end

    it 'assigns picture to @picture' do
      get :show, id: Picture.last.id, slug: @category.slug
      assigns(:picture).blank?.should be false
      assigns(:picture).should.equal? Picture.last
    end

  end

  context 'POST #load_comments' do

    it ' load_comments' do
      post :load_comments, id: @picture.id, page: 1, format: :json
      assert_response :success
      hash = (JSON.parse(response.body.to_s))[0]
      puts hash.class
      hash['id'].to_i.should.equal? Comment.first.id
    end

  end

end