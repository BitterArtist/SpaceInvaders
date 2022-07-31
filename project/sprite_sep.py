from PIL import Image
from os import mkdir


sheet = Image.open("assets\invaders_sheet.png")
count = 0

for x in range(8):
    for y in range(2):
        a = (x + 1) * 32
        b = (y + 1) * 32
        print(f"({a-32},{b-32}),({a},{b})")
        icon = sheet.crop((a - 32, b - 32, a, b))
        icon.save("assets/{}.png".format(count))
        count += 1
