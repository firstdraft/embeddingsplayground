class ExamplesController < ApplicationController
  before_action :set_example, only: %i[show edit update destroy]

  # GET /examples or /examples.json
  def index
    @examples = Example.all
  end

  # GET /examples/1 or /examples/1.json
  def show
  end

  # GET /examples/new
  def new
    @example = Example.new
  end

  # GET /examples/1/edit
  def edit
  end

  # POST /examples or /examples.json
  def create
    @example = Example.new(example_params)
    @example.user = current_user

    client = OpenAI::Client.new
    
    response = client.embeddings(
      parameters: {
        model: "text-embedding-3-large",
        input: @example.content
      }
    )

    @example.embedding = response.dig("data", 0, "embedding")

    respond_to do |format|
      if @example.save
        format.html { redirect_to @example.experiment, notice: "Example was successfully created." }
        format.json { render :show, status: :created, location: @example }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @example.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /examples/1 or /examples/1.json
  def update
    respond_to do |format|
      if @example.update(example_params)
        format.html { redirect_to example_url(@example), notice: "Example was successfully updated." }
        format.json { render :show, status: :ok, location: @example }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @example.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examples/1 or /examples/1.json
  def destroy
    @example.destroy!

    respond_to do |format|
      format.html { redirect_to examples_url, notice: "Example was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_example
    @example = Example.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def example_params
    params.require(:example).permit(:experiment_id, :content, :embedding, :user_id)
  end
end
