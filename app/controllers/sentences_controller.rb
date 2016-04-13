class SentencesController < ApplicationController
  before_action :set_sentence, only: [:show, :edit, :update, :destroy, :load_form]

  # GET /sentences
  # GET /sentences.json
  def index
    @sentences = Sentence.all
  end

  # GET sentences/japonais
  # GET sentences/japonais/kanas
  # GET sentences/japonais/kanjis
  def japonais
    @sentences = Sentence.jp 
    render "index"
  end

  # GET /sentences/1
  # GET /sentences/1.json
  def show
  end

  # GET /sentences/new
  def new
    @sentence = Sentence.new
  end

  # GET /sentences/1/edit
  def edit
  end

  # POST /sentences
  # POST /sentences.json
  def create
    @sentence = Sentence.new()
    @sentence.lang = sentence_params[:lang]
    
    respond_to do |format|
      if @sentence.save
      	sentence_params[:hash_symbole_ids].each do |key, value|
      		SentenceSymbole.create(position: key, symbole_id: value, sentence_id: @sentence.id)
      	end
        format.html { redirect_to @sentence, notice: 'Sentence was successfully created.' }
        format.json { render :show, status: :created, location: @sentence }
      else
        format.html { render :new }
        format.json { render json: @sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sentences/1
  # PATCH/PUT /sentences/1.json
  def update
    @sentence.lang = sentence_params[:lang]
    respond_to do |format|
      if @sentence.save
        sentence_params[:hash_symbole_ids].each do |key, value|
          @sentence.sentence_symboles.destroy_all
          SentenceSymbole.create(position: key, symbole_id: value, sentence_id: @sentence.id)
        end
        format.html { redirect_to @sentence, notice: 'Sentence was successfully updated.' }
        format.json { render :show, status: :ok, location: @sentence }
      else
        format.html { render :edit }
        format.json { render json: @sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sentences/1
  # DELETE /sentences/1.json
  def destroy
    @sentence.destroy
    respond_to do |format|
      format.html { redirect_to sentences_url, notice: 'Sentence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # (ajax) load form for a specific language
  def load_form
    @sentence = Sentence.new if @sentence.nil?
    if params[:form_name].present?
      respond_to do |format|
        format.js { render "ajax_form_"+params[:form_name] }
      end
    end
  end

  def load_select_tag
    respond_to do |format|
      format.js { render :ajax_add_select_tag }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentence
      if params[:id].present?
        @sentence = Sentence.find(params[:id])
      else
        @sentence = Sentence.new
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sentence_params
      params.require(:sentence)
                                                                                     
    end
end
