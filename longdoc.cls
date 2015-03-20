\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{longdoc}[2015/03/20 Template for a long document based on KOMA.]

%%
% DISCLAIMER
% Large parts of this class code is based upon the LaTeX-KOMA-template package 
% by Karl Voit and Thomas Quaritsch, 
% https://github.com/novoid/LaTeX-KOMA-template
% https://github.com/tquaritsch/LaTeX-KOMA-template/
%%

% \makeatletter

\RequirePackage{ifpdf}
\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage{xifthen}

\SetupKeyvalOptions{
	family=LD,
	prefix=LD@
}

\DeclareStringOption[A4]{papersize}
\DeclareStringOption[twoside]{laterality}
\DeclareStringOption[false]{draft}
\DeclareStringOption[half]{parskip}
\DeclareStringOption[0mm]{BCOR}
\DeclareStringOption[12pt]{fontsize}
\DeclareStringOption[1.0]{linespread}
\DeclareStringOption[{ngerman,american}]{language}
\DeclareStringOption[authoryear]{biblatexstyle}
\DeclareStringOption[false]{biblatexdashed}
\DeclareStringOption[true]{biblatexbackref}
\DeclareStringOption[references-biblatex.bib]{bibfile}
\DeclareStringOption[{30,103,182}]{dispositioncolor}
\DeclareStringOption[true]{colorlinks}
\DeclareStringOption[Thesis_TU_Graz]{titlepage}
\DeclareStringOption{todonotesoptions}
\DeclareStringOption[alpha]{bibtexstyle}
\DeclareBoolOption[true]{addcolophon}
\DeclareBoolOption[false]{addlistoftodos}
\DeclareBoolOption{biblatex}
\DeclareComplementaryOption{bibtex}{biblatex}
%\DeclareStringOption[all]{compile}

\newboolean{LDaddcolophon}
\newboolean{LDusebiblatex}

% This section removes all known options from the @classoptionslist 
% passed on to other loaded packages and classes, which might have 
% problems parsing the argument values containing curly braces, e.g.
% for language or dispositioncolor
\def\sa@classoptionslist{}
\DeclareDefaultOption{%
  \xdef\sa@classoptionslist{\sa@classoptionslist,\CurrentOption}%
}
\ProcessKeyvalOptions*\relax
\let\@classoptionslist\sa@classoptionslist
% end


