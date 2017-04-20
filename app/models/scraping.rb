class Scraping

  def self.get_movie_url

    info_all = Mechanize.new().get('http://review-movie.herokuapp.com/').search('h2.entry-title a')
    urls = []
    info_all.each do |info|
      relative_url = info.get_attribute('href')
      url = "http://review-movie.herokuapp.com" + relative_url
      urls << url
    end
    urls.each do |url|
      page = Mechanize.new().get(url)
      title = page.at('h2.entry-title').inner_text
      image_url = page.at('.entry-content img')[:src]
      director = page.at('.director span').inner_text
      detail = page.at('.entry-content p').inner_text
      open_date = page.at('.date span').inner_text
      product = Product.new(title: title, image_url: image_url, director: director, detail: detail, open_date: open_date)
      product.save
    end
  end
end