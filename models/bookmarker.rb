require('pg')
require('pry-byebug')

class Bookmarker

  attr_reader(:url, :title, :genre, :details)

  def initialize(options)
    @url = options['url'],
    @title = options['title'],
    @genre = options['genre'],
    @details = options['details']
  end




end