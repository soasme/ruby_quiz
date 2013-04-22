# -*- coding: utf-8 -*-

require 'ruby_quiz'

describe MadTemplate do

  before do
    @mad = MadTemplate.new
  end

  it "should render word success" do
    result = @mad.render '((word))', {'word'=>'word'}
    expect(result).to eq('word')
  end

  it "should render nothing in dummy word" do
    result = @mad.render '(( ))', {}
    expect(result).to eq('')
  end

  it "should render word with space success" do
    result = @mad.render '((  word  ))', {'word'=>'word'}
    expect(result).to eq('word')
  end

  it "should render duplex words success" do
    result = @mad.render '((duplex words))', {'duplex words'=>'duplex_words'}
    expect(result).to eq('duplex_words')
  end

end
