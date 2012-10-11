module ApplicationHelper

  def pretty_time(time)
    time ||= Time.now
    formatted_time = time.strftime('%m/%d/%y %I:%M %p')
  end


  def button(*args, &block)
    options      = args[1] || {}
    html_options = args[2] || {}

    button_class =  if options.kind_of?(Hash) && options.has_key?(:button_type)
      "#{options[:button_type]}"
    elsif html_options.kind_of?(Hash) && html_options.has_key?(:button_type)
       "#{html_options[:button_type]}"
    else
      ""
    end

    html_options[:class] = ""  unless html_options.has_key?(:class)
    html_options[:class] += " button #{button_class}"

    if args[2]
      args[2] = html_options
    else
      args.push html_options
    end

    link_to(*args, &block)
  end

  # Returns ActiveSupport::SafeBuffer containing button
  def link_to_with_icon(*args, &block)
    if block_given?
      options      = args.first || {}
      html_options = args.second
      link_to(capture(&block), options, html_options)
    else
      name         = args[0]
      options      = args[1] || {}
      html_options = args[2]

      if html_options.kind_of?(Hash) && html_options.has_key?(:icon_class)
        name = %{<i class="#{html_options[:icon_class]}"></i>#{name}}.html_safe
      end

      name = %{<span class="link"></span>#{name}}.html_safe

      html_options = convert_options_to_data_attributes(options, html_options)
      url = url_for(options)

      href = html_options['href']
      tag_options = tag_options(html_options)

      href_attr = "href=\"#{ERB::Util.html_escape(url)}\"" unless href
      "<a #{href_attr}#{tag_options}>#{ERB::Util.html_escape(name || url)}</a>".html_safe
    end
  end


  # Displays the specified user's gravatar.
  #
  # user    - A valid User object
  # options - A hash that is passed to image_tag (default: {size: "256x256"})
  #           :include_name - a boolean that decides if the user name is present d
  #           :gravatar_options - a hash passed to the gravatar_url method
  #           :container_options - a hash passed to content_for :span
  #
  # Examples
  #   avatar(user, class: "tiny", size: "32x32", gravatar_options: {size: 64})
  #   # => <span class="avatar"><img alt="7542189a18347535b064922788937ada"
  #         class="tiny" gravatar_options="{:size=&gt;64}" height="32" src="http
  #         s://secure.gravatar.com/avatar/7542189a18347535b064922788937ada.png?
  #         d=retro&amp;r=PG&amp;s=64" width="32" /></span>
  #
  # Returns ActiveSupport::SafeBuffer containing html for the user's avatar
  def avatar(user, options={})
    options[:size] ||= "256x256"
    options [:gravatar_options] ||= {}
    options[:container_options] ||= { class: "" }
    options[:container_options][:class] <<  " avatar"
    html = ActiveSupport::SafeBuffer.new
    html << content_tag(:span, user, class: "user-name") if options[:include_name]
    html << content_tag(:span, options[:container_options]) do
        image_tag(user.gravatar_url(options[:gravatar_options]), options)
    end

    html
  end
end
