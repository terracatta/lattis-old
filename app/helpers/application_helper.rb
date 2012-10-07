module ApplicationHelper
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
