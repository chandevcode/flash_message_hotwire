class CurhatsController < ApplicationController
  before_action :set_curhat, only: %i[show edit update destroy]

  # GET /curhats or /curhats.json
  def index
    @curhats = Curhat.all
  end

  # GET /curhats/1 or /curhats/1.json
  def show; end

  # GET /curhats/new
  def new
    @curhat = Curhat.new
  end

  # GET /curhats/1/edit
  def edit; end

  # POST /curhats or /curhats.json
  def create
    @curhat = Curhat.new(curhat_params)

    respond_to do |format|
      if @curhat.save
        flash.now[:notice] = 'Curhat was created !'
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('new_curhat', partial: 'curhats/form', locals: { curhat: Curhat.new }),
            turbo_stream.prepend('curhats', partial: 'curhats/curhat', locals: { curhat: @curhat }),
            turbo_stream.prepend('flash', partial: 'layouts/flash')
          ]
        end
        format.html { redirect_to curhat_url(@curhat), notice: 'Curhat was successfully created.' }
        format.json { render :show, status: :created, location: @curhat }
      else
        format.turbo_stream do
          render turbo_stream:
            turbo_stream.update('new_curhat', partial: 'curhats/form', locals: { curhat: @curhat })
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @curhat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curhats/1 or /curhats/1.json
  def update
    respond_to do |format|
      if @curhat.update(curhat_params)
        format.html { redirect_to curhat_url(@curhat), notice: 'Curhat was successfully updated.' }
        format.json { render :show, status: :ok, location: @curhat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @curhat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curhats/1 or /curhats/1.json
  def destroy
    @curhat.destroy

    respond_to do |format|
      format.html { redirect_to curhats_url, notice: 'Curhat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_curhat
    @curhat = Curhat.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def curhat_params
    params.require(:curhat).permit(:tema, :description)
  end
end
