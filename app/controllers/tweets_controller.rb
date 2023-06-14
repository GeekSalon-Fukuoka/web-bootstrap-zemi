class TweetsController < ApplicationController
    def top

    end
    def bootstrap
        @tweets=Tweet.all
        @tweet=Tweet.new
    end

    def example

    end

    def grid

    end

    def index
        point = params[:point]
        if point=="cost"
            @tweets = Tweet.all.order(cost: "ASC")
        elsif point=="taste"
            @tweets = Tweet.all.order(taste: "ASC")
        else
            @tweets = Tweet.all
        end
    end

    def new
        @tweet = Tweet.new
    end

    def create
        tweet = Tweet.new(tweet_params)
        if tweet.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @tweet = Tweet.find(params[:id])
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end

    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
            redirect_to :action => "show", :id => tweet.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end

    private
    def tweet_params
        params.require(:tweet).permit(:body,:image,:title,:cost,:taste)
    end
end
