require 'spec_helper'

describe CommentsController do

  before :each do
    category = FactoryGirl.create(:category)
    category.pictures.create(title: 'Image new', image: File.open(Rails.root.join('spec/factories/image/img.gif')))
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

    it 'assigns comments to @comments' do
      get :index
      assigns(:comments).blank?.should be false
      assigns(:comments).include?(Comment.last).should be true
    end

  end

  context 'before_filter :authenticate_user!' do
    it 'Not authenticate user (302)' do
      post :create, comment: {description: 'Hello !!!', picture_id: @picture.id}
      assert_response 302
    end
  end

  context 'POST #create' do

    it 'Should be created' do
      sign_in @user
      Comment.count.should be 1
      post :create, comment: {description: 'Hello !!!', picture_id: @picture.id}
      assert_response :success
      Comment.count.should be 2
    end

    it 'Should not created' do
      sign_in @user
      Comment.count.should be 1
      post :create, comment: {description: '0', picture_id: @picture.id}
      assert_response :success
      Comment.count.should be 1
    end

  end

end