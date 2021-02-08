class TextAnalyzer
  def process
    text = File.read('sample_text.txt')
    yield text
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.lines.count("\n") + 1} paragraphs." }
analyzer.process { |text| puts "#{text.lines.size} lines." }
analyzer.process { |text| puts "#{text.split.size} words."}
