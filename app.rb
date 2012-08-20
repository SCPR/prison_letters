$: << '.'

require 'rubygems'
require 'yaml'

require 'sinatra'

require 'models/page'
require 'models/letter'

set :app_file, __FILE__

APP_NAMESPACE = ""

#---------------------

helpers do
  #-------
  # Route helpers
  def base_url
    APP_NAMESPACE
  end
  
  def letter_path(letter_id)
    "#{base_url}/letters/#{letter_id}/"
  end
  
  def page_path(letter_id, page_number)
    "#{base_url}/letters/#{letter_id}/page/#{page_number}/"
  end
  
  def asset_path(file)
    "#{base_url}/#{file}"
  end

  #-------
  
  def prev_page(page)
    if page.page_number > 1
      page.page_number - 1
    else
      nil
    end
  end
  
  def next_page(page)
    if page.page_number < page.letter.total_pages
      page.page_number + 1
    else
      nil
    end
  end
  
  #-------
  
  def prev_letter(letter)
    if letter.id > 1
      letter.id - 1
    else
      nil
    end
  end
  
  def next_letter(letter)
    if letter.id < Letter.all.size
      letter.id + 1
    else
      nil
    end
  end
end

#---------------------

def load_objects(letter_id, page_number)
  @all_letters = Letter.all
  @all_pages   = Page.all
  
  @letter = Letter.find_by_id(letter_id)
  @page   = @letter.pages.find { |page| page.page_number == page_number }
  
  erb :detail
end

get "#{APP_NAMESPACE}/?" do
  load_objects(1, 1)
end

get "#{APP_NAMESPACE}/letters/?" do
  load_objects(1, 1)  
end

get "#{APP_NAMESPACE}/letters/:letter/?" do
  load_objects(params[:letter].to_i, 1)
end

get "#{APP_NAMESPACE}/letters/:letter/page/:page/?" do
  load_objects(params[:letter].to_i, params[:page].to_i)
end
