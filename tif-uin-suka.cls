%-------------------------------------------------------------------------------
% Template Skripsi untuk TIF UIN SUKA
%-------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tif-uin-suka}

\RequirePackage[english,bahasa]{babel}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage{ragged2e}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx,latexsym}
\RequirePackage{fancyhdr}

\setlength{\paperwidth}{210mm}
\setlength{\paperheight}{297mm}
\usepackage[pass]{geometry}
\usepackage{verbatim,enumerate}

\usepackage{booktabs}
\usepackage[table]{xcolor}
\usepackage{multirow}
\usepackage{float}
\usepackage{indentfirst}

\newif\if@msthesis
\newif\if@msproposal
\DeclareOption{skripsi}{\@msthesistrue\@msproposalfalse}
\DeclareOption{proposal}{\@msthesisfalse\@msproposaltrue}

\newif\if@singlesp
\newif\if@doublesp
\DeclareOption{satuspasi}{\@singlesptrue\@doublespfalse}
\DeclareOption{duaspasi}{\@singlespfalse\@doublesptrue}
\newif\if@onehalfsp
\@onehalfspfalse
\DeclareOption{satusetengahspasi}{\@onehalfsptrue}

\newif\if@langindo
\newif\if@langeng
\DeclareOption{indonesia}{\@langindotrue\@langengfalse}
\DeclareOption{inggris}{\@langindofalse\@langengtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{tif-uin-suka,satusetengahspasi,indonesia}
\ProcessOptions
\LoadClass[a4paper,12pt]{report}
%\RequirePackage{natbib}
\bibliographystyle{IEEEtran}
%\RequirePackage{glossaries}%
%\renewcommand{\nomname}{\nomenclaturename}%
%\makeglossary%
%\makenomenclature

%------------------------------------------------------------
%Layout
%------------------------------------------------------------
\setlength{\topmargin}{-0.9cm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{2.3cm}
\setlength{\topskip}{1ex}
\setlength{\oddsidemargin}{1.46cm}
\setlength{\evensidemargin}{1.46cm}
\setlength{\textwidth}{14.3cm}
\setlength{\textheight}{22cm}
\setlength{\footskip}{1.5cm}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}

\setlength{\parindent}{3em} %Indent approx 6 character

%------------------------------------------------------------
%The form of page numbering
%------------------------------------------------------------
\pagestyle{myheadings}
\markright{}

%------------------------------------------------------------
%Define page numbering in the first chapter
%------------------------------------------------------------
\def\ps@chapterheading{%
  \let\@evenhead\@empty\let\@oddhead\@empty
  \def\@oddfoot{\hfil\thepage\hfil}%
  \def\@evenfoot{\hfil\thepage\hfil}
  }

%------------------------------------------------------------
%Redefine chapter and sections
%------------------------------------------------------------
\setcounter{secnumdepth}{2}
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
%\renewcommand \thesection {\@arabic\c@section.}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
%\renewcommand\thesubsection {\@alph\c@subsection.}
\renewcommand\thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
%\renewcommand\thesubsubsection{\@roman\c@subsubsection.}
%\renewcommand\thesubsubsection{}
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\renewcommand{\chapter}{\clearpage\thispagestyle{chapterheading}%
  \global\@topnum\z@ %Prevents figures from going at top of page
  \@afterindenttrue %Indent the 1st paragraph
  \secdef\@chapter\@schapter}
\renewcommand{\@makechapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 5\p@
    \fi
    \interlinepenalty\@M
    \large \bfseries #1\par\nobreak
    \vskip 20\p@
    }}
\renewcommand{\@makeschapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \interlinepenalty\@M \large \bfseries #1\par\nobreak \vskip 20\p@ }}
%\renewcommand{\section}{\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {2.3ex \@plus.2ex}%
%                                   {\normalfont\normalsize\bfseries\centering}}
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
%\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\parindent}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {-1em}%
%                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\subparagraph}

\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@equation}
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}

%------------------------------------------------------------
%Redefine caption names
%------------------------------------------------------------
\def\captionsbahasa{%
\def\prefacename{KATA PENGANTAR}%
\def\contentsname{DAFTAR ISI}%
\def\listfigurename{DAFTAR GAMBAR}%
\def\listtablename{DAFTAR TABEL}%
\def\listappendixname{DAFTAR LAMPIRAN}%
\def\nomenclaturename{DAFTAR SINGKATAN}%
\def\abstractname{Intisari}%
\def\acknowledgmentname{HALAMAN PERSEMBAHAN}%
\def\approvalname{SURAT PERSETUJUAN SKRIPSI/TUGAS AKHIR}
\def\partname{BAGIAN}%
\def\chaptername{BAB}%
\def\appendixname{LAMPIRAN}%
\def\refname{DAFTAR PUSTAKA}%
\def\bibname{DAFTAR PUSTAKA}%
\def\indexname{Indek}%
\def\figurename{Gambar}%
\def\tablename{Tabel}%
\def\pagename{Halaman}%
}

