# -*- coding: utf-8 -*-

require 'ruby_quiz'

describe MadTemplate do

  before do
    @mad = MadTemplate.new
  end

  it "should render word success" do
    result = @mad.render('((word))') do
      word = 'word'
    end
    expect(result).to eq('word')
  end

end
