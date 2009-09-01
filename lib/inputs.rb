module Inputs
  
  # Create text_field with mask.
  #
  # Example:
  #   
  #   # View:
  #   <%= masked_text_field(:user, :phone, :size => 13, :mask => '(99)9999-9999') %>
  #
  #   # Output:
  #   # => <input alt="(99)9999-9999" id="user_phone" name="user[phone]" size="13" type="text" />
  #
  def masked_text_field(object, method, options = {})
    return text_field(object, method, options) unless options.has_key?(:mask)
    options[:title] = options.delete(:alt) if options.has_key?(:alt)
    options[:alt] = options.delete(:mask)
    text_field(object, method, options)
  end

  # #
  # !! Sorry, this method has been deprecated.
  # #
  #
  # Create text_field with masks for price
  #
  # Example:
  #
  #   # View:
  #   <%= price_us_text_field(:product, :price, :size => 10) %>
  #
  #   # Output:
  #   # => <input id="product_price" name="product[price]" size="10" type="text" />
  #   # => <script type="text/javascript">
  #         //<![CDATA[
  #           $('#product_price').priceFormat();
  #         //]]>
  #       </script>
  #
  def price_us_text_field(object, method, options = {})
    raise "[DEPRECATION] price_us_text_field is deprecated, use decimal_us_text_field instead."
  end

  # Add required files
  #
  #   # View:
  #   <%= javascript_include_tag :defaults %>
  #   <%= javascript_include_inputs %>
  #
  def javascript_include_inputs
    javascript_include_tag('jquery.meio.mask.min') +
      javascript_tag("(function($){$(function(){$('input:text').setMask();});})(jQuery);")
  end

end
