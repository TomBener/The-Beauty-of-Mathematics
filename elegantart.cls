%% !TEX program = xelatex
%% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantart}

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

% ----- Colors -----
\DeclareStringOption[blue]{color}
\DeclareStringOption[en]{lang}
\DeclareStringOption[answer]{result}
\DeclareStringOption[fancy]{mode}
\DeclareStringOption[show]{base}
\DeclareStringOption[normal]{device}
\DeclareStringOption[numbers]{cite}
\DeclareStringOption[newtxmath]{math}
\DeclareStringOption[marginfalse]{marginpar}
% ----- backward compatibility
\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{cyan}{\ekv{color=cyan}}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{gray}{\ekv{color=gray}}
\DeclareVoidOption{black}{\ekv{color=black}}
\DeclareVoidOption{nocolor}{\ekv{color=none}}

\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{cn}{\ekv{lang=cn}}

\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}

\DeclareVoidOption{answer}{\ekv{result=answer}}
\DeclareVoidOption{noanswer}{\ekv{result=noanswer}}

\DeclareVoidOption{hide}{\ekv{base=hide}}
\DeclareVoidOption{show}{\ekv{base=show}}

\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{pad}{\ekv{device=pad}}

\DeclareVoidOption{numbers}{\ekv{cite=numbers}}
\DeclareVoidOption{authoryear}{\ekv{cite=authoryear}}

\DeclareVoidOption{newtxmath}{\ekv{math=newtx}}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}

\DeclareVoidOption{margintrue}{\ekv{marginpar=margintrue}}
\DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}

% ----- Title Style -----
\DeclareStringOption[hang]{titlestyle}[hang]
% ----- backward compatibility
\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
\DeclareVoidOption{display}{\ekv{titlestyle=display}}
% ----- Default Options -----
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessKeyvalOptions*\relax
% \ProcessOptions*\relax
\LoadClass[a4paper]{article}

\RequirePackage{indentfirst,comment}
\setlength\parindent{2em}

% fontsetting
\ifdefstring{\ELEGANT@math}{mtpro2}{
\let\Bbbk\relax
\RequirePackage[lite]{mtpro2}
}{\relax}

\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}

\PassOptionsToPackage{no-math}{fontspec}
\ifdefstring{\ELEGANT@lang}{cn}{
\RequirePackage[UTF8]{ctex}
\setCJKmainfont[BoldFont=SourceHanSerifSC-Bold,
				ItalicFont=KaiTi]
				{SourceHanSerifSC-Regular}
}

\ctexset{today = small}

\RequirePackage{newtxtext}
\ifdefstring{\ELEGANT@math}{newtxmath}{
\RequirePackage{newtxmath}
}{\relax}
\everymath{\displaystyle}

% 定义对数常数 e，虚数符号 i, j 以及微分算子 d 为直立体等
\newcommand{\me}{\mathrm{e}}
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\md}{\mathop{}\!\mathrm{d}}
\newcommand{\mt}{$\mathrm{m}^2$}

