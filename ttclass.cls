
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{ttclass}[2009/05/07 v2.1]

%% option.styというファイルで比較的容易に基本的な
%% 体裁情報を設定できるようにしています．
%% option.sty以外の情報については下の設定をご覧になって
%% 再設定を行ってください．

%% 文字サイズと行送り用の変数の宣言です．
\newdimen\@@tiny
\newdimen\@@scriptsize
\newdimen\@@footnotesize
\newdimen\@@small
\newdimen\@@normalsize
\newdimen\@@large
\newdimen\@@Large
\newdimen\@@LARGE
\newdimen\@@huge
\newdimen\@@Huge
\newdimen\@@HUGE
\newdimen\@@tiny@@baseline
\newdimen\@@scriptsize@@baseline
\newdimen\@@footnotesize@@baseline
\newdimen\@@small@@baseline
\newdimen\@@normalsize@@baseline
\newdimen\@@large@@baseline
\newdimen\@@Large@@baseline
\newdimen\@@LARGE@@baseline
\newdimen\@@huge@@baseline
\newdimen\@@Huge@@baseline
\newdimen\@@HUGE@@baseline

%% \@@`SIZENAME'に各フォントサイズのデフォルト値をセットします．
%%（単位は問いません）
%% \@@`SIZENAME'@@baselineは`SIZENAME'に対応させる行送りです．
%% 初期値の各割り当てはご覧の通りです．
% 文字サイズ		行送り
\@@tiny=7Q		\@@tiny@@baseline=9Q
\@@scriptsize=10Q	\@@scriptsize@@baseline=12Q
\@@footnotesize=11Q	\@@footnotesize@@baseline=14Q
\@@small=12Q		\@@small@@baseline=16Q
\@@normalsize=13Q	\@@normalsize@@baseline=21Q
\@@large=14Q		\@@large@@baseline=20Q
\@@Large=15Q		\@@Large@@baseline=21Q
\@@LARGE=16Q		\@@LARGE@@baseline=24Q
\@@huge=20Q		\@@huge@@baseline=29Q
\@@Huge=25Q		\@@Huge@@baseline=31Q
\@@HUGE=45Q		\@@HUGE@@baseline=61Q



%% \bfsなる書体切り替えコマンドを新設しています．
%% この\bfsは各パーツの\bfseries に置き換えるように定義してます．
%% クラスオプション[gtsf]でこれは\sffamily+\gtfamilyに置き換わります．
%% 例： \documentclass[gtsf,tombow]{ttcalss}
%% これにより，見出しやキャプションなど主要なパーツは\sffamily+\gtfamily
%% になります．\bf や\textbfでは従来通り(\rmfamily bfseries)+\gtfamily
%% ですのでご留意ください．
%% この点について当初\bf と\textbfでも\sffamily+\gtfamilyの組合せにしようと
%% 思いましたがとりあえず止めにしています．
%% \sffamilyに\gtfamilyを連動させていますので，
%% 本文中でこの組合せにしたい場合は\sf, \textsfとします．
%% 
%\DeclareRobustCommand*{\bfs}{\kanjifamily\gtdefault\romanfamily\sfdefault\selectfont}
\DeclareRobustCommand*{\bfs}{\rmfamily\bfseries}
%%%\renewcommand{\sfdefault}{phv}

%%\DeclareTextFontCommand{\textbf}{\rmfamily\bfseries}

%% 各パーツにフォントとサイズをセットします．
%% \@@`パーツ名'Fontの規則で命名しています．
%% 命名文字列にある`Num'はそれぞれに印字されるカウンタへのフォントサイズ設定です
 \newcommand{\@@ChapterFont}             {\reset@font\Huge\bfs}
 \newcommand{\@@ChapterNumFont}          {\reset@font\huge\bfs}
 \newcommand{\@@Indexheadfont}           {\reset@font\huge\bfs}%
 \newcommand{\@@SectionFont}             {\reset@font\Large\bfs}
 \newcommand{\@@SectionNumFont}          {\relax}
 \newcommand{\@@subSectionFont}          {\reset@font\large\bfs}
 \newcommand{\@@subSectionNumFont}       {\reset@font\large\bfs}
 \newcommand{\@@subsubSectionFont}       {\reset@font\normalsize\bfs}
 \newcommand{\@@subsubSectionNumFont}    {\reset@font\normalsize\bfs}
 \newcommand{\@@ParagraphFont}           {\reset@font\normalsize\bfs}
 \newcommand{\@@subParagraphFont}        {\reset@font\normalsize\bfs}
 \newcommand{\@@CaptionFont}             {\reset@font\small}
 \newcommand{\@@PageNumFont}             {\reset@font\small}
 \newcommand{\@@HeaderFont}              {\reset@font\small}
 \newcommand{\@@TocPartFont}             {\Large\bfs}
 \newcommand{\@@TocNumPartFont}          {\Large\bfs}
 \newcommand{\@@TocChapterFont}          {\bfs}
 \newcommand{\@@TocNumChapterFont}       {\bfs}
 \newcommand{\@@TocSectionFontt}         {\reset@font\rmfamily \normalcolor}
 \newcommand{\@@TocsubSectionFont}       {\reset@font\rmfamily \normalcolor}
 \newcommand{\@@TocsubsubSectionFont}    {\reset@font\rmfamily \normalcolor}
 \newcommand{\@@TocNumSectionFont}       {\reset@font\rmfamily \normalcolor}
 \newcommand{\@@TocNumsubSectionFont}    {\reset@font\rmfamily \normalcolor}
 \newcommand{\@@TocNumsubsubSectionFont} {\reset@font\rmfamily \normalcolor}
 \newcommand{\@@MarginparFont}           {\fontsize{10Q}{12Q}\selectfont}

%% 基本体裁簡易設定用のパラメータです．
\def\PublisherDefined#1{\def\PublisherDefined{#1}}
\PublisherDefined{東京図書株式会社}%% \maketitleで印字されます．\publisher{}の指定があればそれが優先されます．
\let\左右\relax
\let\天地\relax
\let\@@Para\relax

%% 各条件分岐の宣言です．
\newif\if@Koguchi\@Koguchifalse
\newif\if@BfSf\@BfSffalse
\newif\if@JisTFM\@JisTFMtrue
\newif\if@PsJfont\@PsJfontfalse
\newif\ifPaperSizeA\PaperSizeAtrue
\newif\ifPaperSizeB\PaperSizeBfalse
\newif\ifS@ection\S@ectionfalse
\newif\ifsubS@ection\subS@ectionfalse
\newif\ifsubsubS@ection\subsubS@ectionfalse
\newif\ifAFour\AFourfalse
\newif\if@noinputoption\@noinputoptionfalse
\newif\if@keepfline@@\@keepfline@@false
%\@keepfline@@true
%% どの見出しレベルで\@startsectionが実行されたかを
%% 判断して\section～\subsectionまでの文字サイズをセットします．
\newcommand{\@SectionSlectNumFont}{%
\ifS@ection
  \@@SectionNumFont
\else
   \ifsubS@ection
     \@@subSectionNumFont
   \else
     \ifsubsubS@ection
       \@@subsubSectionNumFont
     \else
        \relax
     \fi
    \fi
\fi
}
%% どの見出しレベルの\@dottedtoclineが実行されたかを
%% 判断して目次の文字サイズをセットします．
\newcommand{\@TocSectionSlectFont}{%
\ifS@ection
  \@@TocSectionFontt
\else
   \ifsubS@ection
     \@@TocsubSectionFont
   \else
     \ifsubsubS@ection
       \@@TocsubsubSectionFont
     \else
         \reset@font\rmfamily \normalcolor
     \fi
    \fi
\fi
}
%% 同じです．これは目次で引かれるページ番号
\newcommand{\@TocSectionNumSlectFont}{%
\ifS@ection%
  \@@TocNumSectionFont%
\else%
   \ifsubS@ection%
     \@@TocNumsubSectionFont%
   \else%
     \ifsubsubS@ection%
      \@@TocNumsubsubSectionFont%
     \else%
        \reset@font\rmfamily \normalcolor%
      \fi%
     \fi%
\fi%
}
% 禁則penaltyの補正です．
\prebreakpenalty\jis"2147=10000
\postbreakpenalty\jis"2148=10000
\prebreakpenalty\jis"2149=10000
%% このあたりはjbookのままです．
%% ただbannerfontは趣味でスラントにしました．
\newif\if@landscape \@landscapefalse
\newcommand{\@ptsize}{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\hour\time \divide\hour by 60\relax
\@tempcnta\hour \multiply\@tempcnta 60\relax
\minute\time \advance\minute-\@tempcnta
\newif\if@stysize \@stysizefalse
\newif\if@enablejfam \@enablejfamtrue
\font\@bannerfont=cmsl8
\DeclareOption{tombow}{%
  \tombowtrue \tombowdatetrue
  \setlength{\@tombowwidth}{.1\p@}%
  \@bannertoken{p\LaTeXe:\space%
     \jobname\space:\space\number\year/\number\month/\number\day
      (\number\hour:\number\minute)}
  \maketombowbox}
\DeclareOption{tombo}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{.1\p@}%
  \maketombowbox}
