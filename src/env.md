# 開発環境

ホームページやブログの改修や不具合が出た場合，それらの保守をするための環境について説明します．

一応，Windowsユーザーを想定しているのでmacOSやLinuxを使っている人は飛ばしてください

## WSLを入れる方法
開発環境はWSLと呼ばれる仮想環境上に構築します．
これは簡単に言うと，Windows上でLinuxを使えるようにするものです．

管理者としてPowerShellを起動し，以下のコマンドを入力してください
(https://forest.watch.impress.co.jp/docs/news/1342078.html)
```
wsl --install
```

これで，Windows上にUbuntuと呼ばれるOSが使えるようになります．
また，WSLで立ち上げたサイトを閲覧するために`C:\\Users\<ユーザ名>\.wslconfig`というファイルを作成し，以下のように記述して下さい．

```
localhostForwarding=True
```


これ以降の操作は，Windows上でUbuntuを起動し，その上での操作となります．

## WSL上での環境構築

ホームページはNode.js(Gatsby js),ブログはHugoで動いているのでそれらがUbuntuで動くようにします.  

### Node.jsのインストール
必要パッケージ等のインストール
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential git -y
```
nのインストール(nodejsの管理用)およびシェルの再起動
```bash
curl -L https://git.io/n-install | bash
exec $SHELL -l
```

nodejsがインストールされたかの確認
```bash
node -v
```
v14.~などが表示されればインストールに成功している

### Gatsby-cliのインストール

ホームページはGatsbyjsと呼ばれるツールによって生成されています．

- (ワークスペースの作成，なくても良い)

```bash
mkdir workspace && cd workspace
```


1. gatsby-cliのインストール

```bash
npm i -g gatsby-cli
```

1. レポジトリのクローン

```bash
git clone https://github.com/Grandelfino/Homepage-Gatsby.git && cd Homepage-Gatsby
```

1. 必要パッケージのインストール

```bash
npm i
```

これでインストールは終了です．

### 動作確認

`/home/workspace/Homepage-Gatsby`上で

```bash
gatsby develop
```

問題がなければ

```
You can now view gatsby-starter-hello-world in the browser.
⠀
  http://localhost:8000/
⠀
View GraphiQL, an in-browser IDE, to explore your site's data and schema
⠀
  http://localhost:8000/___graphql
⠀
Note that the development build is not optimized.
To create a production build, use gatsby build
⠀
success Building development bundle - 3.037s
```

こんな画面がコンソール上に出てきます  あとは適当なブラウザで[localhost:8000](http://localhost:8000)でホームページが表示されます

Ctrl+Cで終了できます．

### ブログの動作確認

hugoのバージョンが古いと動かない可能性有り

- hugoのインストール

```bash
sudo apt install hugo -y
```

- リポジトリのクローン

```bash
cd ~/workspace/ && git clone https://github.com/Grandelfino/Blog.git && cd Blog
```

- hugoの起動

```
hugo serve
```

問題がなければコンソール上にこんな文字が出てくるので[localhost:1313](http://localhost:1313)にアクセスするとブログが見れます

```
                   | JP
-------------------+------
  Pages            | 638
  Paginator pages  | 121
  Non-page files   | 519
  Static files     |  12
  Processed images | 674
  Aliases          |  15
  Sitemaps         |   1
  Cleaned          |   0

Built in 8177 ms
Watching for changes in /home/aaa/workspace/Blog/{assets,content,data,layouts,static,themes}
Watching for config changes in /home/aaa/workspace/Blog/config.toml, /home/aaa/workspace/Blog/config/_default, /home/aaa/workspace/Blog/themes/academic/config.toml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```
Ctrl+Cで終了します．