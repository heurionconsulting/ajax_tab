# Ajaxtab
module Ajaxtab
  VERTICAL = :vertical
  HORIZONTAL = :horizontal
  
  @ajaxtab_id = 0
  @@ajaxtab_defaults = {
    :dimension              => :vertical,
    :themeclass             => :default,
    :defaulttab             =>  0
  }
  mattr_reader :ajaxtab_defaults
  
  def ajaxtab(tabs = [], ajaxtab_options = {})
    Ajaxtab::ajaxtab_defaults[:name] = "ajaxtab_" + @ajaxtab_id.to_i.to_s
    @ajaxtab_id = @ajaxtab_id.to_i + 1
    
    Ajaxtab::ajaxtab_defaults[:indicator] = @template.image_tag("ajaxtab/ajaxtab_loader.gif", :alt=>"Loading...", :title=>"Contents are still loading, please wait") + "<br /><h3>Loading...</h3>"
    ajaxtab_options = Ajaxtab::ajaxtab_defaults.merge(ajaxtab_options)
    ajaxtab_options[:authenticity_token] = @template.form_authenticity_token
    
    @template.render :partial=>"ajaxtab/ajaxtab", :locals=>{:tabs=>tabs, :ajaxtab_options=>ajaxtab_options}
  end
  
  def ajaxtab_includes
    output = @template.javascript_include_tag("ajaxtab/ajaxtab")
    output += @template.stylesheet_link_tag("ajaxtab/ajaxtab")
    output += @template.stylesheet_link_tag("ajaxtab/themes")
    output += "<script>authenticityToken = #{@template.form_authenticity_token};</script>"
    return output
  end
end