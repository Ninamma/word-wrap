require "rspec/autorun"

# Brian Hughes' solution

class Wrapper
  def wrap(string, max_len)
    return string if string.length <= max_len
    break_col = string[0...max_len].rindex(" ") || max_len
    string[0...break_col].strip + "\n" + wrap(string[break_col..-1].strip, max_len)
  end
end

# Codewars tests: https://www.codewars.com/kata/word-wrap-1
# test 4 and 5 fail

describe Wrapper do
  describe "#wrap" do

    it "test 1" do
      wrap = Wrapper.new

      expect(wrap.wrap("test", 7)).to eq("test")
    end

    it "test 2" do
      wrap = Wrapper.new

      expect(wrap.wrap("hello world", 7)).to eq("hello\nworld")
    end

    it "test 3" do
      wrap = Wrapper.new

      expect(wrap.wrap("a lot of words for a single line", 10)).to eq("a lot of\nwords for\na single\nline")
    end

    it "test 4" do
      wrap = Wrapper.new

      expect(wrap.wrap("this\nis a test", 4)).to eq("this\nis a\ntest")
    end

    it "test 5"  do
      wrap = Wrapper.new

      expect(wrap.wrap("a longword", 6)).to eq("a long\nword")
    end

    it "test 6" do
      wrap = Wrapper.new

      expect(wrap.wrap("areallylongword", 6)).to eq("areall\nylongw\nord")
    end
  end
end

# Brian Hughes' tests

# describe Wrapper do
#   describe "#wrap" do

#     it "returns empty string if given an empty string" do
#       wrap = Wrapper.new

#       expect(wrap.wrap("", 1)).to eq("")
#     end

#     it "returns the string if it's shorter than max length" do
#       wrap = Wrapper.new

#       expect(wrap.wrap("test", 7)).to eq("test")
#     end

#     it "breaks up a string with two words at the space" do
#       wrap = Wrapper.new

#       expect(wrap.wrap("hello world", 7)).to eq("hello\nworld")
#     end

#     it "breaks up three words at the space" do
#       wrap = Wrapper.new

#       expect(wrap.wrap("word word word", 5)).to eq("word\nword\nword")
#     end

#     it "keeps as many words on a line as possible"  do
#       wrap = Wrapper.new

#       expect(wrap.wrap("word word word", 10)).to eq("word word\nword")
#     end

#     it "splits a long word at the max length" do
#       wrap = Wrapper.new

#       expect(wrap.wrap("longword", 4)).to eq("long\nword")
#     end

#     it "splits a really long word at the max length" do
#       wrap = Wrapper.new

#       expect(wrap.wrap("longlongword", 4)).to eq("long\nlong\nword")
#     end

#     it "splits a word on the whitespace" do
#       wrap = Wrapper.new

#       expect(wrap.wrap("long word", 5)).to eq("long\nword")
#     end

#     it "splits early when the space is before the max length" do
#       wrap = Wrapper.new

#       expect(wrap.wrap("long word", 6)).to eq("long\nword")
#     end

#     it "splits whitespace that's after the max length" do
#       wrap = Wrapper.new

#       expect(wrap.wrap("long word", 4)).to eq("long\nword")
#     end

#   end
# end