# at_book

Attendance BookのDockerfileです。

以下はローカルでのアプリの起動方法です。

## 1. 準備

Docker Desktopをインストールしてください。

以下からダウンロードできます。

https://www.docker.com/products/docker-desktop

インストールが完了したらDocker Desktopを起動してください。

## 2. build

Dockerイメージの構築を行います。

Dockerfileが置かれているディレクトリで以下のコマンドを実行してください。

```sh
$ docker buildx build . --platform linux/amd64 -t at_book_web:latest
```

## 3. run

Dockerコンテナの作成と起動を行います。

以下のコマンドを実行してください。

```sh
$ docker run -p 8000:8000 -e PORT=8000 --platform linux/amd64 at_book_web:latest
```

ブラウザに以下のURLを入力してアプリに接続できます。

http://localhost:8000/attendance_book/

または

http://ホストマシンのIPアドレス:8000/attendance_book/

## その他 ps/stop/start/rm

起動中のコンテナを確認するには以下のコマンドを入力します。コンテナ名などが確認できます。

```sh
$ docker ps
```

また、全てのコンテナを確認するには以下のコマンドを入力します。
```sh
$ docker ps -a
```

起動中のコンテナを停止させるには以下のコマンドを入力します。これを行ってもアプリのデータベース上に記録した内容が消えることはありません。

```sh
$ docker stop コンテナ名
```

停止中のコンテナを起動させるには以下のコマンドを入力します。

```sh
$ docker start コンテナ名
```

停止中のコンテナを削除するには以下のコマンドを入力します。これを行うとアプリのデータベース上に記録した内容が消えます。

```sh
$ docker rm コンテナ名
```