\PassOptionsToClass{
	fontsize=\LD@fontsize, %% size of the main text
	%paper=\LD@papersize,  %% paper format
	parskip=\LD@parskip,  %% vertical space between paragraphs (instead of indenting first par-line)
	DIV=calc,            %% calculates a good DIV value for type area; 66 characters/line is great
	%headinclude=true,    %% is header part of margin space or part of page content?
	%footinclude=false,   %% is footer part of margin space or part of page content?
	open=right,          %% "right" or "left": start new chapter on right or left page
	appendixprefix=true, %% adds appendix prefix; only for book-classes with \backmatter
	bibliography=totoc,  %% adds the bibliography to table of contents (without number)
	draft=\LD@draft,      %% if true: included graphics are omitted and black boxes
	                     %%          mark overfull boxes in margin space
	BCOR=\LD@BCOR,        %% binding correction (depends on how you bind
	                     %% the resulting printout.
	\LD@laterality,        %% oneside: document is not printed on left and right sides, only right side
	                     %% twoside: document is printed on left and right sides
	numbers=noendperiod,
        twoside=semi
}{scrbook}

\LoadClass{scrbook}


\def\LDcolorlinks{\LD@colorlinks}
\def\LDbibfile{\LD@bibfile}
\def\LDbibtexstyle{\LD@bibtexstyle}

%\ifLD@draft
%	\def\LD@draft{true}
%\else
%	\def\LD@draft{false}
%\fi

\ifLD@addcolophon
	\setboolean{LDaddcolophon}{true}
\else
	\setboolean{LDaddcolophon}{false}
\fi

\ifLD@biblatex
	\setboolean{LDusebiblatex}{true}
\else
	\setboolean{LDusebiblatex}{false}
\fi

\def\LDinsertauthor{}
\newcommand{\LDauthor}[1]{\def\LDinsertauthor{#1}}

\def\LDinserttitle{}
\newcommand{\LDtitle}[1]{\def\LDinserttitle{#1}}

\def\LDinsertsubject{}
\newcommand{\LDsubject}[1]{\def\LDinsertsubject{#1}}

\def\LDinsertkeywords{}
\newcommand{\LDkeywords}[1]{\def\LDinsertkeywords{#1}}

\def\LDinsertworktitle{}
\newcommand{\LDworktitle}[1]{\def\LDinsertworktitle{#1}}

\def\LDinsertgrade{}
\newcommand{\LDgrade}[1]{\def\LDinsertgrade{#1}}

\def\LDinsertstudy{}
\newcommand{\LDstudy}[1]{\def\LDinsertstudy{#1}}

\def\LDinsertuniversity{}
\newcommand{\LDuniversity}[1]{\def\LDinsertuniversity{#1}}

\def\LDinsertinstitute{}
\newcommand{\LDinstitute}[1]{\def\LDinsertinstitute{#1}}

\def\LDinsertinstitutehead{}
\newcommand{\LDinstitutehead}[1]{\def\LDinsertinstitutehead{#1}}

\def\LDinsertsupervisor{}
\newcommand{\LDsupervisor}[1]{\def\LDinsertsupervisor{#1}}

\def\LDinsertcosupervisor{}
\newcommand{\LDcosupervisor}[1]{\def\LDinsertcosupervisor{#1}}

\def\LDinsertevaluator{}
\newcommand{\LDevaluator}[1]{\def\LDinsertevaluator{#1}}

\def\LDinserthomestreet{}
\newcommand{\LDhomestreet}[1]{\def\LDinserthomestreet{#1}}

\def\LDinserthometown{}
\newcommand{\LDhometown}[1]{\def\LDinserthometown{#1}}

\def\LDinserthomepostalnumber{}
\newcommand{\LDhomepostalnumber}[1]{\def\LDinserthomepostalnumber{#1}}

\def\LDinsertsubmissionmonth{}
\newcommand{\LDsubmissionmonth}[1]{\def\LDinsertsubmissionmonth{#1}}

\def\LDinsertsubmissionyear{}
\newcommand{\LDsubmissionyear}[1]{\def\LDinsertsubmissionyear{#1}}

\def\LDinsertsubmissiontown{}
\newcommand{\LDsubmissiontown}[1]{\def\LDinsertsubmissiontown{#1}}

\def\LDinsertid{}
\newcommand{\LDid}[1]{\def\LDinsertid{#1}}

\def\LDinsertlecture{}
\newcommand{\LDlecture}[1]{\def\LDinsertlecture{#1}}

% HACK, apparently, this package must be loaded before some other package 
% down below, not necessary in the standard tugthesis.cls file!
% \usepackage[color,leftbars]{changebar}

%% ========================================================================
%%%% Hyperref Settings
%% ========================================================================

\pdfcompresslevel=9

\PassOptionsToPackage{%
	%a4paper=true, %
	% pdftex=true, %
	backref, %
	pagebackref=false, % creates backward references too
	bookmarks=true, %
	bookmarksopen=true, % when starting with AcrobatReader, the Bookmarkcolumn is opened
	pdfpagemode=UseNone,% None, UseOutlines, UseThumbs, FullScreen
	plainpages=false, % correct, if pdflatex complains: ``destination with same identifier already exists''
	%% colors: https://secure.wikimedia.org/wikibooks/en/wiki/LaTeX/Colors
	urlcolor=DispositionColor, %%
	linkcolor=DispositionColor, %%
	% pagecolor=DispositionColor, %%
	citecolor=DispositionColor, %%
	anchorcolor=DispositionColor, %%
	% colorlinks=off,
	% hidelinks,
	colorlinks=\LDcolorlinks, % turn on/off colored links (on: better for
	                          % on-screen reading; off: better for printout versions)
}{hyperref}

\RequirePackage{hyperref}

%\DeclareGraphicsExtensions{.pdf}

%% ========================================================================
%%%% Additional Packages
%% ========================================================================

\usepackage[utf8]{inputenc} %% UTF8 as input characters

\usepackage[\LD@language]{babel}  

\usepackage{scrpage2} %%  advanced page style using KOMA

\ifthenelse{\boolean{LDusebiblatex}}{

	\RequirePackage[backend=biber, %% using "biber" to compile references (instead of "biblatex")
	style=\LD@biblatexstyle, %% see biblatex documentation
	%style=alphabetic, %% see biblatex documentation
	% dashed=\LD@biblatexdashed, %% do *not* replace recurring reference authors with a dash
	backref=\LD@biblatexbackref, %% create backlings from references to citations
	natbib=true, %% offering natbib-compatible commands
	hyperref=true, %% using hyperref-package references
	useprefix=true,
	sortcites=true,
	maxnames=6,
	minnames=2,
	mincrossrefs=99,
	firstinits=true,
	]{biblatex}

	\addbibresource{\LD@bibfile} %% remove, if using BibTeX instead of biblatex

	% use a customization for superscript ordinal numbers in the bibliography
	\DeclareLanguageMapping{english}{template/custom-english-ordinal-sscript}

	% clear some fields from the bibtex file completely
	\DeclareSourcemap{ 
	  \maps[datatype=bibtex]{ 
	    \map{ 
	       \step[fieldset=note, null] 
	       \step[fieldset=month, null] 
	    } 
	  } 
	}
	 % Clean up the bibtex rather than editing it
	\newcommand{\mycleanupbibentries}{%
		\ifentrytype{proceedings}{}{% 
			% remove some fields /except/ for proceedings
			\clearfield{publisher}%
			\clearname{editor}%
			\clearlist{organization}%
			\clearlist{location}%
			% \clearfield{isbn}%
			% \clearfield{series}%
			% \clearfield{volume}%
			% \clearlist{publisher}%
			\clearfield{urldate}%
		 }%
		 \iffieldequalstr{entrykey}{npqw13}{%
		 	\setcounter{maxnames}{4}%
		 }{}%
	}

	\AtEveryBibitem{\mycleanupbibentries}
	\AtEveryCitekey{\mycleanupbibentries}

	\DeclareFieldFormat
	  [article,inbook,incollection,inproceedings,patent,thesis,unpublished]
	  {title}{\textbf{#1\isdot}}

	\renewbibmacro*{volume+number+eid}{%
	  \printfield{volume}%
	%  \setunit*{\adddot}% DELETED
	  % \setunit*{\addnbspace}% NEW (optional); there's also \addnbthinspace
	  \printfield{number}%
	  \setunit{\addcomma\space}%
	  \printfield{eid}}
	\DeclareFieldFormat[article]{number}{/#1}


}{
	% just a quick hack in order to compile the template text correctly
	\let\textcite\cite
	\let\footcite\cite
	\let\citeauthor\cite
}


\usepackage[pdftex]{graphicx}


\usepackage{ifthen}

\usepackage{xspace}

\usepackage[usenames,dvipsnames]{xcolor}
\def\mycolor{\LD@dispositioncolor}
\definecolor{DispositionColor}{RGB}{\mycolor} %% used for links and so forth in screen-version

%doc% This package offers strikethrough command \verb+\sout{foobar}+.
\usepackage[normalem]{ulem}

\usepackage{framed}

\usepackage{eso-pic} %%

\usepackage[inline]{enumitem} %%

\usepackage[\LD@todonotesoptions]{todonotes}  %% option "disable" removes all todonotes output from resulting document

\usepackage{units}



\ifthenelse{\boolean{LDusebiblatex}}{
\defbibheading{bibliography}[\bibname]{%
  \chapter{#1}}%
% \markboth{#1}{#1}}
}{}

\newcommand{\LDinsertbibliography}{
		\ifthenelse{\boolean{LDusebiblatex}}{
		\printbibliography              %% remove, if using BibTeX instead of biblatex
	}{
		\bibliographystyle{\LDbibtexstyle}
		\bibliography{\LDbibfile}
	}
}

% \ifthenelse{\equal{\LD@compile}{auto}}{
% 	\ifthenelse{\equal{\jobname}{\detokenize{main}}}{
% 		\def\LD@compile{current}
% 	}{
% 		\def\LD@compile{all}
% 	}
% }

%% ========================================================================
%%%% MISC command definitions
%% ========================================================================


%% \myclone[x]{text}
\newcounter{myclonecnt}
\newcommand{\myclone}[2][2]{%
  \setcounter{myclonecnt}{#1}%
  \whiledo{\value{myclonecnt}>0}{#2\addtocounter{myclonecnt}{-1}}%
}



%% ========================================================================
%%%% Typographic settings
%% ========================================================================

\usepackage[protrusion=true,factor=900]{microtype}


\frenchspacing  %% Macro to switch off extra space after punctuation.

\DeclareRobustCommand{\myacro}[1]{\textsc{\lowercase{#1}}}%%  abbrevations using small caps


\setheadsepline{.4pt}[\color{DispositionColor}]
\renewcommand{\headfont}{\small\normalfont\color{DispositionColor}}
\renewcommand{\pnumfont}{\small\normalfont\color{DispositionColor}}
\addtokomafont{disposition}{\color{DispositionColor}}
% \addtokomafont{caption}{\color{DispositionColor}\footnotesize}
\addtokomafont{caption}{\small}
\addtokomafont{chapter}{\color{DispositionColor}}
\addtokomafont{captionlabel}{\color{DispositionColor}\bfseries}

% \renewcommand{\emph}[1]{{\color{DispositionColor}\textit{#1}}}

\usepackage[explicit]{titlesec}
\titleformat{\chapter}[hang]%
	{\acresetall\sffamily\bfseries\color{DispositionColor}}% format
	% {\fontsize{80pt}{0pt}\selectfont\thechapter}% label
	{\raisebox{-6pt}{\tikz{\node[fill=DispositionColor,inner sep=6pt]{\color{white}\fontfamily{hls}\fontsize{85pt}{0pt}\selectfont\thechapter};}}}
	{25pt}% separation
	{%
	  %\fbox{%
	  	\fontfamily{hls}
		\fontsize{20pt}{23pt}\selectfont
		\begin{minipage}[b]{10cm}%
			\raggedright{#1}%
		\end{minipage}%
	 %}
	}% before
	% [\vspace*{-10pt}\rule{\textwidth}{5pt}] %after


% \newcommand{\chapterbreak}{\cleardoublepage}

\addtokomafont{disposition}{\fontfamily{hls}\selectfont}
\addtokomafont{title}{\fontsize{20pt}{24pt}\fontfamily{hls}\selectfont}

\usepackage[inline]{enumitem} %%
\setlist{noitemsep}   %% kills the space between items


\usepackage[babel=true,strict=true,english=american,german=guillemets]{csquotes}


\linespread{\LD@linespread}  %% line spread


\newcommand{\LDmyLaT}{\LaTeX{}@TUG\xspace} %% LaTeX@TUG text "logo"

%% ========================================================================
%%%% MISC usepackages
%% ========================================================================

%% ... it's OK to put here your own usepackage commands ...
% \usepackage[absolute]{textpos}
% \usepackage[pass]{geometry}
\usepackage{changepage}

%% ========================================================================
%%%% MISC self-defined commands and settings
%% ========================================================================

%% ... it's OK to put here your own newcommand/newenvironment-definitions ...

\setcounter{secnumdepth}{3}
% \setcounter{secnumdepth}{4}



\raggedbottom
\usepackage[all,defaultlines=3]{nowidow}

\usetikzlibrary{shapes,shapes.multipart}


%% without small-caps
\newcommand{\acrofm}[1]{\textrm{#1}}
\newcommand{\acrohl}[1]{{\color{DispositionColor}{\textrm{#1}}}}
\newcommand{\upcasevar}[1]{\acrofm{\upshape{}#1}}
\newcommand{\upcasevarx}[1]{{\upcasevar{#1}}\xspace}
\newcommand{\name}[1]{\textrm{#1}}


\newcommand{\highlight}[1]{{\color{DispositionColor}{#1}}}


\usepackage[smaller,withpage,printonlyused,nohyperlinks]{acronym}
\renewcommand*{\acsfont}[1]{\acrofm{#1}}
\renewcommand*{\acffont}[1]{\highlight{#1}}

%% end acronyms

\newcommand{\acr}{\protect\@acr}%
\newcommand{\@acr}[1]{%
    \expandafter\ifx\csname ac@#1\endcsname\AC@used
        \acs{#1}%
    \else
        \acs{#1} (\acl{#1})%
        \global\expandafter\let\csname ac@#1\endcsname\AC@used
        \AC@addtoAC@clearlist{#1}%
        \AC@logged{#1}
    \fi
}


\usepackage{setspace}

\usepackage[T1]{fontenc}			% needed for lucida bright
\usepackage{textcomp}				% needed for oldstylenums




% \usepackage[altbullet]{lucidabr}	% activates lucida bright
% \DeclareEncodingSubset{TS1}{hlh}{1}	% enables \oldstylenums{123}
%% \renewcommand{\rmdefault}{hlh}
%% \renewcommand{\sfdefault}{hls}
%% \renewcommand{\ttdefault}{hlst}
%% \renewcommand{\bfdefault}{b}
% \renewcommand{\rmdefault}{hlhj}	 	% uses old-style numbers by default

% \usepackage{palatino}


% \usepackage{lmodern} % better alternative to default computer-modern
% \usepackage{eco}	% enables old-style-figures for latin-modern/computer-modern

% \usepackage[bitstream-charter]{mathdesign}

% \usepackage[osf]{ebgaramond} % free garamond version, no math/sc/osf
% \usepackage{fourier}

% \usepackage[osf]{mathpazo} % Palatino with smallcaps and oldstyle numbers
% \usepackage[scaled]{helvet} % Helvetica, scaled 95%

% \usepackage{newpxtext}
% \usepackage{newpxmath}
% \useosf % old-style figures in text, not in math


% \renewcommand{\rmdefault}{cmr}
% \renewcommand{\sfdefault}{cmss}
% \renewcommand{\sfdefault}{hls}


% using exotic lucida fonts in text:
% {\fontfamily{hlcw}\selectfont asdf} % handwriting
% {\fontfamily{hlce}\selectfont asdf} % calligraphy italic
% {\fontfamily{hlcn}\selectfont asdf} % casual

% \usepackage[xcolor,leftbars]{changebar}
% \setlength{\changebarsep}{-3pt}
% \setlength{\changebarwidth}{1pt}

\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{thmtools}
\usepackage{amssymb}

% uses some variant of palatino with better support for math fonts, 
% symbols, old-style-figures, ams math, 
\usepackage{newpxtext}
\usepackage{newpxmath}
% \usepackage[varg,cmintegrals,bigdelims]{newpxmath}
% \usepackage[scr=rsfso]{mathalfa}% \mathscr is fancier than \mathcal
\useosf % old-style figures in text, not in math
\def\disableosf{\fontfamily{zplx}\selectfont}

%%%% this fixes a footnote-bug in newpxtext appearing in tcolorboxes
%%%% solution due to http://tex.stackexchange.com/questions/153007/newpx-package-introduces-blank-space-after-footnote
\makeatletter
\def\f@@tn@te{footnote}%
\def\@makefnmark{%
  \ifx\@mpfn\f@@tn@te%
    \ifx\thefootnote\orig@footnote%
      \hbox{\sustyle\hspace*{.04em}\@thefnmark}%
    \else%
      \orig@makefnmark%
    \fi%
  \else%
    \orig@makefnmark%
  \fi}%
\makeatother
%%%% end bugfix

\usepackage[small]{complexity}

\newtheoremstyle{blue}% name
	{12pt}% Space above
	{6pt}% Space below
	{}% Body font
	{}% Indent amounti
	{\color{DispositionColor}\bfseries}% Theorem head font
	{:}% Punctuation after theorem head
	{.5em}% Space after theorem head
	{}% Theorem head spec (can be left empty, meaning `normal')

\theoremstyle{blue}
\newtheorem{definition}{Definition}[chapter]
\newtheorem{proposition}{Proposition}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}{Lemma}[chapter]
\newtheorem{corollary}{Corollary}[chapter]

\setlist[enumerate]{font=\color{DispositionColor}}
\setlist[itemize]{font=\color{DispositionColor}}
\setlist[itemize,1]{label=\raisebox{0.3ex}{\tikz{\fill (0,0) rectangle (0.6ex,0.6ex);}}}


%%%
%% Example Environment
%%%

% NOTE: changebar package is included earlier in tugthesis.cls (HACK!)
% \setlength{\changebarsep}{-5pt}
% \setlength{\changebarwidth}{2pt}
% \cbcolor{DispositionColor}

\newcounter{example}[chapter]
\renewcommand{\theexample}{\thechapter.\arabic{example}}
\newenvironment{example}%
{%
	% \list{}{%
		% \leftmargin0mm%
		% \rightmargin0mm%
	% }
	% \item\relax%
	% \fontfamily{hlcn}\selectfont%
	\vskip1ex
	% \begin{changebar}
	\begin{tcolorbox}[arc=0mm,colback=DispositionColor!10,boxrule=0mm,colframe=DispositionColor!10,breakable]%
	\refstepcounter{example}{{\mbox{\bfseries\color{DispositionColor}Example~\theexample:}}}
}%
{
	% \end{changebar}%
	\end{tcolorbox}
	% \endlist%
	% \rm%
}%
\newcommand{\exampleskip}{\vspace*{-2em}}

% use this to continue a previous example, use 
%    \begin{examplecont}{label-of-original-example}
\newenvironment{examplecont}[1]
{%
	% \list{}{%
		% \leftmargin8mm%
		% \rightmargin0mm%
	% }
	% \item\relax%
	% \fontfamily{hlcn}\selectfont%
	\vskip1ex
	\begin{tcolorbox}[arc=0mm,colback=DispositionColor!10,boxrule=0mm,colframe=DispositionColor!10,breakable]%
	{{\mbox{\bfseries\color{DispositionColor}Example~\ref{#1} {\rm(Continued)}:}}}
	% \begin{changebar}
}%
{
	% \end{changebar}%
	\end{tcolorbox}
	% \endlist%
	% \rm%
}%

\newenvironment{todobox}{
	\begin{tcolorbox}[arc=2mm,colback=Dandelion,boxrule=0mm,colframe=white,breakable]
}{
	\end{tcolorbox}
}

% to disable oldstylenums if needed
\newcommand{\uprightnums}[1]{{\fontfamily{hlh}\selectfont #1}}


\usepackage{booktabs}
\usepackage{tabu}
\taburulecolor{DispositionColor}

\usepackage{tcolorbox}	% e.g. for example blocks
\tcbuselibrary{breakable}

% figures inside example blocks cannot/shouldn't float, so we use this
% instead, note that you need to put a \captionof command somewhere to get 
% a caption
\newenvironment{fakefigure}{
	\vskip1ex
        \setcounter{subfigure}{0}
	\begin{center}
		\begin{minipage}{\linewidth}%
}{
		\end{minipage}
	\end{center}
	% \vskip1ex
}




\DeclareMathOperator{\ld}{ld}

\usepackage[font+=small]{subcaption}
\captionsetup{subrefformat=parens}

\usepackage{tikz-timing}
\usepackage{multirow}
\usepackage{listings}
\usetikzlibrary{arrows,positioning,shapes}
\usepackage{tikz-qtree}


\lstdefinestyle{text}{basicstyle={\scriptsize\ttfamily},
numbers=left,tabsize=4,showspaces=false,showstringspaces=false,stepnumber=1,
captionpos=b,frame=none,stringstyle={\slshape\color{textcolor}},aboveskip=\bigskipamount,
commentstyle=\color{darkgreen},breaklines=true,backgroundcolor=\color{DispositionColor!10}}

\usepackage[ruled,vlined,linesnumbered]{algorithm2e} 
\setlength{\algomargin}{1.5em}
\SetKwInOut{Requires}{Requires}
\SetKwInOut{Input}{Input}
\SetKwInOut{Output}{Output}
\SetKwProg{Function}{Function}{:}{}
\SetKw{To}{to}
\SetKw{In}{$\in$}
\DontPrintSemicolon
\SetCommentSty{emph}
\SetKwIF{If}{ElseIf}{Else}{if}{:}{else if}{else}{}%



\usepackage{pifont}% http://ctan.org/pkg/pifont
\newcommand{\cmark}{\textrm{\ding{51}}}%
\newcommand{\xmark}{\textrm{\ding{55}}}%
\renewcommand{\checkmark}{\fbox{\texttt{use \textbackslash{}cmark!}}}

%\usepackage{bussproofs} % for tree-style natural deduction proofs

\graphicspath{{figures/}}

\newenvironment{chapternotes}{
	\slshape
}{
	%
}

\usepackage{rotating}

\usepackage{import}


% this is used in gnuplot-generated .tex files and sets up font in 10pt
% with lining figures for the graphs
\def\graphpreamble{\fontfamily{zplx}\fontsize{10}{12}\selectfont}

\usepackage{cancel}
\usepackage{bm}

\DeclareMathAlphabet{\mathbfsf}{\encodingdefault}{\sfdefault}{bx}{n}
\newcommand{\headmath}[1]{\bm{\mathbfsf{#1}}}

\usepackage[mathscr]{eucal}

\renewcommand{\vec}[1]{\mathbf{#1}}

\allowdisplaybreaks

\newlist{enumi}{enumerate*}{1}
\setlist*[enumi,1]{label=\color{DispositionColor}{(\alph*)}}




\usepackage{tabularx}



\usepackage{dcolumn}
\newcolumntype{/}{D{/}{/}{-1}}

\usepackage{verbatim} % for the comment environment for orgtables, because the verbatim package does not like indentation!

\newcommand{\mypresup}[2]{\hskip1pt^{#1\hskip-1pt}{#2}}

\usepackage{afterpage}

% \urlstyle{same} % does not use typewriter font but same font as surrounding text

%% fixes the kerning for the double slash (//) in URLs
% \makeatletter%
% \def\Url@twoslashes{\mathchar`\/\@ifnextchar/{\kern-.2em}{}}%
% \g@addto@macro\UrlSpecials{\do\/{\Url@twoslashes}}%
% \makeatother%

%% stolen from http://tex.stackexchange.com/a/98473
\makeatletter
% nice "//"
\newcommand{\twobar}{/\kern-0.2em/}
% store original \Url@acthash
\let\orig@Url@acthash\Url@acthash
% make new \Url@acthash that acts "//" as well
\let\new@Url@acthash\Url@acthash
\g@addto@macro{\new@Url@acthash}{\Url@Edit\Url@String{//}{\twobar}}
% make \urlstyle use the original \Url@acthash
\let\orig@urlstyle\urlstyle
\def\urlstyle{\let\Url@acthash\orig@Url@acthash\orig@urlstyle}
% make selected url styles use the new \Url@acthash
\g@addto@macro{\url@rmstyle}{\let\Url@acthash\new@Url@acthash}
\g@addto@macro{\url@sfstyle}{\let\Url@acthash\new@Url@acthash}
\makeatother

\urlstyle{rm}

\makeatletter

\AtBeginDocument{
		
		\hypersetup{
			pdftitle={\LDinserttitle}, %
			pdfauthor={\LDinsertauthor}, %
			pdfsubject={\LDinsertsubject}, %
			pdfcreator={Accomplished with: pdfLaTeX, biber, and hyperref-package. No anmimals, MS-EULA or BSA-rules were harmed.},
			pdfproducer={\LDinsertauthor},
			pdfkeywords={\LDinsertkeywords},
		}

		\frontmatter                    %% KOMA: roman page numbers and such; only available in scrbook

		\input{00-1-colophon}                %% defines information about editor, LaTeX, font, ...

		%% Choose your desired title page:
		\input{template/\LD@titlepage}            %% include title page


		\input{template/declaration}  %% Statutory Declaration
		% \input{thanks}                %% this is a suggestion: you have to create this file on demand
		% \input{foreword}              %% this is a suggestion: you have to create this file on demand


		% \makeatletter
		% \def\cleardoublepage{\clearpage\ifodd\else\c@page\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi}
		% \makeatother

		%% include the abstract without chapter number but include it on table of contents:
		\cleardoublepage
		
		\include{00-2-abstract}              %% Abstract

		{
			%\fontfamily{hls}\selectfont
			\begin{spacing}{1.15}
			\tableofcontents                %% this produces the table of contents - you might have guessed :-)
			\end{spacing}
		}

		%\listoffigures

		%% if myaddlistoftodos is set to "true", the current list of open todos is added:
		\ifLD@addlistoftodos
		  \newpage\listoftodos          %% handy if you are using todonotes with \todo{}
		\fi                             %% with todonotes-package option "disable" you can get rid of any todo in the output

		\mainmatter                     %% KOMA: marks main part using arabic page numbers and such; only available in scrbook

}

\makeatother


% \newcommand{\True}{\ensuremath{\top}}
% \newcommand{\False}{\ensuremath{\bot}}
% 
% \newcommand		{\lequiv}	{\ensuremath{\leftrightarrow}}
% \newcommand		{\limpl}	{\ensuremath{\rightarrow}}
% \newcommand		{\lxor}		{\ensuremath{\oplus}}
% \newcommand		{\lbar}[1]	{\overline{#1}}
% \newcommand		{\lbigand}	{\bigwedge}
% \newcommand		{\lbigor}	{\bigvee}
% \newcommand		{\entails}	{\vdash}

\hyphenation{ex-am-ple hy-phen-ate}  %% in order to use German umlauts