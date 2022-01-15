FROM debian
RUN apt-get update
RUN apt-get install -y curl git make texlive-latex-base texlive-extra-utils imagemagick info-beamer wiki2beamer texlive-lang-all texlive-font-utils texlive-fonts-extra xpdf
RUN sed -E -i 's:(</policymap>):  <policy domain="coder" rights="read|write" pattern="PDF" />\n\1:' /etc/ImageMagick-6/policy.xml
RUN git clone https://github.com/austama/austama /austama
WORKDIR /austama