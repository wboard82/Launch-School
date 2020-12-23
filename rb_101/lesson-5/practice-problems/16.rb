def create_uuid()
  uuid_template = "%08x\-%04x\-%04x\-%04x\-%12x"
  format(uuid_template,
         rand(0xffffffff),
         rand(0xffff),
         rand(0xffff),
         rand(0xffff),
         rand(0xffffffffffff))
end

def generate_uuid()
  characters = []
  ('0'..'9').each { |digit| characters << digit }
  ('a'..'f').each { |char| characters << char }

  template = [8, 4, 4, 4, 12]
  uuid = ""

  template.each_with_index do |num_of_chars, index|
    num_of_chars.times { uuid << characters.sample }
    uuid << "-" unless index == template.size - 1
  end

  uuid
end


5.times do 
  p create_uuid
end

5.times do
  p generate_uuid
end
