\ProvidesClass{rithy-thesis}[2025/08/18 v3.0 My custom LaTeX class]

% Load a base class (e.g., article) with options
\LoadClass[12pt]{report}

% Font Setup
\usepackage{polyglossia}
\usepackage{fontspec}
\setmainfont{Times New Roman}  % Use Times New Roman font
\setotherlanguage{khmer}
\newfontfamily\khmerfont{Khmer OS}[Scale=0.9]
\newfontfamily\khmermuol{Khmer OS Muol Light}[Scale=0.9] % Adjust Scale if needed

% Document Layout
\renewcommand{\baselinestretch}{1.4} % set spacing
\usepackage{setspace}
\usepackage{indentfirst}
\setlength{\parindent}{30pt}  % set paragraph indent globally

% Title Format
% ----- Chapter format -----
\usepackage{titlesec}
\titleformat{\chapter}[hang]
  {\normalfont\bfseries\fontsize{12pt}{14pt}\selectfont}
  {\thechapter}
  {0.5em}
  {}
\titlespacing{\chapter}{0pt}{-2em}{1em}  % use unstarred version
\titleformat{name=\chapter,numberless}[block] % numberless chapters
  {\normalfont\bfseries\centering\fontsize{12pt}{14pt}\selectfont} % font + centering
  {} % no number
  {0pt} % space between “number” and title
  {} % code before title
\titlespacing{name=\chapter,numberless}{0pt}{-2em}{1em} % spacing: top=2em, bottom=1em

% ----- Section format -----
\titleformat{\section}[hang]
  {\normalfont\bfseries\fontsize{12pt}{14pt}\selectfont}
  {\thesection}
  {0.5em}
  {}
\titlespacing{\section}{0pt}{0.8em}{0.5em}

% ----- Subsection format -----
\titleformat{\subsection}[hang]
  {\normalfont\fontsize{12pt}{14pt}\selectfont}
  {\thesubsection}
  {0.5em}
  {}
\titlespacing{\subsection}{0pt}{0.8em}{0.5em}

% ----- Subsubsection format -----
\titleformat{\subsubsection}[hang]
  {\normalfont\fontsize{12pt}{14pt}\selectfont}
  {\thesubsubsection}
  {0.5em}
  {}
\titlespacing{\subsubsection}{0pt}{0.8em}{0.5em}

% ----- Add dot after section numbers -----
\renewcommand{\thechapter}{\arabic{chapter}.}
\renewcommand{\thesection}{\thechapter\arabic{section}.}
\renewcommand{\thesubsection}{\thesection\arabic{subsection}.}
\renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}.}

% ------------ Content ----------------
% Make List of Figure align
\makeatletter
\patchcmd{\@chapter}{%
    \addtocontents{lof}{\protect\addvspace{10\p@}}%
    \addtocontents{lot}{\protect\addvspace{10\p@}}%
}{}{}{\message{Failed to patch \string\@chapter}}
\makeatother

\usepackage[hidelinks]{hyperref} % creates the links
\usepackage{titletoc}
% Chapter TOC entries
\titlecontents{chapter}
[0pt] % indentation for chapter
{}    % no extra formatting (normal font)
{\thecontentslabel\hspace{1em}} % number + space
{}    % for entries without number
{\titlerule*[0.5pc]{.}\contentspage} % dots + page number

% Section TOC entries
\titlecontents{section}
[1.5em] % indentation for section
{}      % no extra formatting
{\thecontentslabel\hspace{1em}} % number + space
{}      % for entries without number
{\titlerule*[0.5pc]{.}\contentspage} % dots + page number

% Subsection TOC entries
\titlecontents{subsection}
[3em] % indentation for subsection
{}     % no extra formatting
{\thecontentslabel\hspace{1em}} % number + space
{}     % for entries without number
{\titlerule*[0.5pc]{.}\contentspage} % dots + page number

% Subsubsection TOC entries
\titlecontents{subsubsection}
[4.5em] % indentation for subsubsection
{}      % no extra formatting
{\thecontentslabel\hspace{1em}} % number + space
{}      % for entries without number
{\titlerule*[0.5pc]{.}\contentspage} % dots + page number

% Require additional packages
\usepackage{graphicx}
\usepackage{float}
\RequirePackage{geometry}
\usepackage{amsmath, amsfonts, amssymb, amsthm}
\geometry{a4paper, margin=1in} % Set page geometry

% Fix figure numbering format with dot for captions
\renewcommand{\thefigure}{\thechapter\arabic{figure}. }
\renewcommand{\thetable}{\thechapter\arabic{table}. }

% Configure caption style
\usepackage{caption}
\captionsetup[figure]{
  labelformat=simple,    % removes "Figure" label
  labelsep=none,        % adds period after number
  font=normal,
  format=hang,          % allows for centered multi-line captions
  justification=centering, % center-aligns the caption
  singlelinecheck=off,  % ensures centering even for single-line
  labelfont=bf,         % makes number bold (optional)
  textfont=normalfont   % normal font for caption text
}

\captionsetup[table]{
  labelformat=simple,    % removes "Table" label
  labelsep=none,        % adds period after number
  font=normal,
  format=hang,          % allows for centered multi-line captions
  justification=centering, % center-aligns the caption
  singlelinecheck=off,  % ensures centering even for single-line
  labelfont=bf,         % makes number bold (optional)
  textfont=normalfont   % normal font for caption text
}

\newcommand{\startcontent}{%
    % Set double spacing
    \doublespacing

    % Table of Contents
    \renewcommand{\contentsname}{\centering \normalsize TABLE OF CONTENTS}%
    \tableofcontents
    \newpage

    % List of Figures
    \renewcommand{\listfigurename}{\normalsize \centering LIST OF FIGURES}%
    \addcontentsline{toc}{chapter}{LIST OF FIGURES}%
    {%
        \let\oldnumberline\numberline
        \renewcommand{\numberline}{\figurename~\oldnumberline}%
        \listoffigures
    }%
    \clearpage

    % List of Tables
    \renewcommand{\listtablename}{\centering \normalsize LIST OF TABLES}%
    \addcontentsline{toc}{chapter}{LIST OF TABLES}%
    {%
        \let\oldnumberline\numberline
        \renewcommand{\numberline}{\tablename~\oldnumberline}%
        \listoftables
    }%
    \clearpage
}


\renewcommand{\theequation}{\textbf{Eq.\thechapter\arabic{equation}}}