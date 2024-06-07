\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjfu}[2024/06/07 A template for bjfu postgraduate thesis]
\LoadClass[UTF8]{ctexart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%协议：MIT协议（http://opensource.org/licenses/MIT）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%对于包的使用
\RequirePackage{gbt7714}
%超链接
\RequirePackage[colorlinks,citecolor=black,linkcolor=black,urlcolor=blue]{hyperref}
%板式
\RequirePackage{geometry}
%图片
\RequirePackage{graphicx}
%图表标题
\RequirePackage{bicaption}
\captionsetup{justification=centering}
%\captionsetup{font = 10.5pt}
%目录样式
\RequirePackage{tocloft}
\RequirePackage{titletoc}
%子图
\RequirePackage{subcaption}
%页眉页脚控制
\RequirePackage{fancyhdr}
%非汉字字体设置
\RequirePackage{fontspec}
%控制参考文献格式
% \RequirePackage[square,super, comma, sort&compress, numbers]{natbib}
% \RequirePackage[author, year]{natbib}
\RequirePackage{natbib}
%计数器控制
\RequirePackage{amsmath}
\RequirePackage{amsthm}
%表格控制
\RequirePackage{multirow} 
\RequirePackage{array}
% use xifthen
\RequirePackage{xifthen}
%插入代码
%\RequirePackage{listings}
%设置列表格式
%\RequirePackage{enumitem}
\RequirePackage{changepage}
%本人论文的一些包
\RequirePackage{fix-cm}
%\RequirePackage{graphicx}
\RequirePackage{bm}
%\RequirePackage[fleqn]{amsmath}
%\setlength{\mathindent}{0cm}
\RequirePackage{amssymb}
\RequirePackage{lipsum, mathtools, cuted}
\RequirePackage{enumerate}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
%\RequirePackage{subfigure}
\RequirePackage{paralist}
\RequirePackage{verbatim}
%算法宏包
% \RequirePackage{algorithm}
% \RequirePackage{algorithmic}
\RequirePackage[linesnumbered,ruled,vlined]{algorithm2e}

%超链接宏包
\RequirePackage{hyperref}
\RequirePackage{prettyref}
%首行缩进宏包
\RequirePackage{indentfirst}
\setlength{\parindent}{1em}
\allowdisplaybreaks[4]

%跨页表格
\RequirePackage{longtable}
\RequirePackage{multirow}

%脚注
\RequirePackage{footnote}

%三线表
\RequirePackage{array, caption, threeparttable}
\RequirePackage{caption}
\captionsetup[table]{
	singlelinecheck = false,
}
\RequirePackage{mathrsfs}
\RequirePackage{color}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
%插入pdf页面
\RequirePackage{pdfpages}
%\newcommand{\red}[1]{\textcolor{red}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% =========== 页面设置 =========================================================
%论文一律编排并打印在A4幅面白纸上
%研究生毕业论文要求为
%上边距为30mm，下边距为25mm，左边距为30mm，右边距为25mm
\geometry{a4paper,left=30mm,right=25mm,top=30mm,bottom=25mm}

%论文行间距为1.5倍（可能需要用\selectfont）
\linespread{1.25}

%页眉页脚开启
%\setboolean{@twoside}
\pagestyle{fancy}
\fancyhead[CO]{\leftmark}
\fancyhead[CE]{\zihao{5}\CJKfamily{zhsong}\bjfuTitleString}
%页眉只有中间有内容，左右为空白
\lhead{} 
\rhead{}
\setlength{\voffset}{0mm}                        

%页眉下边的横线宽度：
\renewcommand{\headrulewidth}{0.8pt}

%论文页码的字号字体为小五号Times New Roman体
%从绪论部分开始，至附录，用阿拉伯数字连续编排
%页码位于页面底端居中
\renewcommand{\footnotesize}{\zihao{-5}}  
%论文中出现的所有数字和字母如无特殊要求都用Times New Roman体。
%设置正文非汉字的字体为Times New Roman
\setmainfont{Times New Roman}

% =============== 图、表 标头设置 ====================================
%设置英文图为Fig，表格为Tab
\DeclareCaptionOption{english}[]{
\renewcommand\figurename{Figure}
\renewcommand\tablename{Table}}
\captionsetup[bi-second]{english}

%一定要在这里声明space，直接声明不好使，小五号
\captionsetup{labelsep=space}
\let\mysection\section \def\section{\clearpage\mysection} 
%设置图片编号随着章节自动清零
\numberwithin{figure}{section}
%设置公式编号随着章节自动清零
\numberwithin{equation}{section}
%设置表格编号随着章节自动清零
\numberwithin{table}{section}



%定义图的编号为章节号码.序号
\renewcommand{\thefigure}{\thesection.\arabic{figure}}
%定义公式的编号为章节号码-序号
\renewcommand{\theequation}{\thesection-\arabic{equation}}
%定义表格的编号为章节号码.序号
\renewcommand{\thetable}{\thesection.\arabic{table}}

%定义条的编号为序号
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}

%改变figure为图
\renewcommand{\figureautorefname}{图}

%改变equation为式
\renewcommand{\equationautorefname}{式}

%改变table为表
\renewcommand{\tableautorefname}{表}

%改变section为章、节、条
\renewcommand{\subsectionautorefname}{章节}
\renewcommand{\sectionautorefname}{章}
\renewcommand{\subsubsectionautorefname}{章节}

%改变定理、证明环境
\renewcommand{\proofname}{{\heiti 证明}}
%章标题：四号宋体加粗
%section另起一页，宋体四号加粗居中
% 一级标题黑体三号
%\CTEXsetup[format={\pagebreak\centering\zihao{3}\CJKfamily{hei}}]{section}
\CTEXsetup[format={\zihao{3}\heiti}]{section}
%\CTEXsetup[format={\pagebreak\centering\zihao{3}\heiti}]{section}
%节标题：小四号宋体加粗
% 二级标题黑体小三号
%\CTEXsetup[format={\zihao{-3}\CJKfamily{hei}}]{subsection}
\CTEXsetup[format={\zihao{-3}\heiti}]{subsection}
% 三级标题宋体四号
\CTEXsetup[format={\zihao{4}\CJKfamily{zhsong}}]{subsubsection}

\makeatother

\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}

