require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/experiments" do
  # This should return the minimal set of attributes required to create a valid
  # Experiment. As you add validations to Experiment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Experiment.create! valid_attributes
      get experiments_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      experiment = Experiment.create! valid_attributes
      get experiment_url(experiment)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_experiment_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      experiment = Experiment.create! valid_attributes
      get edit_experiment_url(experiment)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Experiment" do
        expect {
          post experiments_url, params: {experiment: valid_attributes}
        }.to change(Experiment, :count).by(1)
      end

      it "redirects to the created experiment" do
        post experiments_url, params: {experiment: valid_attributes}
        expect(response).to redirect_to(experiment_url(Experiment.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Experiment" do
        expect {
          post experiments_url, params: {experiment: invalid_attributes}
        }.not_to change(Experiment, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post experiments_url, params: {experiment: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested experiment" do
        experiment = Experiment.create! valid_attributes
        patch experiment_url(experiment), params: {experiment: new_attributes}
        experiment.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the experiment" do
        experiment = Experiment.create! valid_attributes
        patch experiment_url(experiment), params: {experiment: new_attributes}
        experiment.reload
        expect(response).to redirect_to(experiment_url(experiment))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        experiment = Experiment.create! valid_attributes
        patch experiment_url(experiment), params: {experiment: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested experiment" do
      experiment = Experiment.create! valid_attributes
      expect {
        delete experiment_url(experiment)
      }.to change(Experiment, :count).by(-1)
    end

    it "redirects to the experiments list" do
      experiment = Experiment.create! valid_attributes
      delete experiment_url(experiment)
      expect(response).to redirect_to(experiments_url)
    end
  end
end