\DeclareOption{mentuke}{%
  \tombowtrue
  \setlength{\@tombowwidth}{\z@}%
  \@bannertoken{\@empty}
  \maketombowbox}
\DeclareOption{tate}{%
  \AtBeginDocument{\tate\message{《縦組モード》}% 縦組モードは動作未確認.
                   \adjustbaseline}%
}
%% cmscale, gtsfなどを追加しています．
%% gtsfは\bsfをボールドからサンセリフにします．
%% cmscaleはスケーラブルでmagを修正したcmfontをloadします．（初期値）
%% noinputoptionはoption.styを読み込みをしないオプションです．
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{cmscale}{\input{cmscale.sty}}
\DeclareOption{gtsf}{\@BfSftrue}
\DeclareOption{A4size}{\AFourtrue}%% 用紙サイズをA4にします．
\DeclareOption{noinputoption}{\@noinputoptiontrue}%% 設定ファイルを読まない．
\DeclareOption{keepfline}{\@keepfline@@true}
%% 上はページの第一行目に背の高い文字が来ても極力一行目が下にずれないための処置です．ただし，大きな文字を使った\sectionなどでも天をはみ出してしまう副作用があるのでデフォルトはfalseにしてます．せっかく設定したのでオプション扱いで残します．
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}}
\DeclareOption{disablejfam}{\@enablejfamfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{min10}{\@JisTFMfalse}
\DeclareOption{multijfont}{\@PsJfonttrue}
%% 仕上がりの設定．
%% 想定している仕上がりサイズはA5正寸，B5正寸，B5変形(210mm×182mm)の三つです．
\DeclareOption{b5}{%
\PaperSizeBtrue%
\setlength\paperheight{257mm}%
\setlength\paperwidth{182mm}%
    \setlength\textwidth{\@@normalsize}
    \multiply\textwidth 43
    \setlength\textheight{38\@@normalsize@@baseline}
\if@keepfline@@
    \setlength\topskip{\@@normalsize@@baseline}
\else
    \setlength\topskip{\Cht}
\fi
    \advance\textheight by\topskip
}
\DeclareOption{b5var}{% b5Defからb5varに変えました．
\PaperSizeBtrue%
\setlength\paperheight{210mm}%
\setlength\paperwidth{182mm}%
    \setlength\textwidth{\@@normalsize}
    \multiply\textwidth 43
    \setlength\textheight{32\@@normalsize@@baseline}
\if@keepfline@@
    \setlength\topskip{\@@normalsize@@baseline}
\else
    \setlength\topskip{\Cht}
\fi
    \advance\textheight by\topskip
}
\DeclareOption{a5}{%
\PaperSizeAtrue%
\setlength\paperheight{210mm}%
\setlength\paperwidth{148mm}%
    \setlength\textwidth{\@@normalsize}
    \multiply\textwidth 33
    \setlength\textheight{28\@@normalsize@@baseline}
\if@keepfline@@
    \setlength\topskip{\@@normalsize@@baseline}
\else
    \setlength\topskip{\Cht}
\fi
    \advance\textheight by\topskip
}
\ExecuteOptions{a5,twoside,cmscale,onecolumn,final,openright}
\ProcessOptions\relax

%% \@@marginparwidthというのが\marginparwidthに代入されますが，同時に
%% \marginparwidthの手動指定のフラグになってます．この値が0pt以上になっていると
%% それが\marginparwidthの長さになります．初期値は0ptにして，
%% 変更はoption.styで行います．
%% option.sty側でも0pt（もしくは無指定）にしていると\marginparwidthは
%% \evensidemarginの長さの0.8倍になるようにしました．
\newdimen\@@marginparwidth
\@@marginparwidth=0pt

\DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}
\DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}

%% noinputoptionが指定されている場合，option.styが読まれていない旨のアラートの表示です．
\if@noinputoption
\typeout{-----Attention!!-----^^Joption.sty is not read. Are you all right? ^^J---------------------}
\relax
\else
%% option.styで基本体裁を設定するときのパラメータを代入するマクロです．
%% 日本語を使ってわかりやすくしています．
\def\本文サイズ#1{\setlength{\@@normalsize}{#1}}
\def\行送り#1{\setlength{\@@normalsize@@baseline}{#1}}
\def\左右#1{\gdef\左右{#1}}
\def\天地#1{\gdef\天地{#1}}
\def\小口#1{\@Koguchitrue\gdef\@小口{#1}}
\def\柱#1#2{\gdef\柱{\fontsize{#1}{#1}\relax\selectfont#2}}
\def\ノンブル#1#2{\gdef\ノンブル{\fontsize{#1}{#1}\selectfont\relax\selectfont#2}}
%% option.styを読み込み，その後設定された情報を各パラメータにセットします．
\input option.sty
\setlength\textwidth{\@@normalsize}
\multiply\textwidth \左右
\setlength\textheight{\@@normalsize@@baseline}
\multiply\textheight \天地
\advance\textheight by-\@@normalsize@@baseline
\if@keepfline@@
	\topskip\@@normalsize@@baseline
\else
	\topskip\Cht
\fi
\advance\textheight by\topskip
\renewcommand{\@@PageNumFont}{\reset@font\ノンブル}
\renewcommand{\@@HeaderFont}{\reset@font\柱}
\fi

%% \sffamilyとttfamilyで従属和文をゴシックにするようにしています．
%% jsbookに準拠です．
\DeclareRobustCommand\sffamily
        {\not@math@alphabet\sffamily\mathsf
         \romanfamily\sfdefault\kanjifamily\gtdefault\selectfont}
\DeclareRobustCommand\ttfamily
        {\not@math@alphabet\ttfamily\mathtt
         \romanfamily\ttdefault\kanjifamily\gtdefault\selectfont}
\if@BfSf
     \DeclareRobustCommand*{\bfs}
        {\kanjifamily\gtdefault\romanfamily\sfdefault\selectfont}
%% \bfsはデフォルトでは\rmfamily\bfseries+\gtfamilyにしていますが，
%% クラスオプションgtsfを指定すると\sffamily+\gtfamily になります．
%% ここで\sffamilyを再定義して和文ゴシックと連動させるようにしています．
%-------
%% *下の行をアクティブにすれば，\bfsに関わらず\bfseries以下\bf，\textbfで\sffamily+\gtfamilyになります．
%% その場合で注意が必要なのは数式で，数式中で\textbfを用いると\sffamilyなり，\bfを
%% 使うとboldが出力されます．(つまり数式中でboldを使いたい場合は\bfが必要です)
%     \DeclareRobustCommand\bfseries
%        {\not@math@alphabet\bfseries\mathbf
%        \kanjifamily\gtdefault\romanfamily\sfdefault\selectfont}
\fi

