# frozen_string_literal: true

module Ajax
  class FeedsController < ApplicationController
    def index
      @feeds = Feed.order(created_at: :desc).limit(10)

      respond_to do |format|
        format.json { render json: ::FeedSerializer.new(@feeds).serialized_json }
      end
    end
  end
end
