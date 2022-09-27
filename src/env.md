# 開発環境

docker composeを使ってデバッグできるようにしているので，基本的にそれを使ってください

## Gitのインストール

[Git - Downloads](https://git-scm.com/download/)からインストール  
(参考)[WindowsにGitをインストールする手順(2022年9月更新)](https://www.curict.com/item/60/60bfe0e.html)

Gitのパスが通っていることを確認

```shell
$ git -v
git version 2.37.3
```

### ユーザ名とメールアドレスの登録

```shell
git config --global user.name "Your name"
git config --global user.email "email@example.com"
```

## Docker desktopのインストール

[docker-desktop](https://www.docker.com/products/docker-desktop)からインストール

使用するOSに合ったものをダウンロードしてください

インストーラーに従いパスが通っていることを確認

```shell
$ docker --version
Docker version 20.10.17, build 100c701
```

```shell
$ docker compose version
Docker Compose version v2.10.2
```

## ホームページのデバッグ方法

リポジトリのクローン

```shell
git clone https://github.com/Grandelfino/homepage.git
cd homepage/
```

.envファイルの作成

```shell
touch .env
```

.envファイルに[Grandelfino/secrets](https://github.com/Grandelfino/secrets#contentful-env)のContentful ENVの内容をコピーする

```shell
CONTENTFUL_SPACE_ID=xxx
CONTENTFUL_ACCESS_TOKEN=xxx
```

localhostでのホスティング  
**homepageディレクトリに移動して行う**

```shell
docker compose up -d
```

動作しているか確認

```shell
$ docker compose ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
launch-dev          "docker-entrypoint.s…"   app                 running             0.0.0.0:8000->8000/tcp
```

終了する時

```shell
docker compose down
```

[localhost:8000](http://localhost:8000)でホームページが表示されるのを確認する

## ~~ブログの動作確認~~

WIP

