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
      # GET /apis/birds
      def index
        msg = MSG['index']['success']
        common_response(msg, birds: Bird.all)
      end

      # Create a new bird record.
      # POST /apis/birds
      def create
        bird = Bird.new(bird_params)
        if bird.save
          msg = MSG['create']['success']
        else
          @success = false
          msg = bird.errors.full_messages
        end
        common_response(msg, bird: bird)
      end

      # Details of a single bird record.
      # GET /apis/birds/:id
      def show
        msg = MSG['show']['success']
        common_response(msg, bird: @bird)
      end

      # Method to delete a bird record.
      # DELETE /apis/birds/:id
      def destroy
        if @bird.destroy
          msg = MSG['destroy']['success']
        else
          @success = false
          msg = @bird.errors.full_messages
        end
        common_response(msg)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_bird
        @bird = Bird.find(params[:id])
      end

      # Never trust parameters from the scary internet,
      # only allow the white list through.
      def bird_params
        params.require(:bird)
              .permit(:name, :family, :continents, :added, :visible)
      end
    end
  end
end