%English
\def\captionsenglish{%
\def\prefacename{PREFACE}%
\def\contentsname{CONTENTS}%
\def\listfigurename{LIST OF FIGURES}%
\def\listtablename{LIST OF TABLES}%
\def\listappendixname{LIST OF APPENDICES}%
\def\nomenclaturename{NOMENCLATURE}%
\def\abstractname{\emph{Abstract}}%
\def\partname{PART}%
\def\chaptername{CHAPTER}%
\def\appendixname{APPENDIX}%
\def\refname{REFERENCES}%
\def\bibname{REFERENCES}%
\def\indexname{Index}%
\def\figurename{Figure}%
\def\tablename{Table}%
\def\pagename{Page}%
}

%------------------------------------------------------------]
%Define thesis's inputs
%------------------------------------------------------------
\gdef\@university{Universitas Islam Negeri Sunan Kalijaga}
\gdef\@faculty{Fakultas Sains dan Teknologi}
\gdef\@city{Yogyakarta}
\newcommand{\titleind}[1]{\gdef\@titleind{#1}}
\newcommand{\@titleind}{}
\newcommand{\fullname}[1]{\gdef\@fullname{#1}}
\newcommand{\@fullname}{}
\newcommand{\idnum}[1]{\gdef\@idnum{#1}}
\newcommand{\@idnum}{}
\newcommand{\examdate}[1]{\gdef\@examdate{#1}}
\newcommand{\approvaldate}[1]{\gdef\@approvaldate{#1}}
\newcommand{\@examdate}{\number\day~\ifcase\month\or
    Januari\or Pebruari\or Maret\or April\or Mei\or Juni\or
    Juli\or Agustus\or September\or Oktober\or Nopember\or Desember\fi
    \space \number\year}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\@degree}{}
\newcommand{\yearsubmit}[1]{\gdef\@yearsubmit{#1}}
\newcommand{\@yearsubmit}{}
\newcommand{\program}[1]{\gdef\@program{#1}}
\newcommand{\@program}{}
\newcommand{\headprogram}[1]{\gdef\@headprogram{#1}}
\newcommand{\@headprogram}{}
\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\@dept}{}
\newcommand{\firstsupervisor}[1]{\gdef\@firstsupervisor{#1}}
\newcommand{\@firstsupervisor}{}
\newcommand{\secondsupervisor}[1]{\gdef\@secondsupervisor{#1}}
\newcommand{\@secondsupervisor}{}
\newcommand{\firstnip}[1]{\gdef\@firstnip{#1}}
\newcommand{\@firstnip}{}
\newcommand{\secondnip}[1]{\gdef\@secondnip{#1}}
\newcommand{\@secondnip}{}

%------------------------------------------------------------
%Define cover in Indonesian
%------------------------------------------------------------
\def\cover{%
  \thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{1}
    \begin{center}
      \begin{singlespace}
      \fontsize{14pt}{16pt}\selectfont\MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
      \vspace{1.0cm}
      \MakeUppercase{\normalfont Skripsi}\\
      \vspace{0.5cm}
      {Untuk memenuhi persyaratan mencapai derajat Strata Satu} \\
      \vspace{1.0cm}
      {Program Studi \@dept}
      \vspace{1.0cm}
       \vfill
       \includegraphics[width=0.4\textwidth]{images/logouin.png}
       \vfill
       \vspace{0.5cm}
       {\normalfont
        \bfseries Diajukan oleh:\\
        \vspace{0.5em}
        \bfseries{\@fullname}\\
        \vspace{0.5em}
        \MakeUppercase{\normalfont\bfseries \@idnum}}\\
       \vspace{1.0cm}
       {\normalfont 
         \MakeUppercase{\normalfont\bfseries Program Studi \@dept}\\
         \vspace{0.5em}
         \MakeUppercase{\normalfont\bfseries\@faculty} \\ 
    \vspace{0.5em}         
         \MakeUppercase{\normalfont\bfseries\@university}\\
         \vspace{0.5em}
         \MakeUppercase{\normalfont\bfseries\@city}\\
         \vspace{0.3cm}
         {\normalfont\bfseries\@yearsubmit}}\\
      \end{singlespace}
      \end{center}
}

%------------------------------------------------------------
%Approval Page
%------------------------------------------------------------

\def\approvalpage{%
  {
  \cleardoublepage
  \let\clearpage\relax
  \begin{flushleft}
  \begin{tabular}{cccc}
  \includegraphics[width=0.05\textwidth]{images/logouin.png} &
  \textbf\@university &
  \includegraphics[width=0.1\textwidth]{images/logotuv.jpg} &
  \textbf\approvalnumber  
  \end{tabular}
  \vspace{1cm}
  \end{flushleft}
  \chapter*{\underline\approvalname}%
  }
  \begin{flushleft}
   \begin{singlespace}
      \justify
      {Hal \hspace*{1.3em} : Permohonan} \\
      {Lamp \hspace*{0.5em} : -} \\
      \\
      {Kepada} \\
      {Yth. Dekan \@faculty} \\
      {\shortuniversity} {\@city} \\
      {di \@city} \\
      
      \textit{Assalamu'alaikum wr. wb} \\
      \setlength{\parindent}{1.5em}
      \par Setelah membaca, meneliti, memberikan petunjuk dan mengoreksi serta mengadakan perbaikan seperlunya, maka kami selaku pembimbing berpendapat bahwa skripsi Saudara: \\
      
      \par Nama \hspace*{1.6cm} : \@fullname
      \par NIM \hspace*{1.8cm} : \@idnum
      \par Judul Skripsi \hspace*{0.4cm} : \@titleind \\
      
      \setlength{\parindent}{0em}
      sudah dapat diajukan kembali kepada Program Studi {\@dept} {\@faculty} {\@university} {\@city} sebagai salah satu syarat untuk memperoleh gelar Sarjanan Strata Satu dalam \@dept.
      
      \vspace{1em}
      \setlength{\parindent}{1.5em}
      \par{Dengan ini kami mengharap agar skripsi/tugas akhir Saudara tersebut di atas dapat segera dimunaqsyahkan. Atas perhatiannya kami ucapkan terima kasih.} \\
      
      \textit{Wassalamu'alaikum wr. wb.}
      \vspace{2em}
      \begin{center}
      \begin{singlespace}
      \begin{flushright}
      
        \begin{tabular}{cccc}
          & & \@city, \@approvaldate \\
          & & Pembimbing \\
          \vspace{1cm} & \vspace{1cm} & \vspace{1cm}\\
          & &
          \textbf{\underline{\@firstsupervisor}} \\
          & & \bfseries NIP. \@firstnip    
      \end{tabular}
      \end{flushright}
    \end{singlespace}
    \end{center}
    \end{singlespace}
  \end{flushleft}
\addcontentsline{toc}{chapter}{\approvalname}
}

%------------------------------------------------------------
%Acknowlegment
%------------------------------------------------------------
\def\acknowledgment{%
  \chapter*{\acknowledgmentname}%
  \begin{singlespace}
  Skripsi ini saya persembahkan untuk:
  \begin{itemize}
    \item Alm. Bapak, Ayah, dan Ibu orang tua peneliti, yang telah membesarkan dan mendidik, memberikan banyak pelajaran serta memberikan dukungan dan doa kepada peneliti.
    \item Rekan sekaligus keluarga KKN Kelompok 300 Fudzi, Asror, Harist, Fakhrul, Rira, Risma, Alfi, dan Nida yang telah memberikan banyak pelajaran berharga selama proses pengabdian di masyarakat. Khususnya Harist \textit{yang bagus nek dewe}.
  \end{itemize}
  \end{singlespace}
\addcontentsline{toc}{chapter}{\acknowledgmentname}
}

%------------------------------------------------------------
%Preface
%------------------------------------------------------------
\def\preface{%
  \chapter*{\prefacename}%
\addcontentsline{toc}{chapter}{\prefacename}
}

%------------------------------------------------------------
%Nomenclature
%------------------------------------------------------------
\def\singkatan{%
  \chapter*{\nomenclaturename}%
  \thispagestyle{plain}
  %\chapter*{\nomenclaturename}%
  %\printglossary
\addcontentsline{toc}{chapter}{\nomenclaturename}
}

%------------------------------------------------------------
%Redefine Abstract in Indonesian
%------------------------------------------------------------
\def\abstractind{%
  \clearpage\thispagestyle{chapterheading}%
  \chapter*{\abstractname}%
  {\parindent \z@ \centering \normalfont
  %{\large\textbf{\abstractname}} \\
  \vspace{1.0cm}
    }
  \begin{singlespacing}%
  \vskip 20\p@
  \addcontentsline{toc}{chapter}{\abstractname}
}
\def\endabstractind{\par\vfil\null\end{singlespacing}}

%------------------------------------------------------------
%Redefine Abstract in English
%------------------------------------------------------------
\def\abstracteng{%
  \clearpage\thispagestyle{chapterheading}\selectlanguage{english}
  \chapter*{\abstractname}%
  {\parindent \z@ \centering \normalfont
  %{\large\textbf{\abstractname}} \\
  \vspace{1.0cm}
    }
  \begin{singlespacing}%
  \vskip 20\p@
  \addcontentsline{toc}{chapter}{\abstractname}
}
\def\endabstracteng{\par\vfil\null\end{singlespacing}%
\selectlanguage{bahasa}\clearpage\pagenumbering{arabic}\setcounter{page}{1}}

%Tabularization
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}
\newcommand{\tab}[1]{\hspace{.2\textwidth}\rlap{#1}}


\AtBeginDocument{%
\if@doublesp%
\doublespacing%
\else\if@singlesp%
\singlespacing%
\else
\onehalfspacing%
\fi%
\fi
}

\AtBeginDocument{%
\if@langindo%
\selectlanguage{bahasa}%
\else
\selectlanguage{english}%
\fi
}

\endinput