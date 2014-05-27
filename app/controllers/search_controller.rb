class SearchController < UIViewController
  def viewDidLoad
    super

    self.title = "Search"
    self.view.backgroundColor = UIColor.whiteColor

    @text_field = UITextField.alloc.initWithFrame [[0,0], [160,26]]
    @text_field.placeholder = "#eaeaea"
    @text_field.textAlignment = UITextAlignmentCenter
    @text_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    @text_field.borderStyle = UITextBorderStyleRoundedRect
    @text_field.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 100)
    self.view.addSubview @text_field

    @search = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @search.setTitle("Search", forState: UIControlStateNormal)
    @search.setTitle("Loading", forState: UIControlStateDisabled)
    @search.sizeToFit
    @search.center = CGPointMake(self.view.frame.size.width / 2, @text_field.center.y + 40)
    self.view.addSubview @search

    # THis is from BW:: an awesome wrapper for addTarget:
    @search.when(UIControlEventTouchUpInside) do
      @search.enabled = false
      @text_field.enabled = false

      hex = @text_field.text
      # Let's get rid of the hash symbol from the input
      hex = hex[1..-1] if hex[0] == "#"

      Color.find(hex) do |color|
        @search.enabled = true
        @text_field.enabled = true
      end
    end
  end
end
