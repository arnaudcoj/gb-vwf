for %%f in (fonts/*.png) do python ../make_font.py fonts/%%~f fonts/%%~nf.vwf

rgbasm -Wall -Wextra -o vwf_config.o vwf_config.asm > charmap.asm
rgbgfx -h -o button.2bpp button.png
rgbgfx -o border_top.2bpp border_top.png
rgbgfx -o border_vert.2bpp border_vert.png
rgbgfx -o border_bottom.2bpp border_bottom.png
rgbasm -Wall -Wextra -o main.o main.asm
rgblink -d -n vwf.sym -m vwf.map -o vwf.gb vwf_config.o main.o
rgbfix -v -p 0xff -m 0x11 vwf.gb
del /Q /F /S "*.vwf" "*.2bpp" "*.o" charmap.asm