\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}



% 该引用格式可基本实现北京林业大学研究生毕业论文写作指南中的要求
\bibliographystyle{gbt7714-numerical}


%%%%
% 汉语标题
\newcommand{\bjfuTitle}[1]{\def\bjfuTitleString{#1}}
% 英语标题
\newcommand{\bjfuTitleEn}[1]{\def\bjfuTitleEnString{#1}}
% 汉语作者
\newcommand{\bjfuAuthor}[1]{\def\bjfuAuthorString{#1}}
% 英语作者
\newcommand{\bjfuAuthorEn}[1]{\def\bjfuAuthorEnString{#1}}
% 英语专业
\newcommand{\bjfuMajorEn}[1]{\def\bjfuMajorEnString{#1}}
% 英语指导老师
\newcommand{\bjfuSupervisorEn}[1]{\def\bjfuSupervisorEnString{#1}}
% 汉语摘要
\newcommand{\bjfuAbstract}[1]{\def\bjfuAbstractString{#1}}
% 英语摘要
\newcommand{\bjfuAbstractEn}[1]{\def\bjfuAbstractEnString{#1}}
% 汉语关键字
\newcommand{\bjfuKeywords}[1]{\def\bjfuKeywordsString{#1}}
% 英语关键字
\newcommand{\bjfuKeywordsEn}[1]{\def\bjfuKeywordsEnString{#1}}
% 标题第一行
\newcommand{\bjfuTitleFirstLine}[1]{\def\bjfuTitleFirstLineString{#1}}
% 标题第二行
\newcommand{\bjfuTitleSecondLine}[1]{\def\bjfuTitleSecondLineString{#1}}

\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% 标题页
\newcommand{\makeBjfuTitlePage}{
%\thispagestyle{fancy}
% 注意！本模板采用直接插入pdf文件的方法导入封面和独创性声明等难以排版的页面，
% 请通过word（或其他软件）将封面、独创性声明和答辩委员会成员输出为pdf后，
% 通过\includepdf{}语句插入：
% \includepdf[pages={1,2,3}]{statement.pdf} 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%论文摘要和目录用罗马数字单独编页码。
\begin{titlepage}
\thispagestyle{fancy}
\pagenumbering{Roman}
%中文标题
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancyhead[CO]{\zihao{5}\CJKfamily{zhsong}摘要}
\renewcommand{\headrulewidth}{0.8pt}
%“摘要”字样用四号宋体加粗居中
\begin{center}
\zihao{3}\CJKfamily{zhsong}{\heiti 摘要}
\end{center}

%摘要正文主体部分用小四号宋体，1.5 倍行
{\linespread{1.5}
\zihao{-4}\CJKfamily{zhsong}\bjfuAbstractString}
%“关键词”字样后带冒号，中文关键词为小四号宋体。
{\zihao{-4}\CJKfamily{zhsong}\textbf{\\关键词：}\bjfuKeywordsString}
\pagebreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%英文题目用小三号Times New Roman体，单倍行距，段前 0.5 行，段后 1 行；
% 请注意在此修改英文摘要页的姓名与专业，
% 也请务必注意在盲审时删去姓名与专业等信息！！！
\fancyhead[C]{\zihao{5}\CJKfamily{zhsong}Abstract}
\renewcommand{\headrulewidth}{0.8pt}
\begin{center}
\zihao{-3}{\bjfuTitleEnString }\\
\zihao{-4}{Master Candidate: \bjfuAuthorEnString} \\
\zihao{-4}{(\bjfuMajorEnString)} \\
\zihao{-4}{Directed by \bjfuSupervisorEnString} \\
\zihao{-3}{ABSTRACT}
\end{center}

%英文摘要正文
{\linespread{1.5}
\zihao{5} \bjfuAbstractEnString \\\\
}
%英文关键词为五号Times New Roman体加粗
\zihao{-4}{\textbf{Key Words：}\bjfuKeywordsEnString}

% ============== 目录自动生成 ==================================
%\pagebreak
\clearpage
\thispagestyle{fancy}
\fancyhead[C]{\zihao{5}\CJKfamily{zhsong}目录}
\renewcommand{\headrulewidth}{0.8pt}
\setlength{\cftsubsecindent}{1em}
\setlength{\cftsubsubsecindent}{2em}
% 替换\tableofcontents的标题Contents为“目录”
\renewcommand*\contentsname{\hfill {\zihao{3}\CJKfamily{zhsong}目录} \hfill}
{\zihao{5}
\titlecontents{section}[0pt]{\addvspace{2pt}\filright}              
{\contentspush{\thecontentslabel\ 
}}              
{}{\titlerule*[8pt]{.}\contentspage}

{\tableofcontents
	\fancypagestyle{plain}{ \pagestyle{fancy} }
	\fancyhead[C]{\zihao{5}\CJKfamily{zhsong}目录}
	\renewcommand{\headrulewidth}{0.8pt}
}
}

\pagebreak
\end{titlepage}

%自正文开始，使用阿拉伯数字且重新开始页码
%论文页码的字号字体为小五号Times New Roman体，页码位于页面底端居中；
\pagenumbering{arabic}
}