%% 設定した文字サイズとそれぞれの行送りを整数化します．
\edef\@vpt{\strip@pt\@@tiny}
\edef\@viipt{\strip@pt\@@scriptsize}
\edef\@viiipt{\strip@pt\@@footnotesize}
\edef\@ixpt{\strip@pt\@@small}
\edef\@xpt{\strip@pt\@@normalsize}
\edef\@xipt{\strip@pt\@@large}
\edef\@xiipt{\strip@pt\@@Large}
\edef\@xivpt{\strip@pt\@@LARGE}
\edef\@xviipt{\strip@pt\@@huge}
\edef\@xxpt{\strip@pt\@@Huge}
\edef\@xxvpt{\strip@pt\@@HUGE}
\edef\@tiny@@base@@line{\strip@pt\@@tiny@@baseline}
\edef\@scriptsize@@base@@line{\strip@pt\@@scriptsize@@baseline}
\edef\@footnotesize@@base@@line{\strip@pt\@@footnotesize@@baseline}
\edef\@small@@base@@line{\strip@pt\@@small@@baseline}
\edef\@normalsize@@base@@line{\strip@pt\@@normalsize@@baseline}
\edef\@large@@base@@line{\strip@pt\@@large@@baseline}
\edef\@Large@@base@@line{\strip@pt\@@Large@@baseline}
\edef\@LARGE@@base@@line{\strip@pt\@@LARGE@@baseline}
\edef\@huge@@base@@line{\strip@pt\@@huge@@baseline}
\edef\@Huge@@base@@line{\strip@pt\@@Huge@@baseline}
\edef\@HUGE@@base@@line{\strip@pt\@@HUGE@@baseline}


%% 使用するjtfmをjis系にします．
%% 使うことは稀であろうとは思いますが
%% クラスオプションmin10で旧来のmin10.tfmが使えます．
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@JisTFM
\def\JfontTfmM{jis}\def\JfontTfmG{jisg}
\def\JfontTfmMsl{jis}\def\JfontTfmGsl{jisg}
\typeout{%
--------------^^J%
JFM=jistfm.tfm^^J%
--------------}
\else
\def\JfontTfmM{min10}\def\JfontTfmG{goth10}
\def\JfontTfmMsl{min10}\def\JfontTfmGsl{goth10}
\typeout{%
-------------^^J
JFM=min10.tfm^^J%
-------------}
\fi
%% min10.tfm由来の和文フォントサイズを補正しています．
%% pTeXではcmフォントに大きさを合わせるために，和文サイズを
%% 約0.961倍程度に縮小して出力します．
%% そのため，13Qを出力させたくても13*0.961=12.493Qという中途半端な
%% 大きさになってしまいます．
%% ここでこれを補正して13Qと指定すれば実サイズで13Qが出力されるように
%% しています．この補正は本クラスファイルに付随するmultijfont.styでも継承しています．
\DeclareKanjiFamily{JY1}{rm-l}{}
\DeclareKanjiFamily{JT1}{rm-l}{}
\DeclareFontShape{JY1}{rm-l}{m}{n}{<-> s *  [1.0392676] \JfontTfmM}{}
\DeclareFontShape{JY1}{rm-l}{m}{sl}{<-> s * [1.0392676] \JfontTfmMsl}{}
\DeclareFontShape{JY1}{rm-l}{bx}{n}{<-> s *  [1.0392676] \JfontTfmG}{}
\DeclareFontShape{JY1}{rm-l}{bx}{sl}{<-> s * [1.0392676] \JfontTfmGsl}{}
\DeclareFontShape{JT1}{rm-l}{m}{n}{<-> s *  [1.0392676] tmin10}{}
\DeclareFontShape{JT1}{rm-l}{bx}{n}{<-> s *  [1.0392676] tgoth10}{}

\DeclareKanjiFamily{JY1}{gbm}{}
\DeclareKanjiFamily{JT1}{gbm}{}
\DeclareFontShape{JY1}{gbm}{m}{n}{<-> s *  [1.0392676] \JfontTfmG}{}
\DeclareFontShape{JY1}{gbm}{bx}{n}{<-> s *  [1.0392676] \JfontTfmG}{}
\DeclareFontShape{JY1}{gbm}{m}{sl}{<-> s * [1.0392676] \JfontTfmGsl}{}
\DeclareFontShape{JY1}{gbm}{bx}{sl}{<-> s * [1.0392676] \JfontTfmGsl}{}
\DeclareFontShape{JT1}{gbm}{m}{n}{<-> s *  [1.0392676] tgoth10}{}
\DeclareFontShape{JT1}{gbm}{bx}{n}{<-> s *  [1.0392676] tgoth10}{}

\renewcommand{\mcdefault}{rm-l}
\renewcommand{\gtdefault}{gbm}
%% New-CIDによる多書体用の設定を読み込みます．
%% クラスオプションmultijfontで読まれます．
%% 実際の運用には各tfm, vfファイル，それに応じて設定されたdvips用のmapファイルが必要です．
\if@PsJfont
\input multijfont.sty
\fi

