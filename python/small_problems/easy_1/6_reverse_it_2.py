def reverse_words(sentence):
    return ' '.join([word[::-1] if len(word) >= 5 else word for word in
        sentence.split()])

print(reverse_words('Professional') == "lanoisseforP")
print(reverse_words('Walk around the block') == "Walk dnuora the kcolb")
print(reverse_words('Launch School') == "hcnuaL loohcS")
