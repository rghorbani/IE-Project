class MessagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def seen_message
    @messages = Message.all.where("seen = ?", false)
    Message.read(@messages)
  end

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    #@messages = Message.all.where("receiver_id = ?", current_user.id).order("created_at DESC")
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
    @buildings = Unit.select("building_id").where("user_id = ?", current_user.id)
    @users = Unit.select("user_id").where("building_id = (?)", @buildings)
    @receivers = Profile.where("user_id = (?)", @users)
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    @message.sender_id = current_user.id
    # @message.receiver_id = current_user.id #temp
    @message.seen = false

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'پیغام با موفقیت ارسال گردید.' }
        format.json { render action: 'show', status: :created, location: @message }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:sender_id, :receiver_id, :content, :seen, :parent_id)
    end
end
