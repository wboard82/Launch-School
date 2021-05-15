# Write a program that will ask for user's name. The program will then greet
# the user. If the user writes "name!" then the computer yells back to the user.

print("Please enter your name:")
name = input().strip()

if name[-1] == '!':
    print(f"HELLO {name[0:-1].upper()}. WHY ARE WE SCREAMING?")
else:
    print(f"Hello {name.capitalize()}.")