% \sum
\DeclareSymbolFont{largesymbolsCM}{OMX}{cmex}{m}{n}
\let\txsum\sum
\let\sum\relax
\DeclareMathSymbol{\sum}{\mathop}{largesymbolsCM}{"50}

% \infty
\DeclareSymbolFont{symbolsCM}{OMS}{cmsy}{m}{n}
\SetSymbolFont{symbolsCM}{bold}{OMS}{cmsy}{b}{n}
\let\txinfty\infty
\DeclareMathSymbol{\infty}{\mathord}{symbolsCM}{"31}

% \partial, \pi
\DeclareSymbolFont{lettersCM}{OML}{cmm} {m}{it}
\SetSymbolFont{lettersCM}{bold}{OML}{cmm} {b}{it}
\let\txpartial\partial
\DeclareMathSymbol{\partial}{\mathord}{lettersCM}{"40}
\let\txpi\pi
\DeclareMathSymbol{\pi}{\mathord}{lettersCM}{"19}

% int 
\RequirePackage{esint}


% ----- Handle Colors -----
% 章节以及页脚图形
\RequirePackage{xcolor}
\ifdefstring{\ELEGANT@color}{green}{
	\definecolor{structurecolor}{RGB}{0,120,2}%
	\definecolor{main}{RGB}{0,120,2}%
	\definecolor{second}{RGB}{230,90,7}%
	\definecolor{third}{RGB}{0,160,152}%
}{\relax}
\ifdefstring{\ELEGANT@color}{cyan}{
	\definecolor{structurecolor}{RGB}{31,186,190}%
	\definecolor{main}{RGB}{59,180,5}%
	\definecolor{second}{RGB}{175,153,8}%
	\definecolor{third}{RGB}{244,105,102}%
}{\relax}
\ifdefstring{\ELEGANT@color}{blue}{
	\definecolor{structurecolor}{RGB}{60,113,183}
	\definecolor{main}{RGB}{0,166,82}%
	\definecolor{second}{RGB}{255,134,24}%
	\definecolor{third}{RGB}{0,174,247}%
}{\relax}
\ifdefstring{\ELEGANT@color}{gray}{
	\definecolor{structurecolor}{RGB}{150,150,150}
	\definecolor{main}{RGB}{150,150,150}%
	\definecolor{second}{RGB}{150,150,150}%
	\definecolor{third}{RGB}{150,150,150}%
}{\relax}
\ifdefstring{\ELEGANT@color}{black}{
	\definecolor{structurecolor}{RGB}{0,0,0}
	\definecolor{main}{RGB}{0,0,0}%
	\definecolor{second}{RGB}{0,0,0}%
	\definecolor{third}{RGB}{0,0,0}%
}{\relax}

% green color
	\definecolor{structure1}{RGB}{0,120,2}%
	\definecolor{main1}{RGB}{0,120,2}%
	\definecolor{second1}{RGB}{230,90,7}%
	\definecolor{third1}{RGB}{0,160,152}%
% cyan color
	\definecolor{structure2}{RGB}{31,186,190}%
	\definecolor{main2}{RGB}{59,180,5}%
	\definecolor{second2}{RGB}{175,153,8}%
	\definecolor{third2}{RGB}{244,105,102}%
% blue color
	\definecolor{structure3}{RGB}{60,113,183}
	\definecolor{main3}{RGB}{0,166,82}%
	\definecolor{second3}{RGB}{255,134,24}%
	\definecolor{third3}{RGB}{0,174,247}%
% gray color
	\definecolor{structure4}{RGB}{150,150,150}
	\definecolor{main4}{RGB}{150,150,150}%
	\definecolor{second4}{RGB}{150,150,150}%
	\definecolor{third4}{RGB}{150,150,150}%
% black color
	\definecolor{structure5}{RGB}{0,0,0}
	\definecolor{main5}{RGB}{0,0,0}%
	\definecolor{second5}{RGB}{0,0,0}%
	\definecolor{third5}{RGB}{0,0,0}%

% color definition
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{bule}{RGB}{18,29,57}
\definecolor{quocol}{RGB}{100,100,100}
\definecolor{urlblue}{rgb}{0.19,0.54,0.92} % 浅蓝色
\definecolor{citered}{rgb}{.5,0,.5}  % 紫色


\newcommand{\base}[2]{%
	\nointerlineskip \vspace{0.1\baselineskip}\hspace{\fill}
	{\color{#1}
		\resizebox{0.3\linewidth}{1.5ex}
		{{%
				{\begin{tikzpicture}
					\node  (C) at (0,0) {};
					\node (D) at (4,0) {};
					\path (C) to [ornament=#2] (D);
					\end{tikzpicture}}}}}%
	\hspace{\fill}
	\par\nointerlineskip \vspace{0.1\baselineskip}
}

% ----- Title Style -----
\ifdefstring{\ELEGANT@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\ELEGANT@titlestyle}{display}{\def\style{display}}{\relax}


\newtoks\email
\newtoks\version
\newtoks\mail
\newtoks\subtitle

\RequirePackage[sort&compress]{natbib}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\small\kaishu}


\RequirePackage{enumerate}
% list/itemize/enumerate setting
\RequirePackage[shortlabels]{enumitem}
\setlist{nolistsep}

% caption settings 
\RequirePackage[font=small,labelfont={bf,color=structurecolor}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

\AtBeginDocument{
\setlength{\abovedisplayskip}{3pt}
\setlength{\belowdisplayskip}{3pt}
\setcounter{tocdepth}{3}
}

\RequirePackage{tocloft}
\renewcommand{\cftsecleader}{\bfseries\cftdotfill{\cftdotsep}}

% 常用宏包
\linespread{1.3}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{xcolor}
\RequirePackage{fancyvrb}
\RequirePackage{lipsum,zhlipsum,makecell,hologo,setspace}
\RequirePackage{dashrule}
\RequirePackage{pdfpages}
\RequirePackage{textgreek}
\RequirePackage{float}

% 中文结构名字
\ifdefstring{\ELEGANT@lang}{cn}{
\renewcommand{\contentsname}{}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\partname}{\color{structurecolor}}
\renewcommand{\thepart}{第\zhnumber{\arabic{part}}部分}
\renewcommand{\listfigurename}{插图目录}
\renewcommand{\listtablename}{表格目录}
\renewcommand{\refname}{\S \,\, 参考文献}
\renewcommand{\appendixname}{附录}
\renewcommand{\indexname}{索\hspace{2em}引}
\newcommand\figref[1]{\textbf{图}~\ref{#1}}
\newcommand\tabref[1]{\textbf{表}~\ref{#1}}
\RequirePackage{gbt7714}}

\ifdefstring{\ELEGANT@lang}{en}{
\newcommand\figref[1]{\textbf{Figure}~\ref{#1}}
\newcommand\tabref[1]{\textbf{Table}~\ref{#1}}
\bibliographystyle{aer}
}{\relax}

\RequirePackage{xpatch}
\xpatchcmd{\part}{\thispagestyle{plain}}
      {\thispagestyle{plain}}{}{}
\xpatchcmd{\@endpart}{\vfil\newpage}{\vfil\newpage
             }{}{}
\graphicspath{{./figures/}{./figures/endpage/}{./figures/logo/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}

\RequirePackage{tikz}
\usetikzlibrary{backgrounds,calc,shadows}
\usepackage[object=vectorian]{pgfornament}

\RequirePackage{tikzlings}
\tikzset{/thing/.cd,
 pie/.code=\thing@cheesetrue\def\thing@cheese{#1}, %<-pretend you didn't see that
 pie/.default=pink!70!red}

\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=structurecolor,draw=none] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=structurecolor,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=structurecolor,draw=none] circle (2pt);}
\setlist[enumerate,1]{label=\color{structurecolor}\arabic*.}
\setlist[enumerate,2]{label=\color{structurecolor}(\alph*).}
\setlist[enumerate,3]{label=\color{structurecolor}\Roman*.}
\setlist[enumerate,4]{label=\color{structurecolor}\Alph*.}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}

\RequirePackage[margin=2cm]{geometry}

\RequirePackage{hyperref}
\hypersetup{
	breaklinks,
	unicode,
	linktoc=all,
	bookmarksnumbered=true,
	bookmarksopen=true,
	colorlinks,
	linkcolor=winered,
	citecolor=citered,
	urlcolor=urlblue,
	plainpages=false,
	pdfstartview=FitH,
	pdfborder={0 0 0},
	%linktocpage,
	pdfproducer={XeTeX 0.999991},
	pdfcreator={LaTeX with elegantart class},
	pdftitle={数学之美},
	pdfsubject={https://tomben.me/the-beauty-of-mathematics/the-beauty-of-mathematics.pdf},
	pdfauthor={Copyright © 2019 Tom Ben All Rights Reserved},
	pdfkeywords={Beauty, Mathematics, LaTeX},
}

% 章节设置
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage{apptools}
\RequirePackage[toc,page]{appendix}

\setcounter{secnumdepth}{5}

\titleformat{\section}[hang]{\bfseries}
{\Large\bfseries{\color{structurecolor}\thesection}\enspace}{1pt}{\color{structurecolor}\Large\bfseries\filright}

\titleformat{\subsection}[hang]{\bfseries}
{\large\bfseries\color{structurecolor}\thesubsection\enspace}{1pt}{\color{structurecolor}\large\bfseries\filright}

\titleformat{\subsubsection}[hang]{\bfseries}
{\large\bfseries\color{structurecolor}\thesubsubsection\enspace}{1pt}{\color{structurecolor}\large\bfseries\filright}

% define the note and proof environment
\RequirePackage{pifont,manfnt,bbding}

% 脚注编号使用带圈数字
\newcommand*\dingctr[1]{
\protect\ding{\number\numexpr\value{#1}+171\relax}}
\renewcommand*\thefootnote{\dingctr{footnote}}

% 脚注编号和文字同高
\renewcommand\@makefntext[1]{
\setlength\leftskip{1.2\ccwd}
\setlength\parindent{2\ccwd}\selectfont
\noindent\llap{\@thefnmark\ }#1}


\RequirePackage[many]{tcolorbox}
\ifdefstring{\ELEGANT@mode}{fancy}{
\tcbset{
    common/.style={
        fontupper=\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\upshape\kaishu},
        coltitle=white,
        colback=gray!5,
        boxrule=0.5pt,
        fonttitle=\bfseries,
        enhanced,
        breakable,
        top=15pt,
        before skip=8pt,
        attach boxed title to top left={yshift=-0.11in,xshift=0.15in},
        boxed title style={boxrule=0pt,colframe=white,arc=0pt,outer arc=0pt},
        separator sign={.},
    },
    defstyle/.style={
        common,
        colframe=main,  
        colback=main!5,
        colbacktitle=main, 
        overlay unbroken and last={\node[anchor=south east, outer sep=6pt] at (1.01\textwidth-width,-0.16) {\textcolor{main}{$\clubsuit$}}; }
    },
    thmstyle/.style={
        common,
        colframe=second,  
        colback=second!5,
        colbacktitle=second, 
        overlay unbroken and last={\node[anchor=south east, outer sep=6pt] at (1.01\textwidth-width,-0.16) {\textcolor{second}{$\heartsuit$}}; }
    },
    propstyle/.style={
        common,
        colframe=third,  
        colback=third!5,
        colbacktitle=third, 
        overlay unbroken and last={\node[anchor=south east, outer sep=6pt] at (1.01\textwidth-width,-0.16) {\textcolor{third}{$\spadesuit$}}; }
    },
}

\newtcbtheorem[auto counter]{definition}{
	\ifdefstring{\ELEGANT@lang}{en}{Definition}{证明}
}{defstyle}{def}

\newtcbtheorem[auto counter]{theorem}{
	\ifdefstring{\ELEGANT@lang}{en}{Theorem}{公式}
}{thmstyle}{thm}

\newtcbtheorem[auto counter]{proposition}{
	\ifdefstring{\ELEGANT@lang}{en}{Proposition}{打油诗}
}{propstyle}{pro}

\newtcbtheorem[auto counter]{corollary}{
	\ifdefstring{\ELEGANT@lang}{en}{Corollary}{推论}
}{thmstyle}{cor}

\newtcbtheorem[auto counter]{lemma}{
	\ifdefstring{\ELEGANT@lang}{en}{Lemma}{引理}
}{thmstyle}{lem}

}{\relax}

\ifdefstring{\ELEGANT@mode}{simple}{
\let\openbox\relax
\RequirePackage{amsthm}
\let\proof\relax
\let\endproof\relax
% declare a new theorem style
\newtheoremstyle{edefstyle}%
{3pt}% Space above
{3pt}% Space below 
{\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\upshape\kaishu}}% Body font
{}% Indent amount
{\bfseries\color{main}}% Theorem head font
{}% Punctuation after theorem head
{0.5em}% Space after theorem head 
{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}% Theorem head spec (can be left empty, meaning ‘normal’)
% -------------------------------------------------%
\newtheoremstyle{ethmstyle}%
{3pt}% Space above
{3pt}% Space below 
{\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\upshape\kaishu}}% Body font
{}% Indent amount
{\bfseries\color{second}}% Theorem head font
{}% Punctuation after theorem head
{.5em}% Space after theorem head 
{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}% Theorem head spec (can be left empty, meaning ‘normal’)
% -------------------------------------------------%
\newtheoremstyle{eprostyle}%
{3pt}% Space above
{3pt}% Space below 
{\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\upshape\kaishu}}% Body font
{}% Indent amount
{\bfseries\color{third}}% Theorem head font
{}% Punctuation after theorem head
{.5em}% Space after theorem head 
{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}% Theorem head spec (can be left empty, meaning ‘normal’)

\theoremstyle{edefstyle}
\newtheorem{edefinition}{\ifdefstring{\ELEGANT@lang}{en}{Definition}{证明}}

\theoremstyle{ethmstyle}
\newtheorem{etheorem}{\ifdefstring{\ELEGANT@lang}{en}{Theorem}{公式}}
\newtheorem{elemma}{\ifdefstring{\ELEGANT@lang}{en}{Lemma}{引理}}
\newtheorem{ecorollary}{\ifdefstring{\ELEGANT@lang}{en}{Corollary}{推论}}

\theoremstyle{eprostyle}
\newtheorem{eproposition}{\ifdefstring{\ELEGANT@lang}{en}{Proposition}{打油诗}}

\newenvironment{theorem}[2]
  {\ifstrempty{#1}{\etheorem}{\etheorem[#1]}\ifstrempty{#2}{}{\label{thm:#2}}}
  {\endetheorem}

\newenvironment{definition}[2]
  {\ifstrempty{#1}{\edefinition}{\edefinition[#1]}\ifstrempty{#2}{}{\label{def:#2}}}
  {\endedefinition}

\newenvironment{lemma}[2]
  {\ifstrempty{#1}{\elemma}{\elemma[#1]}\ifstrempty{#2}{}{\label{lem:#2}}}
  {\endelemma}

\newenvironment{corollary}[2]
  {\ifstrempty{#1}{\ecorollary}{\ecorollary[#1]}\ifstrempty{#2}{}{\label{cor:#2}}}
  {\endecorollary}

\newenvironment{proposition}[2]
  {\ifstrempty{#1}{\eproposition}{\eproposition[#1]}\ifstrempty{#2}{}{\label{pro:#2}}}
  {\endeproposition}
}{\relax}


\newenvironment{note}{\par\noindent{\makebox[0pt][r]{\scriptsize\color{red!90}\textdbend\quad}\textbf{\color{second}
	\ifdefstring{\ELEGANT@lang}{en}{Note}{注意}
}}\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}}{\par}

\newenvironment{proof}{\par\noindent\textbf{\color{second}
	\ifdefstring{\ELEGANT@lang}{en}{Proof}{证明}
}\color{black!90}\small}{
%\hfill$\Box$\quad
\par}
\newenvironment{remark}{\noindent\textbf{\color{second}
	\ifdefstring{\ELEGANT@lang}{en}{Remark}{注}
}}{\par}
\newenvironment{assumption}{\par\noindent\textbf{\color{third}
	\ifdefstring{\ELEGANT@lang}{en}{Assumption}{假设}
}}{\par}
\newenvironment{conclusion}{\par\noindent\textbf{\color{third}
	\ifdefstring{\ELEGANT@lang}{en}{Conclusion}{结论}
}}{\par}
\newenvironment{solution}{\par\noindent\textbf{\color{main}
	\ifdefstring{\ELEGANT@lang}{en}{Solution}{解}
}\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}}{\vskip2ex\par}
\newenvironment{property}{\par\noindent\textbf{\color{third}
	\ifdefstring{\ELEGANT@lang}{en}{Property}{性质}
}}{\par}
\newenvironment{custom}[1]{\par\noindent\textbf{\color{third}
	\ifdefstring{\ELEGANT@lang}{en}{#1}{#1}
}}{\par}

\RequirePackage{multicol}
\tcbset{
    introduction/.style={
        enhanced,
		breakable,
		colback=structurecolor!10,
		colframe=structurecolor,
  		fonttitle=\bfseries,
  		colbacktitle=structurecolor,
  		fontupper=\ifdefstring{\ELEGANT@lang}{en}{\sffamily}{\kaishu},
  		attach boxed title to top center={yshift=-3mm,yshifttext=-1mm},
  		boxrule=0pt,
  		toprule=0.5pt,
  		bottomrule=0.5pt,
  		top=8pt,
        before skip=8pt,
  		sharp corners
    },
}

\newenvironment{introduction}[1][\ifdefstring{\ELEGANT@lang}{en}{Introduction}{前\ 言}]{
\begin{tcolorbox}[introduction,title={#1}]
\begin{multicols}{2}
\begin{itemize}[label=\textcolor{structurecolor}{\scriptsize\SquareShadowBottomRight}]
}{%
\end{itemize}
\end{multicols}
\end{tcolorbox}}

\tcbset{
	saying/.style={
		coltext=quocol,
    	%width=0.95\linewidth,
    	%center,
    	sharp corners,
        before skip=5pt,
    	boxrule=0pt,
    	leftrule=.8mm,
    	rightrule=0mm,
    },
}

\ifdefstring{\ELEGANT@result}{noanswer}{
	\AtBeginDocument{
	\excludecomment{solution}
	\excludecomment{proof}
	\excludecomment{inline}
	}
}{\relax}


% 页眉页脚
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\fancyhf{}

\if@twoside
\fancyhead[EL,OR]{\color{structurecolor}\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}--\,\thepage/\pageref*{LastPage}\,--}
\fancyhead[ER]{\color{structurecolor}\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}\leftmark{}}
\fancyhead[OL]{\color{structurecolor}\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}\rightmark}
\else
\fancyhead[R]{\color{structurecolor}\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}--\,\thepage/\pageref*{LastPage}\,--}
\fancyhead[L]{\color{structurecolor}\ifdefstring{\ELEGANT@lang}{en}{\itshape}{\kaishu}\rightmark}
\fi

\fancyfoot[c]{\base{structurecolor}{88}}
\renewcommand{\headrule}{\color{structurecolor}\hrule width\textwidth}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{1pt}
% \renewcommand{\headrule}{}
\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\; #1}{} }

% 封面
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

\def\IfEmpty#1{%
  \edef\1{\the#1}
  \ifx\1\empty
}
\def \ifempty#1{\def\temp{#1} \ifx\temp\empty }

\newcommand*{\logo}[1]{
 \def\@logo{\includegraphics[width=10cm]{#1}
 }
}
\ifdefstring{\ELEGANT@device}{normal}{
\newcommand*{\cover}[1]{
 \def\@cover{\includegraphics[width=\linewidth]{#1}
 }
}}{\relax}

\ifdefstring{\ELEGANT@device}{pad}{
\newcommand*{\cover}[1]{
 \def\@cover{\includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{#1}
 }
}}{\relax}

\renewcommand{\baselinestretch}{1.35} 

\renewcommand*{\maketitle}{%
\hypersetup{pageanchor=true}
\begin{titlepage}
	\newgeometry{margin = 0in}
	\parindent=0pt
	\@cover
	\setlength{\fboxsep}{0pt}
	\colorbox{second}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
	\vfill
	\vskip-2ex
	\hspace{3em}
	\parbox{0.8\textwidth}{
		\bfseries\Huge \@title\par
	}
	\vfill
	\vspace{-0.5cm}
	\setstretch{2.5}
	\hspace{4em}
	\begin{minipage}[c]{0.67\linewidth}
		{\color{darkgray}\bfseries\Large \the\subtitle\\[2ex]}
		\color{gray}\normalsize
		{\renewcommand{\arraystretch}{0.618}
		\begin{tabular}{l} 
			\ifdefstring{\ELEGANT@lang}{en}{\textbf{Author:}}{作者：} \@author \\
			\ifdefstring{\ELEGANT@lang}{en}{\textbf{email:}}{邮箱：} \the\email\\
			\ifdefstring{\ELEGANT@lang}{en}{\textbf{Date:}}{日期：} \@date\\
			\ifdefstring{\ELEGANT@lang}{en}{\textbf{Version:}}{版本：} \the\version\\
		\end{tabular}}
	\end{minipage}
	\begin{minipage}[c]{0.27\linewidth}
	\begin{tikzpicture}[remember picture,overlay]
		\begin{pgfonlayer}{background}
		  \node[opacity=1,anchor=south east,outer sep=0pt,inner sep=0pt] at ($(current page.south east) +(-1in,1.56in)$) {\@logo};
		\end{pgfonlayer}
	\end{tikzpicture}
	\end{minipage}
	\vfill
	\begin{center}
	\setstretch{1.3}
	\parbox[t]{0.702\textwidth}{\centering \small \@extrainfo}
	\end{center}
	\vfill
\end{titlepage}
\restoregeometry
\thispagestyle{empty}
}

\RequirePackage{listings} 
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\small\fi
}

\lstset{basicstyle=\ttfamily,style=mystyle,breaklines=true}

\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
	texcsstyle=*\color{winered},
	numbers=none,
	breaklines=true,
	keywordstyle=\color{winered},
	commentstyle=\color{gray},
	emph={elegantpaper,fontenc,fontspec,xeCJK,FiraMono,xunicode,newtxmath,figure,fig,image,img,table,itemize,enumerate,newtxtext,newtxtt,ctex,microtype,description,times,newtx,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,device,color,mode,lang,amsthm,tcolorbox,titlestyle,cite,marginnote,ctex,listings,base},
	emphstyle={\color{frenchplum}},
	morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,extrainfo,logo,cover,subtitle,appendix,chapter,hypersetup,mainmatter,tableofcontents,elegantpar,heiti,kaishu,lstset,pagecolor,zhnumber,marginpar,part,equote,marginnote},
	frame=single,
	tabsize=2,
	rulecolor=\color{structurecolor},
	framerule=0.2pt,
	columns=flexible,
}