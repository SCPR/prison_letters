class Page
  class << self
    def all
      @pages ||= begin
        pages = YAML.load_file("fixtures/pages.yml")
      end
    end

    #----------------

    def total_pages
      @total_pages ||= self.all.size
    end
  end

  #----------------

  attr_accessor :letter_id, :page_number, :full_url, :viewer_url, :thumb_url

  #----------------

  def letter
    Letter.all.find { |letter| letter.id == self.letter_id }
  end
end
