# README

# 製品概要
開発した背景：僕はプログラミングスクールに入りRubyonRailsを学び成果物を作成しようと考えたころいくつか疑問が生まれました。実際どんなものが作れるのか？
インターネットで検索しても解決につながる記事は見つかりませんでした。成果物の作成に悩んでいるかた、また言語によってどんなものが作れるのか知りたい方そんな方々の少しでも役に立つことができればと思ったのがきっかけです。
<br>
問題点と解決策
成果物の案に悩んでいる、言語によってどんなものが作れるかわからない、成果物を就活後眠らせてしまう、自分の成果物を少しでも世間に広めたい、アウトプットしながら就職活動がしたい、そんな方々の悩みを解決するためのアプリケーションとなっています。



##   開発環境

- ruby '3.0.1'
- 'rails', '~> 6.0.3'
- 'webpacker', '~> 4.0'
- node 14.18.0


## 主な機能

- メッセージ機能
- お気に入り機能

## カリキュラム外


- ransack
- cocoon
- enum_help
## 使用Gem


- rails_admin
- cancancan
- rexml
- devise-i18n
- carrierwave
- mini_magick
- kaminari 


## 実行手順

````
$ git clone https://github.com/Saito2109/original_app.git
$ cd original_app
$ bundle install
$ rails db:create db:migrate
$ rails db:seed
$ rails s
````

## 要件定義



- (カタログ設計)
- (テーブル定義書)
- (ER図)
- (画面遷移図)
- (ワイヤーフレーム)

https://docs.google.com/spreadsheets/d/1fFOKT0A35OePBsl609Y039-jgdmeZTdP5x_5raZ8yRo/edit?usp=sharing

## ER図

![image](https://user-images.githubusercontent.com/84219791/144375397-b74bae27-7c9a-4230-a421-928c484096cc.png)

## 画面遷移図

<img width="856" alt="スクリーンショット 2021-12-08 13 52 56" src="https://user-images.githubusercontent.com/84219791/145151786-c01d8c32-4c30-47c2-846d-52f93c8191b8.png">



## ワイヤーフレーム

<img width="1289" alt="スクリーンショット 2021-12-08 13 36 59" src="https://user-images.githubusercontent.com/84219791/145151832-57be87f2-e4d8-45cc-ad2a-3e6a544701a8.png">
