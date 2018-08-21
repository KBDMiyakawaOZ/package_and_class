set path=x:\TeX_Protection\texlive\2015\bin\win32;%path%
rem platex --synctex=1 toukeigaku-sample.tex
rem dvipdfmx toukeigaku-sample.dvi

platex --synctex=1 sample.tex
dvipdfmx sample.dvi


