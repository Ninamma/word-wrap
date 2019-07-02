require "rspec/autorun"

class Wrapper
  def wrap(string, max_length)
    return string if string.length <= max_length
    start = 0
    while start + max_length <= string.length
      subString = string[start...start + max_length]
      lastSpace = subString.rindex(" ")
      if lastSpace
        string[start + lastSpace] = "\n" if lastSpace > 0
        string[start] = "" if lastSpace == 0
      else
        string.insert(start+max_length, "\n") if lastSpace.nil?
      end
      lastNewLine = string.rindex("\n")
      start = lastNewLine + 1
    end
    string.strip
  end
end


describe Wrapper do
  describe "#wrap" do

    it "returns empty string if given an empty string" do
      wrap = Wrapper.new

      expect(wrap.wrap("", 1)).to eq("")
    end

    it "returns the string if it's shorter than max length" do
      wrap = Wrapper.new

      expect(wrap.wrap("test", 7)).to eq("test")
    end

    it "breaks up a string with two words at the space" do
      wrap = Wrapper.new

      expect(wrap.wrap("hello world", 7)).to eq("hello\nworld")
    end

    it "breaks up three words at the space" do
      wrap = Wrapper.new

      expect(wrap.wrap("word word word", 5)).to eq("word\nword\nword")
    end

    it "keeps as many words on a line as possible"  do
      wrap = Wrapper.new

      expect(wrap.wrap("word word word", 10)).to eq("word word\nword")
    end

    it "splits a long word at the max length" do
      wrap = Wrapper.new

      expect(wrap.wrap("longword", 4)).to eq("long\nword")
    end

    it "splits a really long word at the max length" do
      wrap = Wrapper.new

      expect(wrap.wrap("longlongword", 4)).to eq("long\nlong\nword")
    end

    it "splits a word on the whitespace" do
      wrap = Wrapper.new

      expect(wrap.wrap("long word", 5)).to eq("long\nword")
    end

    it "splits early when the space is before the max length" do
      wrap = Wrapper.new

      expect(wrap.wrap("long word", 6)).to eq("long\nword")
    end

    it "splits whitespace that's after the max length" do
      wrap = Wrapper.new

      expect(wrap.wrap("long word", 4)).to eq("long\nword")
    end
  end
end   