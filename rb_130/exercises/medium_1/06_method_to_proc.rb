def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc

p [8, 10, 12, 14, 16, 33].map(&base8_proc)


def convert_to_base_16(n)
  n.to_s(16)
end

base16_proc = method(:convert_to_base_16).to_proc

p [8, 10, 12, 14, 16, 33].map(&base16_proc)
