def count_occurrences(lst):
    counts = { item: lst.count(item) for item in lst }
    for item in counts:
        print(f"{item} => {counts[item]} ")

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
