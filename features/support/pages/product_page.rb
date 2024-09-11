module Pages
  def product_page(product_name:)
    @product_page ||= ProductPage.new(product_name: product_name)
  end

  class ProductPage < TestEvolve::Core::PageObject
    attr_reader :url
    element(:trusted_review_heading) { h2(text: "Trusted Review") }
    # -- Flare Test Recorder --
    # https://puk-tech-guide.vercel.app/catalogue

    def initialize(product_name: nil)
      @url = "#{TestEvolve.environment['root_url']}catalogue/#{product_name.to_s}"
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      TestEvolve.browser.h2(text: 'Overview').wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('product_page')
    end

  end
end
