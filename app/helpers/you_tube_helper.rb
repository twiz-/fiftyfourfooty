module YouTubeHelper
  def you_tube_presenter_for(feed)
    presenter = YouTubePresenter.new(feed)
    if block_given?
      yield presenter
    else
      presenter
    end
  end
end