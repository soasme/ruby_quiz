# -*- coding: utf-8 -*-

require 'erb'

class MadTemplate

  def initialize
    @mad_variables = Hash.new
  end

  def render template, local={}
    local.each do | k, v |
      @mad_variables[k] = v
    end
    erb_template(template).result binding
  end

  def erb_template template
    ERB.new transform(template)
  end

  def transform template
    template.gsub(/\(\(\s*(.+?)\s*\)\)/, "<%= binding_variable('\\1') %>")
  end

  def binding_variable word
    @mad_variables[word]
  end

end
