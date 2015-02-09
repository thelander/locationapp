module CommonHelper
  def reload
    visit current_path
  end

  def saop
    save_and_open_page
  end
end
