module Apis
  module V1
    #
    # Controller for Birds related acions.
    #
    # @author [sreeraj s]
    #
    class BirdsController < Apis::V1::BaseApiController
      before_action :set_bird, only: [:show, :edit, :destroy]

      MSG = YAML.load_file(GlobalConstants::MSG_PATH + 'birds.yml')

      # List all the birds.
      # GET /apis/birds.json
      def index
        msg = MSG['index']['success']
        common_response(msg, birds: Bird.where(visible: true))
      end

      # Create a new bird record.
      # POST /apis/birds.json
      def create
        bird = Bird.new(bird_params)
        if bird.save
          msg = MSG['create']['success']
          opt = { bird: bird, status: :created }
        else
          @success = false
          msg = bird.errors.full_messages
          opt = { status: :bad_request }
        end
        common_response(msg, opt)
      end

      # Details of a single bird record.
      # GET /apis/birds/:id.json
      def show
        opt = { status: :ok }
        if @bird
          msg = MSG['show']['success']
          opt[:bird] = @bird
        else
          @success = false
          msg = MSG['show']['failure']
          opt[:status] = :not_found
        end
        common_response(msg, opt)
      end

      # Method to delete a bird record.
      # DELETE /apis/birds/:id.json
      def destroy
        opt = { status: :ok }
        if @bird && @bird.destroy
          msg = MSG['destroy']['success']
        else
          @success = false
          msg = MSG['destroy']['failure']
          opt[:status] = :not_found
        end
        common_response(msg, opt)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_bird
        @bird = Bird.find(params[:id])
      end

      # Never trust parameters from the scary internet,
      # only allow the white list through.
      def bird_params
        params.require(:birds)
              .permit(:name, :family, :added, :visible, continents: [])
      end
    end
  end
end