%% 各サイズコマンドの設定です．
%% たとえば\normalsizeの場合，\@xptと\@normalsize@@base@@lineは事前に整数化
%% されたものをここで使います．
\DeclareMathSizes{\@xpt}{\@xpt}{6}{5}
\renewcommand{\normalsize}{%
\@setfontsize\normalsize\@xpt{\@normalsize@@base@@line}%
\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@%
\abovedisplayshortskip \z@ \@plus3\p@%
\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@%
\belowdisplayskip \abovedisplayskip%
\let\@listi\@listI}
\normalfont\normalsize
\setbox0\hbox{\char\euc"A1A1}%
\setlength\Cht{\ht0}
\setlength\Cdp{\dp0}
\setlength\Cwd{\wd0}
\setlength\Cvs{\baselineskip}
\setlength\Chs{\wd0}
\setlength\parindent{1\Cwd}

\newcommand{\small}{%
  \@setfontsize\small\@ixpt{\@small@@base@@line}%
\abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
\abovedisplayshortskip \z@ \@plus2\p@
\belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
\def\@listi{\leftmargin\leftmargini
   \topsep .5\baselineskip
   \parsep \z@
   \itemsep \parsep}%
\belowdisplayskip \abovedisplayskip}

\newcommand{\footnotesize}{%
  \@setfontsize\footnotesize\@viiipt{\@footnotesize@@base@@line}%
\abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
\abovedisplayshortskip \z@ \@plus\p@
\belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
\def\@listi{\leftmargin\leftmargini
   \topsep .5\baselineskip
   \parsep \z@
  \itemsep \parsep}%
\belowdisplayskip \abovedisplayskip}
\newcommand{\scriptsize}{\@setfontsize\scriptsize\@viipt\@scriptsize@@base@@line}
\newcommand{\tiny}{\@setfontsize\tiny\@vpt\@tiny@@base@@line}
\newcommand{\large}{\@setfontsize\large\@xipt{\@large@@base@@line}}
\newcommand{\Large}{\@setfontsize\Large\@xiipt{\@Large@@base@@line}}
\newcommand{\LARGE}{\@setfontsize\LARGE\@xivpt{\@LARGE@@base@@line}}
\newcommand{\huge}{\@setfontsize\huge\@xviipt{\@huge@@base@@line}}
\newcommand{\Huge}{\@setfontsize\Huge\@xxpt{\@Huge@@base@@line}}
\newcommand{\HUGE}{\@setfontsize\HUGE\@xxvpt{\@HUGE@@base@@line}}

%% \headheightの高さを算出します．
%% ノンブルと柱で違う文字サイズが設定されることもあるので，
%% 大きいほうの高さを\headheightとして設定します．
\setbox0\hbox{\@@HeaderFont\char\euc"A1A1}%
\setbox2\hbox{\@@PageNumFont\char\euc"A1A1}%
\ifdim\ht0>\ht2\@tempdima\ht0\else\@tempdima\ht2\fi
\setlength\headheight{\@tempdima}
\setlength\headsep{4mm}
%% ページの第一行目に背の高い文字が来ても行が出来るだけ下にずれないための処置です．そのままでは判面天地位置がおかしくなるので，\headsepで補正しつつ，\topmarginの算出方法を変えました．<- 試験的に設定しましたが，\sectionなどでも版面を天方向に飛び出してしまうので止めています．せっかくなのでクラスオプション[keepfline]で\@keepfline@@trueが有効になる設定は残しています．
\if@keepfline@@
	\setlength\topskip{\baselineskip}
	\advance\headsep by-\topskip
	\advance\headsep by\Cht
\else
	\setlength\topskip{\Cht}
\fi
%%%%
\setlength\footskip{.35in}
\setlength\maxdepth{.5\topskip}
\setlength\marginparsep{.5zw}

%%%%%%%%%%%%%%%%
%% \@@evensidemarginは\marginparwidthを決めるための保存用です．
%% \marginparwidthは\marginparsepを引いた\evensidemarginの0.8倍にしてます．
%% \小口の指定がある場合も\marginparsepを引いた0.8倍です．
\newdimen\@@evensidemargin
\setlength\columnsep{2zw}
\columnseprule\z@
\setlength\oddsidemargin{\paperwidth}\advance\oddsidemargin-\textwidth
\setlength\evensidemargin{.5\oddsidemargin}
\setlength\oddsidemargin{\evensidemargin}
\setlength\@@evensidemargin{\evensidemargin}
\topmargin\paperheight
\advance\topmargin by-\textheight
\topmargin.5\topmargin
\advance\topmargin by-\headsep
\advance\topmargin by-\headheight
\advance\topmargin-1in
\advance\oddsidemargin-1in
\advance\evensidemargin-1in
%%%%%%
\setlength\footnotesep{6.65\p@}
%\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength{\skip\footins}{12\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep    {12pt \@plus0pt \@minus2pt}%  209版 ky_a5.sty 準拠
\setlength\textfloatsep{15.5pt \@plus0pt \@minus2pt}% 209版 ky_a5.sty 準拠
\setlength\intextsep   {11pt \@plus0pt \@minus2pt}% 209版 ky_a5.sty 準拠
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
  \parsep \z@
 \topsep.5\baselineskip
  \itemsep \z@}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii \advance\labelwidth-\labelsep
 \topsep.5\baselineskip
   \parsep \z@
   \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
   \labelwidth\leftmarginiii \advance\labelwidth-\labelsep
 \topsep.5\baselineskip
   \parsep \z@
   \partopsep \z@
   \itemsep\topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%% 写研sapcolのGKの感じにしたいとき．
%\@tempdima\baselineskip
%\advance\@tempdima  by-\Cht
%\advance\@tempdima  by-\Cdp
%\lineskip=\@tempdima
%\setlength\normallineskip{\lineskip}
\lineskip1\p@
\setlength\normallineskip{1\p@}
\setlength\lineskiplimit{1\p@}
\setlength\normallineskiplimit{1\p@}
\renewcommand{\baselinestretch}{}
\setlength\parskip{\z@}
\setlength\parindent{1\Cwd}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{1}
\setcounter{totalnumber}{3}
\setcounter{dbltopnumber}{2}
\renewcommand{\topfraction}{.7}
\renewcommand{\bottomfraction}{.3}
\renewcommand{\textfraction}{.2}
\renewcommand{\floatpagefraction}{.5}
\renewcommand{\dbltopfraction}{.7}
\renewcommand{\dblfloatpagefraction}{.5}

\def\ps@plain{\let\@mkboth\@gobbletwo
   \let\ps@jpl@in\ps@plain
   \def\@oddhead{\@@PageNumFont\hfil\thepage}
   \let\@oddfoot\@empty%
   \def\@evenhead{\@@PageNumFont{\thepage}\hfil}
   \let\@evenfoot\@empty}

\let\ps@jpl@in\ps@plain

\def\ps@headnombre{\let\@mkboth\@gobbletwo
    \let\ps@jpl@in\ps@headnombre
  \def\@evenhead{\@@PageNumFont\thepage\hfil}%
  \def\@oddhead{\hfil\@@PageNumFont\thepage}%
  \let\@oddfoot\@empty\let\@evenfoot\@empty}

%\def\ps@footnombre{\let\@mkboth\@gobbletwo
%    \let\ps@jpl@in\ps@footnombre
%  \def\@evenfoot{\@@PageNumFont\thepage\hfil}%
%  \def\@oddfoot{\hfil\@@PageNumFont\thepage}%
%  \let\@oddhead\@empty\let\@evenhead\@empty}

%% 各headerに約物の行頭パターン処理を追加しました．
  \def\ps@footnombre{\let\ps@jpl@in\ps@footnombre
    \let\@evenhead\@empty
    \let\@oddhead\@empty
    \def\@oddfoot{\@@PageNumFont\thepage\hskip1.5zw\@@HeaderFont\rightmark\hfil}%
    \def\@evenfoot{\@@HeaderFont\hfil{\leftmark}\@@PageNumFont\hskip1.5zw\thepage}%
    \def\@evenfoot{\@@PageNumFont\thepage\hskip1.5zw\@@HeaderFont\leftmark\hfill}%
    \def\@oddfoot{\hfill\@@HeaderFont{\rightmark}\@@PageNumFont\hskip1.5zw\thepage}%
    \let\@mkboth\markboth
  \def\chaptermark##1{\markboth{%
     \ifnum \c@secnumdepth >\m@ne
         \if@mainmatter
         \@chapapp\thechapter\@chappos\hskip1zw%
         \fi
     \fi
     ##1}{}}%
  \def\sectionmark##1{\markright{%
     \ifnum \c@secnumdepth >\z@ \thesection\hskip1zw\fi
     ##1}}%
  }\if@twoside
  \def\ps@headings{\let\ps@jpl@in\ps@headnombre
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\@@PageNumFont\thepage\hskip1.5zw\@@HeaderFont\leftmark\hfil}%
    \def\@oddhead{\@@HeaderFont\hfil{\rightmark}\@@PageNumFont\hskip1.5zw\thepage}%
    \let\@mkboth\markboth
  \def\chaptermark##1{\markboth{%
     \ifnum \c@secnumdepth >\m@ne
         \if@mainmatter
         \@chapapp\thechapter\@chappos\hskip1zw
         \fi
     \fi
     \protect\@inhibitglue##1}{}}%
  \def\sectionmark##1{\markright{%
     \ifnum \c@secnumdepth >\z@ \thesection\hskip1zw\fi
     \protect\@inhibitglue##1}}%
  }
\else % if not twoside
  \def\ps@headings{\let\ps@jpl@in\ps@headnombre
    \let\@oddfoot\@empty
    \def\@oddhead{\@@PageNumFont\thepage\hskip1.5zw\leftmark\hfil}%
    \let\@mkboth\markboth
\def\chaptermark##1{\markright{%
   \ifnum \c@secnumdepth >\m@ne
         \if@mainmatter
       \@chapapp\thechapter\@chappos\hskip1zw
         \fi
   \fi
   \protect\@inhibitglue##1}}%
  }
\fi
\if@twoside
  \def\ps@bothstyle{\let\ps@jpl@in\ps@footnombre
    \def\@evenhead{\@@HeaderFont\leftmark\hfil}% right page
    \def\@evenfoot{\@@HeaderFont\thepage\hfil}% right page
    \def\@oddhead{\@@HeaderFont\hfil\rightmark}% left page
    \def\@oddfoot{\@@HeaderFont\hfil\thepage}% left page
  \let\@mkboth\markboth
\def\chaptermark##1{\markboth{%
     \ifnum \c@secnumdepth >\m@ne
         \if@mainmatter
         \@chapapp\thechapter\@chappos\hskip1zw
         \fi
     \fi
     \protect\@inhibitglue##1}{}}%
  \def\sectionmark##1{\markright{%
     \ifnum \c@secnumdepth >\z@ \thesection\hskip1zw\fi
     \protect\@inhibitglue##1}}%
  }
\else % if one column
  \def\ps@bothstyle{\let\ps@jpl@in\ps@footnombre
    \def\@oddhead{\@@HeaderFont\hfil\rightmark}%
    \def\@oddfoot{\@@HeaderFont\hfil\thepage}%
    \let\@mkboth\markboth
  \def\chaptermark##1{\markright{%
     \ifnum \c@secnumdepth >\m@ne
         \if@mainmatter
         \@chapapp\thechapter\@chappos\hskip1zw
         \fi
     \fi
     \protect\@inhibitglue##1}}%
  }
\fi
\def\ps@myheadings{\let\ps@jpl@in\ps@plain%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\@@PageNumFont\thepage\hskip1.5zw\@@HeaderFont\leftmark\hfil}%
    \def\@oddhead{\@@HeaderFont\hfil{\rightmark}\@@PageNumFont\hskip1.5zw\thepage}%
  \let\@mkboth\@gobbletwo
  \let\chaptermark\@gobble
  \let\sectionmark\@gobble
}
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }

