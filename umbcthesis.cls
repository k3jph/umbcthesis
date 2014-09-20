% umbcthesis.sty -- derived from csmthesis.sty by
% James P. Howard, II
%
% csmthesis.sty --- Adjustments to report style, 12pt option
% to produce a Colorado School of Mines graduate thesis.
% Use with \documentstyle[12pt,csmthesis]{report}
% Craig Artley, Colorado School of Mines, 08/12/92
% Copyright 1992, Craig T. Artley
\ProvidesClass{umbcthesis}
\typeout{University of Maryland Baltimore County Thesis and Dissertation Class}
\LoadClass[letterpaper,final,12pt]{report}

\usepackage{courier}
\usepackage{draftwatermark}
\usepackage{geometry}
\usepackage{helvet}
\usepackage{setspace}
\usepackage{times}
\usepackage{xspace}
\usepackage{ifthen}
\usepackage[acronym,smallcaps,toc,nomain,nonumberlist]{glossaries}
\usepackage{float}

\SetWatermarkLightness{1}
\SetWatermarkText{}

\newif\if@abstract
\@abstractfalse
\newif\if@proposal
\@proposalfalse

\def\@dissName {Thesis}
\DeclareOption{phd}{\def\@degree {Doctor of Philosophy} \def\@dissName {Dissertation}}
\DeclareOption{ma}{\def\@degree {Master of Arts}}
\DeclareOption{mfa}{\def\@degree {Master of Fine Arts}}
\DeclareOption{mpp}{\def\@degree {Master of Public Policy}}
\DeclareOption{ms}{\def\@degree {Master of Science}}
\DeclareOption{proposal}{\@proposaltrue}
\DeclareOption{draft}{\SetWatermarkText{DRAFT} \SetWatermarkLightness{.9}}
\DeclareOption{abstract}{\@abstracttrue}

