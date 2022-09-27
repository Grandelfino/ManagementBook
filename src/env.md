# 開発環境

docker composeを使ってデバッグできるようにしているので，基本的にそれを使ってください

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

```shell
$ docker compose up -d
[+] Building 95.8s (11/11) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                                    0.0s
 => => transferring dockerfile: 273B                                                                                                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                                                                                                       0.0s
 => => transferring context: 2B                                                                                                                                                                                         0.0s
 => [internal] load metadata for docker.io/library/node:18-alpine3.15                                                                                                                                                   2.2s
 => [auth] library/node:pull token for registry-1.docker.io                                                                                                                                                             0.0s
 => [internal] load build context                                                                                                                                                                                       0.1s
 => => transferring context: 1.26MB                                                                                                                                                                                     0.0s
 => [1/5] FROM docker.io/library/node:18-alpine3.15@sha256:8d1eb5d6dffec25af36b62692179f408a97862eafac53ebccd2fb92f0d3b9d5d                                                                                             0.0s
 => CACHED [2/5] WORKDIR /home/node/app                                                                                                                                                                                 0.0s
 => CACHED [3/5] RUN apk update &&     apk add --no-cache git &&     apk add --update python3 make g++ &&    rm -rf /var/cache/apk/*                                                                                    0.0s
 => [4/5] COPY package.json package-lock.json /home/node/app/                                                                                                                                                           0.0s
 => [5/5] RUN npm ci                                                                                                                                                                                                   87.2s
 => exporting to image                                                                                                                                                                                                  6.2s
 => => exporting layers                                                                                                                                                                                                 6.2s
 => => writing image sha256:ff85008f31f2f0dc54ab992e4002fd79fbe2728196286a10926fe0c5ef578375                                                                                                                            0.0s
 => => naming to docker.io/library/homepage-app                                                                                                                                                                         0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
[+] Running 2/2
 ⠿ Network homepage_default  Created                                                                                                                                                                                    0.1s
 ⠿ Container launch-dev      Started                                                           
```

```shell
$ docker compose ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
launch-dev          "docker-entrypoint.s…"   app                 running             0.0.0.0:8000->8000/tcp
```

[localhost:8000](http://localhost:8000)でホームページが表示されるのを確認する

## ~~ブログの動作確認~~

WIP

