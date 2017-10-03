# クラスファイル（弱点克服 大学生の確率統計より）

* 「弱点克服 大学生の確率統計」から「解答」にある傍注体裁を
なくしたもの．

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



