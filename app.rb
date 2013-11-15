ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/calculator'
require './lib/graph'
require './lib/wheel_size'

class GearRatioCalculatorApp < Sinatra::Base
  set :show_exceptions, false

  get '/' do
    p params
    @chainring_sizes = ""
    @cog_sizes = ""
    @crank_length = ""
    @wheel_circumference = ""

    unless params.empty?
      @calculator = GearRatio::Calculator.new(chainring_sizes: params[:chainring_sizes],
        cog_sizes: params[:cog_sizes],
        crank_length: params[:crank_length],
        wheel_circumference: params[:wheel_circumference] )

      @chainring_sizes = @calculator.chainring_sizes.join(",")
      @cog_sizes = @calculator.cog_sizes.join(",")
      @crank_length = @calculator.crank_length
      @wheel_circumference = @calculator.wheel_circumference

      @graph = GearRatio::Graph.new(@calculator)
      @graph.gain_ratio_line_chart
    end

    erb :index
  end

end
