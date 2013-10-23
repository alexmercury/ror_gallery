require 'spec_helper'

describe LikesController do

  before :each do
    category = FactoryGirl.create(:category)
    category.pictures.create(title: 'Image new', image: File.open(Rails.root.join('spec/factories/image/img.gif')))
    @picture = Picture.first
    @user = FactoryGirl.create(:user)
  end

  after :each do
    Picture.destroy_all
  end

  context 'before_filter :authenticate_user!' do
    it 'Not authenticate user (302)' do
      post :create, picture_id: @picture.id
      assert_response 302
      Like.count.should be 0
    end
  end

  context 'POST #create' do

    it 'Should be created' do
      sign_in @user
      Like.count.should be 0
      post :create, picture_id: @picture.id
      assert_response :success
      Like.count.should be 1
    end

    it 'Should not created' do
      sign_in @user
      Like.count.should be 0
      post :create, picture_id: @picture.id
      assert_response :success
      Like.count.should be 1
      post :create, picture_id: @picture.id
      Like.count.should be 1
    end

  end

  context 'POST #delete' do

    it 'Should be delete' do
      sign_in @user
      Like.count.should be 0
      post :create, picture_id: @picture.id
      assert_response :success
      Like.count.should be 1

      post :destroy, picture_id: @picture.id
      assert_response :success
      Like.count.should be 0
    end

    it 'Should not deleted' do
      sign_in @user
      Like.count.should be 0
      post :create, picture_id: @picture.id
      assert_response :success
      Like.count.should be 1

      post :destroy, picture_id: 0
      Like.count.should be 1
    end

  end

end