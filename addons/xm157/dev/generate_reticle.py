from PIL import Image, ImageDraw, ImageFont, ImageFilter
import math

# based on vortex razor hd

final_scale = 10

supersample = 4
# supersampling helps make rounded circles, does slighly blur text and straight lines
pixels_per_mrad = supersample * final_scale
image_size = supersample * 4096
image_center = image_size / 2

# create an image
out = Image.new("RGBA", (image_size, image_size), (255, 255, 255, 0))
# get a drawing context
d = ImageDraw.Draw(out)

line_thin = math.floor(0.07 * pixels_per_mrad)
line_thick = math.floor(0.15 * pixels_per_mrad)
font_size = math.floor(0.55 * pixels_per_mrad)
# source https://fonts.google.com/specimen/Electrolize (Open Font License)
fnt = ImageFont.truetype("Electrolize-Regular.ttf", font_size)

# draw center dot
d.ellipse([
    (image_center - 0.1 * pixels_per_mrad, image_center - 0.1 * pixels_per_mrad),
    (image_center + 0.1 * pixels_per_mrad, image_center + 0.1 * pixels_per_mrad)
], fill=(0, 0, 0))

# draw 3 main axis lines
d.line([
    (image_center - 8 * pixels_per_mrad, image_center),
    (image_center - 0.5 * pixels_per_mrad, image_center)
], fill=(0, 0, 0), width=line_thin)
d.line([
    (0, image_center),
    (image_center - 8.5 * pixels_per_mrad, image_center)
], fill=(0, 0, 0), width=line_thick)
d.line([
    (image_center + 0.5 * pixels_per_mrad, image_center),
    (image_center + 8 * pixels_per_mrad, image_center)
], fill=(0, 0, 0), width=line_thin)
d.line([
    (image_center + 8.5 * pixels_per_mrad, image_center),
    (image_size, image_center)
], fill=(0, 0, 0), width=line_thick)
d.line([
    (image_center, image_center + 0.5 * pixels_per_mrad),
    (image_center, image_size)
], fill=(0, 0, 0), width=line_thin)

# draw big triangle bar things
if (image_center - 15 * pixels_per_mrad > 0):
    d.polygon([
        (0, image_center + 2 * pixels_per_mrad),
        (image_center - 20 * pixels_per_mrad, image_center + 2 * pixels_per_mrad),
        (image_center - 15 * pixels_per_mrad, image_center),
        (image_center - 20 * pixels_per_mrad, image_center - 2 * pixels_per_mrad),
        (0, image_center - 2 * pixels_per_mrad),
    ], fill=(0, 0, 0))
    d.polygon([
        (image_size, image_center + 2 * pixels_per_mrad),
        (image_center + 20 * pixels_per_mrad, image_center + 2 * pixels_per_mrad),
        (image_center + 15 * pixels_per_mrad, image_center),
        (image_center + 20 * pixels_per_mrad, image_center - 2 * pixels_per_mrad),
        (image_size, image_center - 2 * pixels_per_mrad),
    ], fill=(0, 0, 0))


# draw windage hash marks and text
for x in range(1, 9):
    if (x % 2 == 0):
        text = f"{abs(x)}"
        # windage odd numbers
        d.text((image_center + (x - 0.15) * pixels_per_mrad, image_center - 1.2 * pixels_per_mrad), text, font=fnt, fill=(0, 0, 0))
        d.text((image_center - (x + 0.15) * pixels_per_mrad, image_center - 1.2 * pixels_per_mrad), text, font=fnt, fill=(0, 0, 0))
    # windage mrad hashs
    d.line([
        (image_center + x * pixels_per_mrad, image_center + line_thin / 2),
        (image_center + x * pixels_per_mrad, image_center - 0.5 * pixels_per_mrad)
    ], fill=(0, 0, 0), width=line_thin)
    d.line([
        (image_center - x * pixels_per_mrad, image_center + line_thin / 2),
        (image_center - x * pixels_per_mrad, image_center - 0.5 * pixels_per_mrad)
    ], fill=(0, 0, 0), width=line_thin)
    if (x % 2 == 0):
        d.line([
            (image_center - x * pixels_per_mrad, image_center + 0.2 * pixels_per_mrad),
            (image_center - x * pixels_per_mrad, image_center + 0.7 * pixels_per_mrad)
        ], fill=(0, 0, 0), width=line_thick)
        d.line([
            (image_center + x * pixels_per_mrad, image_center + 0.2 * pixels_per_mrad),
            (image_center + x * pixels_per_mrad, image_center + 0.7 * pixels_per_mrad)
        ], fill=(0, 0, 0), width=line_thick)
    else:
        d.line([
            (image_center - x * pixels_per_mrad, image_center + 0.2 * pixels_per_mrad),
            (image_center - x * pixels_per_mrad, image_center + 0.55 * pixels_per_mrad)
        ], fill=(0, 0, 0), width=line_thick)
        d.line([
            (image_center + x * pixels_per_mrad, image_center + 0.2 * pixels_per_mrad),
            (image_center + x * pixels_per_mrad, image_center + 0.55 * pixels_per_mrad)
        ], fill=(0, 0, 0), width=line_thick)

    if (x < 8):
        # windage half mrad marks
        d.line([
            (image_center + (x + .5) * pixels_per_mrad, image_center),
            (image_center + (x + .5) * pixels_per_mrad, image_center - 0.25 * pixels_per_mrad)
        ], fill=(0, 0, 0), width=line_thin)
        d.line([
            (image_center - (x + .5) * pixels_per_mrad, image_center),
            (image_center - (x + .5) * pixels_per_mrad, image_center - 0.25 * pixels_per_mrad)
        ], fill=(0, 0, 0), width=line_thin)