\DeclareOption*{\PackageWarning{umbcthesis}{Unknown `\CurrentOption'}}
\ProcessOptions

\renewcommand\doublespacing{\setstretch{2.0}}

\geometry{verbose, letterpaper, dvips, tmargin=1in, lmargin=1.5in, rmargin=1in, bmargin=1in, headsep=12pt}

\def\@makeschapterhead#1{            % Heading for \chapter* command
  \vspace*{50pt}                     % Space at top of page.
  { \parindent 0pt \raggedright
    \Large \bf \centering       % Title.
    \MakeUppercase{#1}\par
    \nobreak                         % TeX penalty to prevent page break.
    \vskip 40pt                      % Space between title and text.
    \glsresetall[acronym]
  } }

\def\@makechapterhead#1{             % Heading for \chapter command
  \vspace*{50pt}                     % Space at top of text page.
  { \parindent 0pt \raggedright
    \ifnum \c@secnumdepth >\m@ne     % IF secnumdepth > -1 THEN
    \normalsize\bf\centering \MakeUppercase{\@chapapp{}} \thechapter
    \par
    \vskip 20pt \fi                % Space between number and title.
    \Large\bf                      % Title.
    \MakeUppercase{#1}\par
    \nobreak                         % TeX penalty to prevent page break.
    \vskip 40pt                      % Space between title and text.
    \glsresetall[acronym]
  } }

\newcommand\advisor[1]{\def\@UMBCadvisor {#1}}
\newcommand\advisortitle[1]{\def\@UMBCadvisortitle {#1}}
\newcommand\dept[1]{\def\@UMBCdept {#1}}
\newcommand\keywords[1]{\def\@UMBCkeywords {#1}}
\newcommand\subjects[1]{\def\@UMBCsubjects {#1}}
\newcommand\nopagenumbers{\pagestyle{empty}\thispagestyle{empty}}
\newcommand\blankpage{\clearpage\null\thispagestyle{empty}}
\newcommand\preliminarymatter{\pagenumbering{alph} \pagestyle{empty}}
\newcommand\frontmatter{\pagestyle{plain}\pagenumbering{roman} \setcounter{page}{1}}
\newcommand\mainmatter{\cleardoublepage \pagenumbering{arabic} \pagestyle{myheadings} \markright{}}
\newcommand\backmatter{\appendix\def\thepart{}\def\partname{}}
\newcommand\oneappendix{\def\thechapter{}}

\newcommand\makemetadata{
  \hypersetup{
    pdftitle={\@title},
    pdfauthor={\@author},
    pdfsubject={\@UMBCsubjects},
    pdfkeywords={\@UMBCkeywords}}
}

\renewcommand\maketitle{
  \if@abstract
  \singlespace
  \begin{center}
    Dissertation Proposal Abstract \\
    \@UMBCdept \\
    University of Maryland Baltimore County \\
    \vspace{1.667ex}
    \@title\\
    \vspace{1.667ex}
    \@author\\
    \vspace{1.667ex}
    \@UMBCadvisor\\
    \vspace{1.667ex}
    \@date
  \end{center}
  \doublespace
  \else
  \begin{titlepage}
    \null\vspace{1in}
    \begin{center}
	  \pdfbookmark{Title}{Title}
      \MakeUppercase{\@title} \\
      \vspace{2in}
      by \\
      \@author
      \vspace{2in}
      \begin{singlespace}
	  \if@proposal
	  	\@dissName\ proposal \\
	  \else
        \@dissName\ submitted to the Faculty of the Graduate School of the \\
        University of Maryland Baltimore County in partial fulfillment \\
        of the requirements for the degree of \\
        \@degree \\
	  \fi
        \@date
      \end{singlespace}
    \end{center}
  \end{titlepage}
  \fi
}

\newcommand\makecopyright{%
  \begin{titlepage}
    \mbox{}\vspace{7.5in}
    \begin{center}
      Copyright \copyright~\@date~\@author.
    \end{center}
  \end{titlepage}
}

\newcommand\makebibliography{%
  \clearpage
  \label{back:biblio}
  \renewcommand{\bibname}{Bibliography}
  \defbibheading{bibliography}{%
    \chapter*{\bibname}%
    \addcontentsline{toc}{chapter}{\bibname}%
    \thispagestyle{plain}%
    \markright{}}
  \printbibliography
}

\newcommand\makeapprovalsheet{%
  \begin{titlepage}
    \pdfbookmark{Approval Sheet}{Approval Sheet}
    \chapter*{Approval Sheet}
    \nopagenumbers
	\singlespacing
    \begin{tabbing}
      {\bf Name of Candidate:  } \= \kill
      {\bf Title of \@dissName:} \> \@title \\ \\
      {\bf Name of Candidate:} \> \@author \\
	  						   \> \@degree, \@date \\ \\
      \\ \\
      \\ \\
      \\ \\
      \\ \\
      {\bf Thesis and Abstract Approved: } \= \underline{\hspace{2.0in}} \\
      \> \@UMBCadvisor \\
	  \> \@UMBCadvisortitle \\
      \> \@UMBCdept \\
      \\ \\
      \\ \\
      \\ \\
      {\bf Date Approved: } \> \underline{\hspace{2in}}
    \end{tabbing}
	\doublespacing
  \end{titlepage}
}

\newcommand\makeabbrevs{%
  \label{front:abbrevs}
  \renewcommand{\glossarypreamble}{\singlespacing}
  \renewcommand{\glossarypostamble}{\doublespacing}
  \printglossary[type=\acronymtype,title=List of
  Abbreviations,nonumberlist=true]
}

\def\tableofcontents{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
  \fi\pdfbookmark{Table of Contents}{Table of Contents}\chapter*{Table of Contents}
  \@starttoc{toc}\if@restonecol\twocolumn\fi}

\newcommand\maketables{
  \clearpage
  \chapter*{\listtablename}
  \addcontentsline{toc}{chapter}{\listtablename}
  \@starttoc{lot}
}

\newcommand\makefigures {
	\clearpage
	\chapter*{\listfigurename}
	\addcontentsline{toc}{chapter}{\listfigurename}
	\@starttoc{lof}
}

\newenvironment{dedication}
{ \null
  \vspace{2in}
  \begin{center}}
  {\end{center}}

\makeatletter
\newcommand\tabfill[1]{%
  \dimen@\linewidth%
  \advance\dimen@\@totalleftmargin%
  \advance\dimen@-\dimen\@curtab%
  \parbox[t]\dimen@{\raggedright #1\ifhmode\strut\fi}%
}

\renewenvironment{abstract}
{\begin{titlepage}
	\pdfbookmark{Abstract}{Abstract}
    \chapter*{Abstract}
    \nopagenumbers
	\singlespacing
    \begin{tabbing}
      {\bf Directed by:  } \= \kill
      {\bf Title:} \> \@title \\ \\
      \> \@author, \@degree, \@date \\ \\
      {\bf Directed by:} \> \@UMBCadvisortitle~\@UMBCadvisor,~\@UMBCdept
    \end{tabbing}
	\doublespacing
  }
  {
    \begin{tabbing}
      {\bf Directed by:  } \= \kill
      {\bf Subjects:} \> \tabfill{\@UMBCsubjects} \\
      {\bf Keywords:} \> \tabfill{\@UMBCkeywords}
    \end{tabbing}
  \end{titlepage}
}
\doublespacing
\parindent 0.5in
