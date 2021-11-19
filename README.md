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
- DB: postgresql

## 主な機能

- AWS EC2
- お気に入り機能

## カリキュラム外

- 'twitter'連携
## 使用Gem


- rails_admin
- cancancan
- rexml
- devise-i18n
- carrierwave
- mini_magick
- kaminari 



## カリキュラム意外

- font-awesome-sass
- ransack
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
![image](https://user-images.githubusercontent.com/84219791/142416642-8a1ca0bf-0ea9-4436-b787-07611871864c.png)

## 画面遷移図

![image](https://user-images.githubusercontent.com/84219791/142686156-0a841d8c-58d8-4556-bfd0-a94ba2e6c7e0.png)


## ワイヤーフレーム

![image](https://user-images.githubusercontent.com/84219791/142685997-8241f6dd-bc15-432c-bdec-6eec27683261.png)