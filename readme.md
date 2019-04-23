# クラスファイル（弱点克服 大学生の確率統計より）

### 「統計学」の進行に伴い内容を一部変更 2018/08/21

### test

* 統計学用の仕様を**toukeigaku.sty**として追加．
 * サンプル用のtexファイルは**toukeigaku-sample.tex**
 * 修正は主に「解答」の文字サイズの変更．以後「統計学」用独自の体裁が追加が予想されるので別ファイルとした．
* サンプルファイルを`./samplefig/` `./sampletexfiles/`へ移動して整理した．
* 汎用体裁用のstylefileを**macros9th.sty**から**basic.sty** へ変更．
* emath関連のパッケージのバージョンを上げた．

サンプルのコンパイル
```
platex --synctex=1 toukeigaku-sample.tex
dvipdfmx toukeigaku-sample.dvi
```

「統計学」では
```
\usepackage{toukeigaku}%% 統計学の基本設定
%\usepackage{basic}%%     統計学以外で使う基本設定
```
を指定する．

### toukeigaku-sample.texの記述の説明
**読み込む図版ファイルの管理**

プリンブルにある
```
\graphicspath{{./fig/}{./samplefig/}}
```
は，`\includegraphics`で読む画像ファイルのpathの初期値の設定です．
（この場合はまず`./fig/`を探し見つからなければ`./samplefig/`を探す）
これは（例えば執筆者ごとに画像pathを変えるなど）任意のものに変更していただいてOKです．

**読み込むTeXファイルの管理**

`\include`と`\includeonly`で読ませるファイルを制御できます．
通常はそれぞれ指定するファイルを対にします．
```
\includeonly{
maegaki,
Chap01,
Chap02,
Chap03
}
\begin{document}
\include{maegaki}
\include{Chap01}
\include{Chap02}
\include{Chap03}
\end{document}
```
これでコンパイルすると，通常通りすべてのファイルを読んで処理を行います．
```
\includeonly{
maegaki,
Chap01,
%% Chap02,
Chap03
}
```
このように`\includeonly`側の任意のファイルをコメントアウトすると，
`\include`コマンドはChap02.texだけ処理をパスします．
`\input`で読ませて同様のことをした場合のとの違いはノンブル，`\ref`，`\label`，各種カウンタなどの情報がそのまま保持される点です．

（**一度全ファイルを処理しておく必要があります**）

また `\input`と違い`\include`でのファイル読み込みには**改頁が伴います**．なので**図表などの読み込みには不適切**です．

2018/08/21 end

------

 * 「弱点克服 大学生の確率統計」から「解答」にある傍注体裁をなくしたもの．
* platex限定（uplatex未対応）

## 「弱点克服 大学生の確率統計」で用意した独自の環境
### 「概要」の記述

``\chapter``の直下に指定します．
```
\begin{abstract}

\end{abstract}
```

### 「問題」
`[ ]`でのoptionは，「問題のレベル」を指定します．
既本では，[基本]，[標準]，[発展]があり，
省略は[基本]になっています．``TITLE``は省略できません．
```
\begin{問題}[標準]{TITLE}

\end{問題}
```

### 「解説」
問題の解説です．
画像化されたタイトルが付きます．

```
\begin{解説}

\end{解説}
```

### 「網掛け」箇所

```
\begin{網掛け}
\end{網掛け}
```

### 「解答」
問題の解答です．文字サイズは小さく印字されます．
画像化されたタイトルが付きます．


### コラム「teatime」
2017/10/24にtable，figureなどに対応
optionでタイトルを指定します．
省略した場合は付きません．
```
\begin{teatime}[タイトル]
\end{teatime}
```


### 巻末の「TEST shuffle」
巻末のコラム「TEST shuffle」です．
ひとつのコラムで
`\begin{TEST}   \end{TEST}`
で括ります．

```
\begin{TEST}
	\begin{SQenumerate}%% □でlabelを囲ったenumerate環境
		\item
		\item
	\end{SQenumerate}
\end{TEST}
\begin{TEST}
	\begin{SQenumerate}
		\item
		\item
	\end{SQenumerate}
\end{TEST}
```



