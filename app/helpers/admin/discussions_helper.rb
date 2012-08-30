module Admin::DiscussionsHelper
  def time_now 
    Date.parse(Time.now.to_s).strftime("%d/%m/%Y")
  end
end
