class StatisticsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  inherit_resources
  actions :create
  nested_belongs_to :user, :optional => true
  respond_to :html, :xml
  def create
    create!
  end
  def index
    @user = User.find(params[:user_id])
    @statistics = @user.statistics.where(:created_at.gte => Time.now.beginning_of_week,
                                  :created_at.lte => Time.now.end_of_week).inject([0] * 7) {
        |arr,stat| arr[stat.created_at.wday] += 1; arr
    }
    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.series(:name => 'This Week', :data=> @statistics)
      f.options[:chart][:defaultSeriesType] = "line"
      f.options[:title][:text] = "Tests taken"
      f.options[:yAxis][:title] = nil
      f.options[:xAxis][:categories] = ["Monday" ,"Tuesday" , "Wednesday" , "Thursday", "Friday", "Saturday", "Sunday"]
    end
    
  end
end