%% \maketitleでの出力に`PUBLISHER'が入るようにしました．
%% \publisherで指定されていれば，それが優先されて出力されます．
%% `PUBLISHER'を印字させたくなければ，\publisher{}と引数を空にします．
%% \authorで使われる\andも`中黒'で区切るようにしています．
%% また，\titleに[]オプションで副題を入れられるようにしました．
%% \title[副題]{タイトル}となります．

\def\title{\@ifnextchar[{\title@}{\title@[\hbox{}]}}
\def\title@[#1]#2{\gdef\@title{\begin{tabular}{c}#2\\
\Large#1\end{tabular}}}
\def\publisher#1{\gdef\@publisher{#1}}
\gdef\@publisher{東京図書株式会社}
\def\p@thanks#1{\footnotemark
  \protected@xdef\@thanks{\@thanks
    \protect{\noindent$\m@th^\thefootnote$~#1\protect\par}}}
\def\and{%                  % \begin{tabular}
  \end{tabular}%
  ・
  \begin{tabular}[t]{@{}c@{}}\normalsize}%   % \end{tabular}
\if@titlepage
  \newcommand{\maketitle}{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let\footnote\thanks
  \null\vfil
  \vskip 150\p@
  \begin{center}%
    {\Huge \@title \par}%
    \vskip 4em%
    {\Large
     \lineskip .75em%
      \begin{tabular}[t]{@{}c@{}}\normalsize%
        \@author
      \end{tabular}\par}%
      \vskip 4\baselineskip%
    {\large \@date} \par%       % Set date in \large size.
\vfill
{\bfs\@publisher}
  \end{center}\par
  \@thanks\vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@publisher\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\publisher\relax
  }%
\else
  \newcommand{\maketitle}{\par
  \begingroup
    \renewcommand{\thefootnote}{\fnsymbol{footnote}}%
    \def\@makefnmark{\hbox{\ifydir $\m@th^{\@thefnmark}$
      \else\hbox{\yoko$\m@th^{\@thefnmark}$}\fi}}%
     \long\def\@makefntext##1{\parindent 1em\noindent
       \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne \@maketitle
      \else \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
     \thispagestyle{jpl@in}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }
  \def\@maketitle{%
  \newpage\null
  \vskip 2em%
  \begin{center}%
  \let\footnote\thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par\vskip 1.5em}
\fi
\newcommand*{\chaptermark}[1]{}
\setcounter{secnumdepth}{2}
\newcounter{part}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand{\thepart}{\@Roman\c@part}
\renewcommand{\thechapter}{\@arabic\c@chapter}
\renewcommand{\thesection}{\thechapter.\@arabic\c@section}
\renewcommand{\thesubsection}{\thesection.\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{%
   \thesubsection.\@arabic\c@subsubsection}
\renewcommand{\theparagraph}{%
   \thesubsubsection.\@arabic\c@paragraph}
\renewcommand{\thesubparagraph}{%
   \theparagraph.\@arabic\c@subparagraph}
\newcommand{\@chapapp}{\prechaptername}
\newcommand{\@chappos}{\postchaptername}
\newcommand\frontmatter{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \@mainmatterfalse\pagenumbering{roman}}
\newcommand{\mainmatter}{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \@mainmattertrue\pagenumbering{arabic}}
\newcommand{\backmatter}{%
  \if@openright \cleardoublepage \else \clearpage \fi
  \@mainmatterfalse}
\newcommand{\part}{%
  \if@openright \cleardoublepage \else \clearpage \fi
%  \cleardoublepage
  \thispagestyle{empty}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
  \null\vfil
  \secdef\@part\@spart}
\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{%
       \protect\numberline{\prepartname\thepart\postpartname}#1}%
  \else
    \addcontentsline{toc}{part}{#1}%
  \fi
  \markboth{}{}%
  {\centering
   \interlinepenalty\@M\reset@font
   \ifnum \c@secnumdepth >-2\relax
     \huge\bfs\prepartname\thepart\postpartname
     \par\vskip20\p@
   \fi
   \Huge\bfs#2\par}%
   \@endpart}
\def\@spart#1{{%
  \centering
  \interlinepenalty\@M\reset@font
  \Huge\bfs#1\par}%
  \@endpart}
\def\@endpart{\vfil\newpage
   \if@twoside\null\thispagestyle{empty}\newpage\fi
   \if@tempswa\twocolumn\fi}
%% \chapterに約物の行頭処理を追加しました．
\newcommand{\chapter}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}%
  \global\@topnum\z@
%  \@afterindentfalse
  \@afterindenttrue
  \secdef\@chapter\@schapter}
%% multicite.styで使う\@ref@prefixを追加しています．
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
    \refstepcounter{chapter}%
    \xdef\@ref@prefix{\thechapter::}% for multicite.sty
    \typeout{\@chapapp\space\thechapter\space\@chappos}%
    \addcontentsline{toc}{chapter}%
      {\protect\numberline{\@chapapp\thechapter\@chappos}#1}%
    \else\addcontentsline{toc}{chapter}{#1}\fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}\@afterheading}
%%%%%%%
\def\@makechapterhead#1{{\parindent\z@%%\interlinepenalty\@M%
\toplinebox{10}{% 10行取りにしています．
   \raggedright
   \@@ChapterNumFont
   \ifnum \c@secnumdepth >\m@ne
     \setlength\@tempdima{\linewidth}%
    \if@mainmatter
      \@chapapp\thechapter\@chappos
     \else
      \hbox{}
    \fi
     \vspace{.9\Cvs}\par
     \@@ChapterFont\@inhibitglue#1\vfil\fi}}%
}

\def\@schapter#1{%
  \@makeschapterhead{#1}\@afterheading
}

\def\@makeschapterhead#1{{\parindent\z@%%\interlinepenalty\@M%
\toplinebox{10}{% 10行取りにしています．
     \centerline{\@@ChapterFont\@inhibitglue#1}\vfil}
   }}


%%% \@sect 98/11/10 
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax{\@SectionSlectNumFont\@svsec}}%
          \interlinepenalty\@M\@inhibitglue#8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
%%%
\newcommand{\section}{\IfSecFontChange\S@ectiontrue%
   \@startsection{section}{1}{\z@}%
%   {17.4715\p@ \@plus\z@ \@minus\z@}%
%   {5.865\p@ \@plus\z@ \@minus\z@}%
    {1.5\baselineskip}
    {.5\baselineskip}
   {\@@SectionFont}}%
\newcommand{\subsection}{\IfSecFontChange\subS@ectiontrue%
   \@startsection{subsection}{2}{\z@}%
%   {17.4715\p@ \@plus\z@ \@minus\z@}%
%   {4.0\p@ \@plus\z@ \@minus\z@}%
   {\baselineskip}%
   {0.1pt}%
   {\@@subSectionFont}}%
\newcommand{\subsubsection}{\IfSecFontChange\subsubS@ectiontrue%
   \@startsection{subsubsection}{3}{\z@}%
   {\baselineskip}%
   {0.1\p@ \@plus.5\Cdp \@minus.2\Cdp}%
   {\@@subsubSectionFont}}%
\newcommand{\paragraph}{%
    \@startsection{paragraph}{4}{\z@}%
   {3.25ex \@plus 1ex \@minus .2ex}%
   {-1em}%
   {\@@ParagraphFont}}
\newcommand{\subparagraph}{%
   \@startsection{subparagraph}{5}{\z@}%
   {3.25ex \@plus 1ex \@minus .2ex}%
   {-1em}%
   {\@@subParagraphFont}}
\newcommand{\appendix}{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand{\@chapapp}{\appendixname}%
  \renewcommand{\@chappos}\space%
  \renewcommand{\thechapter}{\@Alph\c@chapter}}
\if@twocolumn
  \setlength\leftmargini {3zw}
\else
  \setlength\leftmargini {3zw}
\fi
\setlength\leftmarginii  {2zw}
\setlength\leftmarginiii {2zw}
\setlength\leftmarginiv  {2zw}
\if@twocolumn
  \setlength\leftmarginv {1zw}
  \setlength\leftmarginvi{1zw}
\else
  \setlength\leftmarginv {1zw}
  \setlength\leftmarginvi{1zw}
\fi
\setlength  \labelsep  {1zw}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}
\newcommand{\labelenumi}{\theenumi.}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}
\renewenvironment{enumerate}
  {\ifnum \@enumdepth >3\relax\@toodeep\else
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         \parskip\z@ \itemsep\z@ \parsep\z@
         \labelwidth1zw \labelsep.3zw
         \ifnum \@enumdepth=\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
         \usecounter{\@enumctr}%
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
\newcommand{\labelitemi}{\textbullet}
\newcommand{\labelitemii}{%
  \iftdir
     {\textcircled{~}}
  \else
     {\normalfont\bfs\textendash}
  \fi
}
\newcommand{\labelitemiii}{\textasteriskcentered}
\newcommand{\labelitemiv}{\textperiodcentered}
\renewenvironment{itemize}
  {\ifnum \@itemdepth >3\relax\@toodeep\else
   \advance\@itemdepth\@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \expandafter
   \list{\csname \@itemitem\endcsname}{%
\labelwidth1zw \labelsep.3zw
      \iftdir
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         \parskip\z@ \itemsep\z@ \parsep\z@
         \labelwidth1zw \labelsep.3zw
         \ifnum \@itemdepth =\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
\newenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw \itemsep\z@
     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
   \fi
           \let\makelabel\descriptionlabel}}{\endlist}
\newcommand{\descriptionlabel}[1]{%
   \hspace\labelsep\normalfont\bfs #1}

\renewenvironment{description}
  {\list{}{\labelwidth=\leftmargin
\labelsep=1zw
\advance\labelwidth by-\labelsep
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw \itemsep\z@
     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
   \fi
           \let\makelabel\descriptionlabel}}{\endlist}
\renewcommand{\descriptionlabel}[1]{%
   \normalfont\bfs #1\hfil}
%%%%%%%%
\newenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@ \itemindent -1.5em%
           \listparindent\itemindent
           \rightmargin\leftmargin \advance\leftmargin 1.5em}%
           \item\relax}{\endlist}
\newenvironment{quotation}
  {\list{}{\listparindent 1zw%
           \itemindent\listparindent
           \rightmargin\p@
           \parsep\z@ \@plus\p@}%
           \item\relax}{\endlist}
\newenvironment{quote}
  {\list{}{\rightmargin\leftmargin}%
           \item\relax}{\endlist}
\newcounter{figure}[chapter]
\renewcommand{\thefigure}{%
  \ifnum\c@chapter>\z@\thechapter.\fi\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\thefigure}
\newenvironment{figure}
               {\let\center\Center\let\endcenter\endCenter
               \@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\let\center\Center\let\endcenter\endCenter
               \@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand{\thetable}{\thechapter.\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
%%   一般的に`図'のcaptionはその図の下，`表'はcaptionはその表の上に配置します．
%%   本クラスファイルでは図を配置する目的で使われるfigure環境において
%%   objectの下にcaptionを置く前提で\abovecaptionskipはfigure環境内での
%%   objectとcaptionとのアキとして定義してます．
%%   \belowcaptionskipはtable環境内でobjectの上にcaptionが配置されたとき
%%   のアキです．
%%   よってfigure環境でobjectを上に配置，もしくはtable環境でobjectの下に
%%   captionを配置すると少しおかしな事になります．
\setlength\abovecaptionskip{1.5mm}% 図とcaption とのアキ
\setlength\belowcaptionskip{1.5mm}% 表とcaption とのアキ
\def\@@Figure{table}
\newdimen\tempCapNumBox
\newdimen\@tempCapNumBox
\long\def\@makecaption#1#2{{\@@CaptionFont%
\ifx\@captype\@@Figure
  \vskip0mm
