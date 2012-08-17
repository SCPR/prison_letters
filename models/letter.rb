class Letter
  class << self
    def all
      @letters ||= begin
        letters = YAML.load_file("fixtures/letters.yml")
        letters.sort_by(&:id)
      end
    end

    #----------------
  
    def total_letters
      @total_letters ||= self.all.size
    end

    #----------------
    
    def find_by_id(id)
      self.all.find { |letter| letter.id == id.to_i }
    end
  end

  #----------------
  
  attr_accessor :id, :total_pages

  #----------------
  
  def pages
    Page.all.select { |page| page.letter_id == self.id }.sort_by(&:page_number)
  end
end
