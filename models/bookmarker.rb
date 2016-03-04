require('pg')
require('pry-byebug')

class Bookmarker

  attr_reader(:id, :url, :title, :genre, :details)

  def initialize(options)
    @id = nil || options['id']  #bcos when u create it won't have an id yet
    @url = options['url']
    @title = options['title']
    @genre = options['genre']
    @details = options['details']
  end

  def save()
    sql = "INSERT INTO bookmarkers ( 
      title, 
      url, 
      genre, 
      details ) VALUES (
      '#{ @title }',
      '#{ @url}',
      '#{ @genre }',
      '#{ @details }'
      )"

      Bookmarker.run_sql(sql)
  end

  def self.all()
    bookmarker = Bookmarker.run_sql("SELECT * FROM pizzas")  # nb sql don't need ; here
    result = bookmarker.map { |b| Bookmarker.new( b ) }
    
    return result
  end



private

  def self.run_sql(sql)
    begin
      db = PG.connect( { dbname: 'bookmarker', host: 'localhost' } )
      result = db.exec( sql )
      return result
    ensure
      db.close
    end
  end
end