\else
  \vskip\abovecaptionskip
\fi
%%
    \@tempCapNumBox\hsize
    \settowidth{\tempCapNumBox}{{\bfs #1}}
    \advance\@tempCapNumBox by-\tempCapNumBox
    \advance\@tempCapNumBox by-1zw
%%
    \sbox\@tempboxa{{\bfs #1}\hskip1zw#2}%
  \ifdim \wd\@tempboxa >\hsize
\ifp@rc@ption
      {{\bfs #1}\hskip1zw#2}\relax\par
\else
\ifx\@captype\@@Figure\relax\else\vskip-1.75mm\fi
      \parbox[b]{\hsize}{{\bfs #1}\hskip1zw\parbox[t]{\@tempCapNumBox}{#2}}
\ifx\@captype\@@Figure\vskip-1mm\else\relax\fi
\fi
\ifx\@captype\@@Figure
     \vskip\belowcaptionskip
\fi
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
\ifx\@captype\@@Figure
\vskip-.7mm\vskip\belowcaptionskip
\else
\relax
\fi
  \fi
}}
\setlength\arraycolsep{2\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset{equation}{chapter}
\renewcommand{\theequation}{%
  \ifnum\c@chapter>\z@\thechapter.\fi \@arabic\c@equation}
\if@enablejfam
  \DeclareSymbolFont{mincho}{JY1}{mc}{m}{n}
  \DeclareSymbolFontAlphabet{\mathmc}{mincho}
  \SetSymbolFont{mincho}{bold}{JY1}{gt}{m}{n}
  \DeclareMathAlphabet{\mathgt}{JY1}{gt}{m}{n}
  \reDeclareMathAlphabet{\mathrm}{\@mathrm}{\@mathmc}
  \reDeclareMathAlphabet{\mathbf}{\@mathbf}{\@mathgt}
  \jfam\symmincho
\else
  \DeclareRobustCommand{\mathmc}{%
    \@latex@error{Command \noexpand\mathmc invalid with\space
       `disablejfam' class option.}\@eha
  }
  \DeclareRobustCommand{\mathgt}{%
    \@latex@error{Command \noexpand\mathgt invalid with\space
       `disablejfam' class option.}\@eha
  }
\fi
\setcounter{tocdepth}{2}
\newcommand{\@pnumwidth}{1.5zw}
\newcommand{\@tocrmarg}{2.55em}
\newcommand{\@dotsep}{1.5}
\newdimen\toclineskip
\setlength\toclineskip{\z@}
\newdimen\@lnumwidth
%% 目次で約物が行頭に来たとき\inhibitglueするように変更しました．
\def\numberline#1{\hbox to\@lnumwidth{#1\hfil}\@inhibitglue}
%\def\numberline#1{%
%    \settowidth\@tempdima{\hbox{#1}}
%    \advance\@tempdima by1zw%
%    \@lnumwidth\@tempdima%
%    \hbox to\@lnumwidth{#1\hfil}\@inhibitglue}
%\def\numberline#1{\hbox to\@lnumwidth{\hfil#1\hspace*{1zw}}\@inhibitglue}

\def\@dottedtocline#1#2#3#4#5{\ifnum #1>\c@tocdepth \else
  \vskip\toclineskip \@plus.2\p@
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
   \interlinepenalty\@M
   \leavevmode
   \@lnumwidth #3\relax
   \advance\leftskip \@lnumwidth \hbox{}\hskip -\leftskip
    {\@TocSectionSlectFont#4}
    \nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu・\mkern \@dotsep
       mu$}\hfill \nobreak\hbox to\@pnumwidth{%
         \hss\@TocSectionNumSlectFont#5}\par}\fi}
\def\addcontentsline#1#2#3{%
  \protected@write\@auxout
    {\let\label\@gobble \let\index\@gobble \let\glossary\@gobble
\@temptokena{\thepage}}%
    {\string\@writefile{#1}%
       {\protect\contentsline{#2}{#3}{\the\@temptokena}}}%
}
\newcommand{\tableofcontents}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\contentsname}%
    \@mkboth{\contentsname}{\contentsname}\vspace{-1.5\baselineskip}%
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}
\newcommand*{\l@part}[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
    \parindent\z@\rightskip\@pnumwidth
    \parfillskip-\@pnumwidth
    {\leavevmode\@@TocPartFont
     \setlength\@lnumwidth{3.9zw}%
     #1\hfil\nobreak
     {\@@TocNumPartFont\hbox to\@pnumwidth{\hss#2}}}\par
    \nobreak
    \global\@nobreaktrue
    \everypar{\global\@nobreakfalse\everypar{}}%
     \endgroup
  \fi}
\newcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \addvspace{1.0em \@plus\p@}%
    \begingroup
      \parindent\z@ \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\@@TocChapterFont
      \setlength\@lnumwidth{4zw}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\@@TocNumChapterFont\hbox to\@pnumwidth{\hss#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\newcommand{\IfSecFontChange}{\S@ectionfalse\subS@ectionfalse\subsubS@ectionfalse}

\newcommand*{\l@section}{\IfSecFontChange%
\S@ectiontrue\@dottedtocline{1}{1.5em}{2.7em}}
\newcommand*{\l@subsection}   {\IfSecFontChange
\subS@ectiontrue\@dottedtocline{2}{4.2em}{3.25em}}
\newcommand*{\l@subsubsection}{\IfSecFontChange%
\subsubS@ectiontrue\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*{\l@paragraph}    {\@dottedtocline{4}{10em}{5em}}
\newcommand*{\l@subparagraph} {\@dottedtocline{5}{12em}{6em}}
\newcommand{\listoffigures}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\listfigurename}
  \@mkboth{\listfigurename}{\listfigurename}%
  \@starttoc{lof}%
  \if@restonecol\twocolumn\fi
}
\newcommand*{\l@figure}{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand{\listoftables}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\listtablename}
  \@mkboth{\listtablename}{\listtablename}%
  \@starttoc{lot}%
  \if@restonecol\twocolumn\fi
}
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newcommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}
\newenvironment{thebibliography}[1]
{\chapter*{\bibname}
\@mkboth{\bibname}{\bibname}
\addcontentsline{toc}{chapter}{\bibname}
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}\small}%
   \sloppy
   \clubpenalty4000
   \@clubpenalty\clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}
\let\@openbib@code\@empty
\newenvironment{theindex}
  {\if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
   \columnseprule\z@ \columnsep 35\p@
   \twocolumn[\@makeschapterhead{\indexname}]%
   \@mkboth{\indexname}{\indexname}%
   \thispagestyle{empty}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem\small}
  {\if@restonecol\onecolumn\else\clearpage\fi}


\renewenvironment{theindex}
  {\if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
   \columnseprule\z@ \columnsep 35\p@
\@makeschapterhead{\indexname}
   \@mkboth{\indexname}{\indexname}%
\addcontentsline{toc}{chapter}{\indexname}
\begin{multicols}{2}
   \thispagestyle{empty}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem\small}
  {\if@restonecol\end{multicols}\else\clearpage\fi}


\newcommand{\@idxitem}{\par\hangindent 4zw}
\newcommand{\subitem}{\@idxitem \hspace*{2zw}}
\newcommand{\subsubitem}{\@idxitem \hspace*{3zw}}
\newcommand{\indexspace}{\par \vskip.5\baselineskip\relax}
\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{\parindent1zw
  \noindent\hbox to 1.5zw{\hss\@makefnmark\,}#1}
\newif\if西暦 \西暦false
\def\西暦{\西暦true}
\def\和暦{\西暦false}
\newcount\heisei \heisei\year \advance\heisei-1988\relax
\def\today{{%
  \iftdir
    \if西暦
      \kansuji\number\year 年
      \kansuji\number\month 月
      \kansuji\number\day 日
    \else
      平成\ifnum\heisei=1 元年\else\kansuji\number\heisei 年\fi
      \kansuji\number\month 月
      \kansuji\number\day 日
    \fi
  \else
    \if西暦
      \number\year~年
      \number\month~月
      \number\day~日
    \else
      平成\ifnum\heisei=1 元年\else\number\heisei~年\fi
      \number\month~月
      \number\day~日
    \fi
  \fi}}
\newcommand{\prepartname}{第}
\newcommand{\postpartname}{部}
\newcommand{\prechaptername}{第}
\newcommand{\postchaptername}{章}
\newcommand{\contentsname}{目　次}
\newcommand{\listfigurename}{図 目 次}
\newcommand{\listtablename}{表 目 次}
\newcommand{\bibname}{参考文献}
\newcommand{\indexname}{索　引}
\newcommand{\figurename}{図}
\newcommand{\tablename}{表}
\newcommand{\appendixname}{付録}
\pagestyle{headings}
\pagenumbering{arabic}
\raggedbottom
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\if@twoside
  \@mparswitchtrue
\else
  \@mparswitchfalse
\fi

%newtheorem環境で作られる環境での()を全角へ変更．および\itをキャンセル
\def\@opargbegintheorem#1#2#3{\trivlist
      \item[\hskip \labelsep{\bfs #1\ #2（#3）}]}

\def\Koguchi#1{%
\evensidemargin=#1
\oddsidemargin\paperwidth
\advance\oddsidemargin by-\textwidth
\advance\oddsidemargin by-\evensidemargin
\setlength\@@evensidemargin{\evensidemargin}
\advance\oddsidemargin by-1in
\advance\evensidemargin by-1in
\topmargin\paperheight
\advance\topmargin by-\textheight
\topmargin.5\topmargin
\advance\topmargin by-\headsep
\advance\topmargin by-\headheight
\advance\topmargin-1in
}

%% \marginparwidthは\marginparsepを引いた\evensidemarginの0.8倍にしてます．
%% \小口の指定がある場合もその指定の0.8倍です．
\if@Koguchi
\Koguchi{\@小口}
\fi
\ifdim\@@marginparwidth=0pt
\advance\@@evensidemargin by-\marginparsep
\setlength\marginparwidth{.8\@@evensidemargin}
\else
\marginparwidth\@@marginparwidth
\fi

%%%%%

\newdimen\Bline
\newdimen\BSLimit
\long\def\toplinebox#1#2%
{{\normalsize\Bline0pt%
\advance\Bline by#1\baselineskip%
\advance\Bline by-\baselineskip%
\advance\Bline by\Cht%
\advance\Bline by\Cdp%
\vspace*{-\topskip}\vspace*{-\Cdp}
\par%
\noindent%
%%\fbox{
\parbox[c][\Bline][c]{\textwidth}{#2}%
%%}
%\vskip\baselineskip
\vskip\Cht\vskip-\lineskip%
}\ignorespaces}



%% 字取りマクロ／\jidori{長さ}{TEXT}
\def\jidori#1#2{\leavevmode\hbox to #1{\kanjiskip\fill\xkanjiskip\kanjiskip#2}}

%%%% 図版アタリケイ引く／#1=幅, #2=高さ.
\def\Fig#1#2{%
\parbox[b]{#1}{%
\hbox to#1{\vtop to#2{\hsize#1\hrule\vss
\hbox to#1{\vrule height#2\hss\vrule height#2}
\vss\hrule}}}}


%% \displaystyle の省略形
\let\dis\displaystyle

%% ベースはLaTeX2e 美文書作成入門を参考に作りました．
%% ルビ文字が判面の天についても一行目のベースラインが下がらないようにしました．
% \ruby{本文}{ルビ文字}
\newdimen\mytempdima
\newcommand{\ruby}[2]{%
\leavevmode
\setbox0=\hbox{#1}%	
\mytempdima=\f@size\p@
\setbox1=\hbox{\fontsize{.5\mytempdima}{0pt}\selectfont #2}%
\ifdim\wd0>\wd1 \dimen0=\wd0 \else \dimen0=\wd1 \fi
\hbox{%
\kanjiskip=0pt plus 2fil
\xkanjiskip=0pt plus 2fil
\vbox to\Cht{\vss%
\hbox to\dimen0{%
\fontsize{.5\mytempdima}{0pt}\selectfont \hfil#2\hfil}%
\nointerlineskip
\hbox to\dimen0{\mathstrut\hfil#1\hfil}}}}

%サク字用マクロ need graphicx package
% 
\newcommand{\sakuji}[2]{\scalebox{0.5}[1]{\hbox to2zw{#1\hskip-.1zw#2}}}


%% \\ により改行のできる caption
%% \pcation{TEXT\\TEXT}
\newif\ifp@rc@ption
\p@rc@ptionfalse
\newsavebox{\@parc@ption}
\newsavebox{\@parc@ptionB}
\def\parcaption#1{%
\sbox{\@parc@ption}{\shortstack[l]{\@@CaptionFont#1}}%
\setbox\@parc@ptionB\hbox{\csname fnum@\@captype\endcsname}%
\@tempdima\columnwidth \advance\@tempdima-\wd\@parc@ptionB
\@tempdimb.95\@tempdima
\ifdim\wd\@parc@ption >\@tempdimb \@tempdima\@tempdimb
\else\@tempdima\wd\@parc@ption\fi
\sbox{\@parc@ptionB}{\parbox[t]{\@tempdima}{\@@CaptionFont#1}}
\p@rc@ptiontrue%
\caption{\usebox{\@parc@ptionB}}%
}

% 前後アキゼロのcenter環境
\def\Center{%
      \topsep0pt
      \partopsep0pt
      \parsep0pt
      \parskip0pt
\trivlist \centering\item[]}
\let\endCenter=\endtrivlist


%% 字下げ幅を適時調整できるリスト
%% \begin{Description}{2zw}で字下げ2倍のリストする．
\newdimen\Departopsep
\Departopsep.5\baselineskip
\newenvironment{Description}[1]%
  {\partopsep=\Departopsep\list{}{\topsep=0pt\leftmargin=#1\labelwidth=\leftmargin
\labelsep=0zw
\advance\labelwidth by-\labelsep
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw \itemsep\z@
     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
   \fi
           \let\makelabel\Descriptionlabel}}{\endlist}
\newcommand{\Descriptionlabel}[1]{%
   \normalfont#1\hfil}

%% 独立数式を行頭におけるようにする．
\predisplaypenalty100\relax

\def\HO{\makebox[1zw][c]{\rule{.75zw}{.1mm}}}



\long\def\@savemarbox#1#2{%
   \global\setbox#1%
      \color@vbox
      \normalcolor%% \textcolor実行時に\marginparに`color'が及ばないように．
      \vtop{%
         \hsize\marginparwidth
         \@parboxrestore
         \@marginparreset\@@MarginparFont
         #2%
         \@minipagefalse
         \outer@nobreak}%
    \color@endbox}


%% \sectionなどの見出しに対して行頭約物の処理を追加しました．
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa<\z@
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{\everyparhook}%
      \fi\everyparhook}%
  \else
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \fi
  \par  % 2000-12-18
  \ignorespaces}
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa<\z@
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \else
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M\@inhibitglue#5\@@par}%
    \endgroup
  \fi
  \@xsect{#3}}

%% 行頭処理です．基本的な処理はjsbookを参考にしました．
%% 対象約物を追加してます．
\def\@inhibitglue{%
  \futurelet\@let@token\@@inhibitglue}
\def\@@inhibitglue{%
  \ifx\@let@token「
    \inhibitglue
  \else
    \ifx\@let@token（
      \inhibitglue
    \else
      \ifx\@let@token『
        \inhibitglue
      \else
        \ifx\@let@token［
          \inhibitglue
        \else
          \ifx\@let@token《
           \inhibitglue
          \else
            \ifx\@let@token【
             \inhibitglue
            \else
              \ifx\@let@token〈
               \inhibitglue
              \else
               \ifx\@let@token“
                \inhibitglue
               \else
                 \ifx\@let@token〔
                  \inhibitglue
                 \else
                   \ifx\@let@token＜
                    \inhibitglue
                   \else
                   \fi
                 \fi
                \fi
              \fi
            \fi
          \fi
        \fi
      \fi
    \fi
  \fi}
\let\everyparhook=\@inhibitglue
\AtBeginDocument{\everypar{\everyparhook}}
\def\@doendpe{%
  \@endpetrue
  \def\par{%
    \@restorepar\everypar{\everyparhook}\par\@endpefalse}%
  \everypar{{\setbox\z@\lastbox}\everypar{\everyparhook}\@endpefalse\everyparhook}}
\def\@item[#1]{%
  \if@noparitem
    \@donoparitem
  \else
    \if@inlabel
      \indent \par
    \fi
    \ifhmode
      \unskip\unskip \par
    \fi
    \if@newlist
      \if@nobreak
        \@nbitem
      \else
        \addpenalty\@beginparpenalty
        \addvspace\@topsep
        \addvspace{-\parskip}%
      \fi
    \else
      \addpenalty\@itempenalty
      \addvspace\itemsep
    \fi
    \global\@inlabeltrue
  \fi
  \everypar{%
    \@minipagefalse
    \global\@newlistfalse
    \if@inlabel
      \global\@inlabelfalse
      {\setbox\z@\lastbox
       \ifvoid\z@
         \kern-\itemindent
       \fi}%
      \box\@labels
      \penalty\z@
    \fi
    \if@nobreak
      \@nobreakfalse
      \clubpenalty \@M
    \else
      \clubpenalty \@clubpenalty
      \everypar{\everyparhook}%
    \fi\everyparhook}%
  \if@noitemarg
    \@noitemargfalse
    \if@nmbrlist
      \refstepcounter\@listctr
    \fi
  \fi
  \sbox\@tempboxa{\makelabel{#1}}%
  \global\setbox\@labels\hbox{%
    \unhbox\@labels
    \hskip \itemindent
    \hskip -\labelwidth
    \hskip -\labelsep
    \ifdim \wd\@tempboxa >\labelwidth
      \box\@tempboxa
    \else
      \hbox to\labelwidth {\unhbox\@tempboxa}%
    \fi
    \hskip \labelsep}%
  \ignorespaces}
\def\@afterheading{%
  \@nobreaktrue
  \everypar{%
    \if@nobreak
      \@nobreakfalse
      \clubpenalty \@M
      \if@afterindent \else
        {\setbox\z@\lastbox}%
      \fi
    \else
      \clubpenalty \@clubpenalty
      \everypar{\everyparhook}%
    \fi\everyparhook}}


%% dvips用のsplecialの埋め込みです．(dviout, dvipdfmxでも有効です)
%% \AFourtlueは用紙サイズをA4判に限定して天地中央に(tombowが指定されて
%% いればトンボを含んだ状態で)配置させます．
%% jsbookでは\paperwidthと\paperheightを基準にしてsplecial用紙サイズを
%% 決定しています．
%% ここではプリンタ出力に便利なようにA4判を基準に算出させています．
%% クラスオプションA4size（jbookなどのa4paperやa4とは意味が異なります）で
%% A4基準の仕様になり，指定しないと\paperwidthと\paperheightを基準にした
%% 用紙サイズに決定するようにしています．
%% (tombowありの判面＋トンボの用紙サイズになります．)
%% PDFやdvioutの画面上で余白に無駄なく表示させるには指定しないほうがスッキリします．

\ifAFour
\newdimen\Hof@@fset
\newdimen\Vof@@fset
  \setlength{\@tempdima}{\paperwidth}
  \setlength{\@tempdimb}{\paperheight}
  \setlength{\Hof@@fset}{210mm}
  \setlength{\Vof@@fset}{297mm}
  \iftombow
   \advance \@tempdima 1in
   \advance \@tempdimb 1in
  \fi
   \advance \Hof@@fset -\@tempdima
   \advance \Vof@@fset -\@tempdimb
   \divide \Hof@@fset 2
   \divide \Vof@@fset 2
  \iftombow
   \advance \Hof@@fset -.5in
   \advance \Vof@@fset -.5in
  \fi
\voffset\Vof@@fset
\hoffset\Hof@@fset
  \AtBeginDvi{\special{papersize=210mm,297mm}}
\else
  \setlength{\@tempdima}{\paperwidth}
  \setlength{\@tempdimb}{\paperheight}
  \iftombow
    \advance \@tempdima 1in
    \advance \@tempdimb 1in
    \voffset -.5in
    \hoffset -.5in
  \fi
  \AtBeginDvi{\special{papersize=\the\@tempdima,\the\@tempdimb}}
\fi

\newdimen\@@tabcolsep@@
\@@tabcolsep@@\tabcolsep

\endinput
