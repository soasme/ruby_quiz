# -*- coding: utf-8 -*-

require 'erb'

class MadTemplate

  def initialize options={}
    @mad_variables = Hash.new
    @seperator = ':'
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
    words = word.split(@seperator)
    @mad_variables[words[0]] if words.size > 0
  end

end
