class SymbolesController < ApplicationController
  authorize_actions_for Symbole, except:[:load_form, :load_attributes_form]
  before_action :set_symbole, only: [:show, :edit, :update, :destroy, :load_form, :load_attributes_form]
  # GET /symboles
  # GET /symboles.json
  def index
    @symboles = Symbole.all
  end

  # GET symboles/japonais
  # GET symboles/japonais/kanas
  # GET symboles/japonais/kanjis
  def japonais
    @symboles = Symbole.jp
    case params[:type]
    when "kanas"
      @symboles = @symboles.kanas
    when "kanjis"
      @symboles = @symboles.kanjis
    end
    render "index"
  end

  # GET /symboles/1
  # GET /symboles/1.json
  def show
  end

  # GET /symboles/new
  def new
    @symbole = Symbole.new
  end

  # GET /symboles/1/edit
  def edit
  end

  # POST /symboles
  # POST /symboles.json
  def create
    @symbole = Symbole.new()
    if symbole_params[:symbole_type].present?
      @symbole.build_kanji_attribute if symbole_params[:symbole_type] == "kanji"
      @symbole.build_kana_attribute if symbole_params[:symbole_type] == "kana"
    end
    @symbole.assign_attributes(symbole_params)

    respond_to do |format|
      if @symbole.save
        format.html { redirect_to @symbole, notice: 'Symbole was successfully created.' }
        format.json { render :show, status: :created, location: @symbole }
      else
        format.html { render :new }
        format.json { render json: @symbole.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /symboles/1
  # PATCH/PUT /symboles/1.json
  def update
    respond_to do |format|
      if @symbole.update(symbole_params)
        format.html { redirect_to @symbole, notice: 'Symbole was successfully updated.' }
        format.json { render :show, status: :ok, location: @symbole }
      else
        format.html { render :edit }
        format.json { render json: @symbole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /symboles/1
  # DELETE /symboles/1.json
  def destroy
    @symbole.destroy
    respond_to do |format|
      format.html { redirect_to symboles_url, notice: 'Symbole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # (ajax) load form for a specific language
  def load_form
    @symbole = Symbole.new if @symbole.nil?
    if params[:form_name].present?
      respond_to do |format|
        format.js { render "ajax_form_"+params[:form_name] }
      end
    end
  end

  # (ajax) load form for a specific attribute
  def load_attributes_form
    @symbole = Symbole.new if @symbole.nil?
    if params[:form_name].present?
      respond_to do |format|
        format.js { render "ajax_form_"+params[:form_name] }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_symbole
      if params[:id].present?
        @symbole = Symbole.find(params[:id])
      else
        @symbole = Symbole.new
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def symbole_params
      params.require(:symbole).permit(:lang, :example_fr, :symbole_type, :css_class, kanji_attribute_attributes: [:value,:concept, :fr],
                                                                                     kana_attribute_attributes: [:hiragana_value,:katakana_value, :fr]
                                                                                     )
    end
end