# handle 10 mrad thick line
d.multiline_text((image_center + (10 - 0.4) * pixels_per_mrad, image_center - 1.2 * pixels_per_mrad), "10", font=fnt, fill=(0, 0, 0))
d.line([
    (image_center + 10 * pixels_per_mrad, image_center - 0.5 * pixels_per_mrad),
    (image_center + 10 * pixels_per_mrad, image_center + 0.5 * pixels_per_mrad)
], fill=(0, 0, 0), width=line_thick)
d.multiline_text((image_center + (-10 - 0.4) * pixels_per_mrad, image_center - 1.2 * pixels_per_mrad), "10", font=fnt, fill=(0, 0, 0))
d.line([
    (image_center - 10 * pixels_per_mrad, image_center - 0.5 * pixels_per_mrad),
    (image_center - 10 * pixels_per_mrad, image_center + 0.5 * pixels_per_mrad)
], fill=(0, 0, 0), width=line_thick)

for y in range(1, 17):
    line_y = image_center + y * pixels_per_mrad
    # elev hash marks
    d.line([
        (image_center - 0.5 * pixels_per_mrad, line_y),
        (image_center + 0.5 * pixels_per_mrad, line_y)
    ], fill=(0, 0, 0), width=line_thin)
    if (y < 11):  # half marks
        d.line([
            (image_center - 0.1 * pixels_per_mrad, line_y + 0.5 * pixels_per_mrad),
            (image_center + 0.1 * pixels_per_mrad, line_y + 0.5 * pixels_per_mrad)
        ], fill=(0, 0, 0), width=line_thin)

    dot_count = 2
    if (y > 2): dot_count = 3
    if (y > 4): dot_count = 4
    if (y > 6): dot_count = 5
    for dot in range(1, dot_count + 1):
        d.ellipse([
            (image_center + (dot - 0.1) * pixels_per_mrad, line_y - 0.1 * pixels_per_mrad),
            (image_center + (dot + 0.1) * pixels_per_mrad, line_y + 0.1 * pixels_per_mrad)
        ], fill=(0, 0, 0))
        d.ellipse([
            (image_center + (-dot - 0.1) * pixels_per_mrad, line_y - 0.1 * pixels_per_mrad),
            (image_center + (-dot + 0.1) * pixels_per_mrad, line_y + 0.1 * pixels_per_mrad)
        ], fill=(0, 0, 0))
    if (y % 2 == 0):
        d.text((image_center + (dot_count + 0.85) * pixels_per_mrad, line_y - 0.3 * pixels_per_mrad), f"{y}", font=fnt, fill=(0, 0, 0))
        if (y >= 10): dot_count += 0.2
        d.text((image_center - (dot_count + 1.15) * pixels_per_mrad, line_y - 0.3 * pixels_per_mrad), f"{y}", font=fnt, fill=(0, 0, 0))

if (supersample > 1):
    out = out.resize((4096, 4096))


output_filename = f"mrad_{final_scale}_ca.png"
out.show()
out.save(output_filename)
print(f"written to {output_filename}")
