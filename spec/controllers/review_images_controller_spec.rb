require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ReviewImagesController do

  # This should return the minimal set of attributes required to create a valid
  # ReviewImage. As you add validations to ReviewImage, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all review_images as @review_images" do
      review_image = ReviewImage.create! valid_attributes
      get :index
      assigns(:review_images).should eq([review_image])
    end
  end

  describe "GET show" do
    it "assigns the requested review_image as @review_image" do
      review_image = ReviewImage.create! valid_attributes
      get :show, :id => review_image.id
      assigns(:review_image).should eq(review_image)
    end
  end

  describe "GET new" do
    it "assigns a new review_image as @review_image" do
      get :new
      assigns(:review_image).should be_a_new(ReviewImage)
    end
  end

  describe "GET edit" do
    it "assigns the requested review_image as @review_image" do
      review_image = ReviewImage.create! valid_attributes
      get :edit, :id => review_image.id
      assigns(:review_image).should eq(review_image)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ReviewImage" do
        expect {
          post :create, :review_image => valid_attributes
        }.to change(ReviewImage, :count).by(1)
      end

      it "assigns a newly created review_image as @review_image" do
        post :create, :review_image => valid_attributes
        assigns(:review_image).should be_a(ReviewImage)
        assigns(:review_image).should be_persisted
      end

      it "redirects to the created review_image" do
        post :create, :review_image => valid_attributes
        response.should redirect_to(ReviewImage.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved review_image as @review_image" do
        # Trigger the behavior that occurs when invalid params are submitted
        ReviewImage.any_instance.stub(:save).and_return(false)
        post :create, :review_image => {}
        assigns(:review_image).should be_a_new(ReviewImage)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ReviewImage.any_instance.stub(:save).and_return(false)
        post :create, :review_image => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested review_image" do
        review_image = ReviewImage.create! valid_attributes
        # Assuming there are no other review_images in the database, this
        # specifies that the ReviewImage created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ReviewImage.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => review_image.id, :review_image => {'these' => 'params'}
      end

      it "assigns the requested review_image as @review_image" do
        review_image = ReviewImage.create! valid_attributes
        put :update, :id => review_image.id, :review_image => valid_attributes
        assigns(:review_image).should eq(review_image)
      end

      it "redirects to the review_image" do
        review_image = ReviewImage.create! valid_attributes
        put :update, :id => review_image.id, :review_image => valid_attributes
        response.should redirect_to(review_image)
      end
    end

    describe "with invalid params" do
      it "assigns the review_image as @review_image" do
        review_image = ReviewImage.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ReviewImage.any_instance.stub(:save).and_return(false)
        put :update, :id => review_image.id, :review_image => {}
        assigns(:review_image).should eq(review_image)
      end

      it "re-renders the 'edit' template" do
        review_image = ReviewImage.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ReviewImage.any_instance.stub(:save).and_return(false)
        put :update, :id => review_image.id, :review_image => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested review_image" do
      review_image = ReviewImage.create! valid_attributes
      expect {
        delete :destroy, :id => review_image.id
      }.to change(ReviewImage, :count).by(-1)
    end

    it "redirects to the review_images list" do
      review_image = ReviewImage.create! valid_attributes
      delete :destroy, :id => review_image.id
      response.should redirect_to(review_images_url)
    end
  end

end
