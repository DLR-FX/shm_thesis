% !TeX root = main.tex
%%==============================================================================
%%                            WZL LaTex Class
%%                                 V1.2
%%             project reports, bachelor theses, master theses
%%
%%------------------------------------------------------------------------------
%%
%% Class developed by:
%%
%% Amon Göppert (gpp)
%% Laboratory for Machine Tools and Production Engineering WZL | RWTH Aachen
%% Chair of Production Metrology and Quality Management
%% Department Model-based Systems
%% Group Metrology Assisted Assembly
%%
%% Production Engineering Cluster
%% Campus-Boulevard 30, 52074 Aachen | GERMANY
%% Phone: +49 241 80-20599
%% mailto: a.goeppert@wzl.rwth-aachen.de
%%
%%------------------------------------------------------------------------------
%%
%% Aachen, October 2019
%% based on LaTeX `book.cls'
%% This specific file is the class file, which is needs to be specified in the command \documentclass{}
%%
%%==============================================================================

%% ====== Class commands ======
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{WZLtemplate}[2019/08/15 Example LaTeX class]

%% 'sans' option
\DeclareOption{sans}{
	\renewcommand{\familydefault}{\sfdefault}	
}


%\ExecuteOptions{EN}

%% 'german' option
\DeclareOption{de}{
	\newcommand{\longlang}{ngerman}
	\newcommand{\shortlang}{de}
}
\DeclareOption{en}{
	\newcommand{\longlang}{english}
	\newcommand{\shortlang}{en}
}
\def\input@path{{\shortlang/}}


%\PassOptionsToClass{11pt}{book}

%\DeclareOption{de}{\PassOptionsToPackage{ngerman}{babel}}

%% Pass all unrecognized options to the base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions\relax
\LoadClass[twoside]{report}

\RequirePackage[greek,\longlang]{babel}


%TODO pass options to class

%\DeclareOption{en}{\PassOptionsToPackage{english}{babel}}
%\ProcessOptions\relax


%% Input encoding (enabling special characters)
\RequirePackage[utf8]{inputenc}

%% Font encoding (specifically for fonts)
\RequirePackage[T1]{fontenc}
%% Font type: Latin modern
\RequirePackage{lmodern}

%% Set page geometry
\RequirePackage[a4paper,
	left=2.5cm,
	right=2.5cm,
	top=2.5cm,
	bottom=2cm]
	{geometry}

%% Context sensitive quoting
\RequirePackage{csquotes}

%% Standard math packages
\RequirePackage[intlimits]{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

%% Enable bold font within math environments
\RequirePackage{bm}


%% Package for creating listing with \enumerate
\RequirePackage{enumerate}
\RequirePackage{enumitem}

%% Adjust line spacing
\linespread{1.5}

%% Header configurations:
%% Odd pages:
%%     left chapter name; right page number
%% Even pages:
%%     left page number; right section name
%% If no section is defined, the chapter name
%% is placed on even pages as well with markboth{}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter\ #1}{\thechapter\ #1}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\addtolength{\headheight}{\baselineskip}

\lhead[\fancyplain{}{\bfseries\thepage}]{\fancyplain{}{\bfseries\nouppercase\leftmark}}
\rhead[\fancyplain{}{\bfseries\nouppercase\rightmark}]{\fancyplain{}{\bfseries\thepage}}

%% To overwrite plain style evoked by chapter to get headers on pages where chapters start
\RequirePackage{etoolbox}
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}

%% Adjust spacings and formats of titles, sections, etc:
%% \titlespacing*{<command>}{<left>}{<before>}{<after>}[<right>]
\RequirePackage[bf]{titlesec}
\titlespacing*{\chapter}{0pt}{-30pt}{0pt}
\titlespacing*{\section}{0pt}{11pt}{0pt}
\titlespacing*{\subsection}{0pt}{6pt}{0pt}
\titleformat{\paragraph}{\normalfont\normalsize\bfseries}{\theparagraph}{0em}{}
\titlespacing*{\paragraph}{0pt}{11pt}{0pt}
\titleformat{\chapter}{\normalfont\huge\bfseries\raggedright}{\thechapter}{1em}{} 

%% Avoid inserting blank pages for making sure that a new chapter starts on an odd page
\renewcommand{\cleardoublepage}{\clearpage}

%% Set distance after paragraph
\setlength{\parskip}{8pt}

%% Remove indentation of footnotes
\usepackage[
    hang,
    flushmargin,
    ]{footmisc} 

%% Make links, cites, toc, etc. clickable
%% Adjust colors if desired
\RequirePackage[colorlinks=false,
linkcolor=black,
citecolor=black
]{hyperref}\RequirePackage{hyperref}
\renewcommand{\theHchapter}{\arabic{chapter}\thechapter}

%% add command for equation descriptions
\newenvironment{conditions}
  {\par\vspace{\abovedisplayskip}\noindent\begin{tabular}{>{$}l<{$} @{${}={}$} l}}
  {\end{tabular}\par\vspace{\belowdisplayskip}}


%% Add acronyms
%TODO comment nolist
\RequirePackage[
	printonlyused,
	%			withpage,
	%			smaller,
	%			nohyperlinks,
	nolist
	]{acronym}

\RequirePackage{emoji}
%% Required for including any kind of graphical images
\RequirePackage{graphicx}

\RequirePackage{subcaption}

%% For absolute placement of figures and creation of vector graphics
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{circuitikz}
\usetikzlibrary{shapes.geometric, arrows}


%% Strict placement of figures, tables, etc. referring to the tex source code
%% Usage: \begin{figure}[H]
\RequirePackage{float}

%% Alternative style of tables
\RequirePackage{booktabs}

%% Advanced table package for use-defined width definitions
\RequirePackage{tabularx}
\RequirePackage{wrapfig}


%% Defines a \FloatBarrier command, beyond which floats may not pass; useful, for example, to ensure all floats for a section appear before the next \section command. 
\RequirePackage[section]{placeins}

%% Placing captions within figure or table environments
%% Usage: \caption{Place your caption here.}
\RequirePackage{caption}
\captionsetup[figure]{
	labelfont=bf,
	justification=raggedright,
	singlelinecheck=false
}
%TODO \captionsetup[table]{labelfont=bf}


%% Set custom colours
%% RWTH colours 100 / 50 / 25 %
\RequirePackage{xcolor}
\definecolor{rwthblue100}{rgb}{0,84,159}
\definecolor{rwthblue75}{rgb}{65,127,183}
\definecolor{rwthblue50}{rgb}{142,186,229}
\definecolor{rwthblue25}{rgb}{199,221,242}
\definecolor{rwthblack100}{rgb}{0,0,0}
\definecolor{rwthblack75}{rgb}{100,101,103}
\definecolor{rwthblack50}{rgb}{156,158,159}
\definecolor{rwthblack25}{rgb}{207,209,210}

\definecolor{aliceblue}{HTML}{F0F8FF}


%% Use \todo{} for inline-todo notes
\RequirePackage[color=aliceblue]{todonotes}
\RequirePackage{regexpatch}
\makeatletter
\xpatchcmd{\@todo}{\setkeys{todonotes}{#1}}{\setkeys{todonotes}{inline,#1}}{}{}
\makeatother

%% Placement of table of contents, list of figures and list of tables
\RequirePackage[titles]{tocloft}
\renewcommand{\cfttoctitlefont}{}


%% Style for tableofcontents
\setlength{\cftbeforesecskip}{5pt}

%% Subliminal refinements towards typographical perfection 
\RequirePackage{microtype}

%% bibliography for defining macros in .tex-documents
%% processing backend: biber
%% further explanations: https://tex.stackexchange.com/a/299286
\RequirePackage[
	backend=biber,
	style=alphabetic,
	maxalphanames=1,
	isbn=true,
	url=false,
	giveninits=true,
	maxnames=10,
	%firstinits=true
	]{biblatex}
%% WZL citation style: 4 capital letters & short year
\DeclareLabelalphaTemplate{
	\labelelement{
		\field[final]{shorthand}
		\field{label}
		\field[strwidth=4,strside=left,uppercase=true]{labelname}
	}
	\labelelement{
		\field[strwidth=2,strside=right]{year}
	}
}

%% Bibliograph tweak: remove "+"-sign as an abbrevation for et. al
\renewcommand*{\labelalphaothers}{}

%% Avoid overfull hbox in bibliography
\emergencystretch=1em
%% No identation when a new paragraph starts
\setlength{\parindent}{0pt}

%% Sans serif font (comparable with Arial)
%\renewcommand{\familydefault}{\sfdefault}


%% @deprecated (reason=idx files not used)
% \makeindex

%% Insert current date and time
\usepackage{datetime}
\newdateformat{verbosedate}{\the\day. \monthname[\THEMONTH] \THEYEAR}

%% For inserting external PDFs
\RequirePackage{pdfpages}

%% For inserting tabulator environments
\RequirePackage{Tabbing}

%% TOC
\newcommand{\toc}{
	\pagenumbering{roman}
	\pagestyle{fancy}
	\renewcommand{\thechapter}{\Roman{chapter}}
	\newcounter{romancounter}
	\stepcounter{romancounter}
	\setlength{\cftchapnumwidth}{2em}
	\let\tmpcontentsname\contentsname
	\renewcommand{\contentsname}{\Roman{romancounter}\hspace{1.5em}\tmpcontentsname}
	\cleardoublepage\phantomsection\addcontentsline{toc}{chapter}{\contentsname}
	\renewcommand{\cftchapdotsep}{\cftdotsep}
	\tableofcontents
	\stepcounter{romancounter}
	\stepcounter{chapter}
	\newpage
}
%% LOFLOT - List of figures & list of tables
\newcommand{\loflot}{
	%% List of figures
	\stepcounter{romancounter}
	\let\tmplistfigurename\listfigurename
	\renewcommand{\listfigurename}{\Roman{romancounter}\hspace{1em}\tmplistfigurename}
	\cleardoublepage\phantomsection\addcontentsline{toc}{chapter}{\listfigurename}
	\listoffigures
	\newpage
	%% List of tables
	\stepcounter{romancounter}
	\let\tmplisttablename\listtablename
	\renewcommand{\listtablename}{\Roman{romancounter}\hspace{1em}\tmplisttablename}
	\cleardoublepage\phantomsection\addcontentsline{toc}{chapter}{\listtablename}
	\listoftables
	\newpage
	
	%% Start of main text
	\pagenumbering{arabic}
	\setcounter{page}{1}
	\setcounter{chapter}{0}
	\renewcommand{\thechapter}{\arabic{chapter}}
	
}


\newif\ifdraft

\drafttrue

\ifdraft
	\newcommand{\todo}[1]{\textcolor{purple}{[TODO] #1}}
	\newcommand{\revised}[1]{\textcolor{blue}{[Revise] #1}}
	\newcommand{\new}[1]{\textcolor{red}{#1}}
	\newcommand{\modified}[1]{\textcolor{orange}{#1}}
\else
	\newcommand{\todo}[1]{#1}
	\newcommand{\revised}[1]{#1}
	\newcommand{\new}[1]{#1}
	\newcommand{\modified}[1]{#1}
\fi


%% Reduce error messages for horz. & vert. overstretching of text
\hbadness=10001
\vbadness=10001


 
 \usepackage{blindtext}
 
\endinput
%% End of file