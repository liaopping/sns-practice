# Ruby on Rails　選考カリキュラム

こちらはRUNTEQのRuby on Rails選考カリキュラムです。
写真投稿サービスをベースに機能拡張を行っていただきます。

## Ruby version

* 2.6.4

## Rails version

* 5.2.3

## System dependencies

* MySQL 5.7
* Node.js >= v12.14.0
* Yarn >= 1.19.2

## Project initiation

* Gemのインストール

```
$ bundle install --path=vendor/bundle
```

* npmのインストール

```
$ yarn install
```

## Configuration

ファイルの中身はご自身の環境に合わせて適宜変更してください

* データベースの設定

```
$ cp config/database.yml.default config/database.yml
```


## Database creation

```
$ bundle exec rails db:reset
```

## Run rails server

```
$ bundle exec rails server
```
