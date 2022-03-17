\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{styrdokument}[2021/04/24 Fysikteknologsektionens styrdokument]

\LoadClass[11pt]{article}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[a4paper,tmargin=25mm,bmargin=28mm,lmargin=38mm,rmargin=28mm,headheight=16pt]{geometry}
\RequirePackage[swedish]{babel}
\RequirePackage{lmodern}
\RequirePackage[final]{microtype}
%\RequirePackage{parskip}
\RequirePackage{titlesec,chngcntr}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{epsfig}
\RequirePackage{xfrac}
\PassOptionsToPackage{hidelinks}{hyperref}
\AtEndPreamble{%
  \usepackage[hidelinks]{hyperref}
  \usepackage{cleveref}
}

\newcommand{\marginsecnumber}[1]{%
  %\makebox[0pt][r]{#1\hspace{6pt}}%
  \makebox[0pt][r]{#1\hspace{10pt}}%
}

\setcounter{secnumdepth}{4}
\titleformat{\section}
  {\normalfont\Large\bfseries}
  {\marginsecnumber\thesection}
  {0pt}
  {}
\titleformat{\subsection}
  {\normalfont\large\bfseries}
  {\marginsecnumber\thesubsection}
  {0pt}
  {}
\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries}
  {}
  {0pt}
  {}
\titleformat{\paragraph}[runin]
  {\normalfont\normalsize}
  {\marginsecnumber\theparagraph}
  {0pt}
  {}
\titlespacing{\paragraph}{0pt}{1.5ex plus .2ex}{0pt}
\counterwithout{paragraph}{subsubsection}
\counterwithin{paragraph}{subsection}
% \newcommand{\sectionbreak}{\clearpage}

\AtEndPreamble{
  \crefname{section}{kapitel}{kapitel}
  \crefname{subsection}{avsnitt}{avsnitt}
  % \crefname{subsubsection}{stycke}{stycken}
  \crefformat{paragraph}{#2\S#1#3}
  \crefrangeformat{paragraph}{\S\S#3#1#2--#5#2#6}
  \crefmultiformat{paragraph}{\S\S#2#1#3}{ och~#2#1#3}{, #2#1#3}{ och~#2#1#3}
}

\newcommand\?{%
    \paragraph{}%
}

\newlist{aligganden}{itemize}{1}
\setlist[aligganden]{label=\textbf{att}, labelsep=1.7ex, itemsep=-0.5ex, topsep=0.5ex}
\setlist[itemize]{itemsep=-0.5ex, topsep=0.5ex}

\fancyhead[L]{} %{\leftmark}
\fancyhead[R]{\textsc{Fysikteknologsektionens \lowercase\expandafter{\@title}}}
\fancyfoot[C]{\thepage{} (\pageref{LastPage})}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}

\def\@link{}
\newcommand\link[1]{\def\@link{#1}}
\newcommand\@titlepage{
\begin{flushleft}
  \vspace{2.5cm}
  \textsc{\Large Fysikteknologsektionen vid Chalmers Studentkår}
  
  \vspace{1.5cm}
  \textbf{\Huge\@title}
  
  \vspace{1cm}
  \begin{center}
      \includegraphics[width=10em]{sektionslogo.eps}
  \end{center}
  
  \vspace{1cm}
  \textsc{\@date}\\
  \@link
\end{flushleft}
}
%\newcommand\@titlepage{
%\begin{center}
%  \textbf{\Huge{\@title{} för}}\\[3mm]
%  \textbf{\Huge{Fysikteknologsektionen}}\\
%  \vspace{.7 cm}
%  \textbf{\Large{Chalmers Studentkår}}

%  \vspace{1.25em}
%  \includegraphics[width=10em]{sektionslogo.eps}
%  \vspace{1.25em}

%  \href{https://github.com/Fysikteknologsektionen/Stadga/commits/master}{\texttt{github.com/Fysikteknologsektionen/Stadga/}}\\[5mm]

%  \small{Göteborg}\\
%  \small{\@date}
%\end{center}
%}

\AfterEndPreamble{%
\thispagestyle{empty}%
\newgeometry{margin=2in}%
\@titlepage%
\clearpage\restoregeometry%
\setcounter{tocdepth}{2}%
\tableofcontents%
\clearpage%
}