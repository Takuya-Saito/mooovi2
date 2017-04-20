class Scraping

  def self.get_movie_url
    next_url = ""
    while true do
      info_all = Mechanize.new().get('http://review-movie.herokuapp.com' + next_url)
      info_url = info_all.search('h2.entry-title a')
      urls = []
      info_url.each do |info|
        relative_url = info.get_attribute('href')
        url = "http://review-movie.herokuapp.com" + relative_url
        urls << url
      end
      save_movie_info(urls)
      next_link = info_all.at('.next a')
      break unless next_link
      next_url = next_link[:href]
    end
  end

  def self.save_movie_info(urls)
    urls.each do |url|
      page = Mechanize.new().get(url)
      title = page.at('h2.entry-title').inner_text
      image_url = page.at('.entry-content img')[:src]
      director = page.at('.director span').inner_text
      detail = page.at('.entry-content p').inner_text
      open_date = page.at('.date span').inner_text
      product = Product.where(title: title, image_url: image_url, director: director, detail: detail, open_date: open_date).first_or_initialize
      product.save
    end
  end
end