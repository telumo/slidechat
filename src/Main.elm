module Main exposing (..)

import Slides exposing (md, mdFragments, slidesDefaultOptions, Options, Action(..))

-- #####################
-- タイトル
-- #####################
slide_title =
    Slides.md
        """
        # Elm勉強会
        _関数型言語パラダイム_ 理解への簡単な近道
        """


slide_pre_title =
    Slides.md
        """
        # はじめに
        """

slide_pre_chat =
    Slides.md
        """
        # チャットできます！

        ぜひコメントしてください！

        「分からない〜〜」とか「は？」とかなんでもいいです。

        わいわい楽しくできればいいなと思っています。
        
        ※このスライドはElmで作られています。
        """

-- #####################
-- 目的
-- #####################
slide_pre_perpose =
    Slides.mdFragments
        [ "## 勉強会の目的"
        , "- Elmの言語仕様を理解する"
        , "- Elmアーキテクチャを理解する"
        , "- Elmを通して関数型のニュアンスをなんとなくつかむ"
        , "ざっくり言うと、、、"
        , "Elmを中心に説明しつつ、できれば関数型言語のパラダイムへの理解の手助けになればと思っています。"
        ]

-- #####################
-- 注意事項
-- #####################
slide_pre_caution =
    Slides.mdFragments
        [ "## 注意事項"
        , "- 私はElmが好きです。多少バイアスがかかった状態で話すことがあると思いますのでご注意ください。"
        , "- 事実と私の個人的な見解がごっちゃになる場合があります。（ぜひコメントで突っ込んでください。「それはあなたの感想ですよね？」by ひろ○き）"
        , "- あらゆる技術は手段です。どんなにElmが素晴らしいと思ったとしても、使いどころを間違えると失敗します。"
        , "- スライドは「ざっくり」です。細かいところは、公式ドキュメントや、ワークショップで説明します。"
        , "- ***Elmが好きすぎる病***が発症する可能性があります。"
        , "- ***全てがモナドに見える病***が発症する可能性はありません。（今日は、圏論やHaskellの話はしません。）"
        ]

-- #####################
-- 目次
-- #####################
slide_pre_index =
    Slides.md """
        ## 今日の内容
        - 始める少し前に
        - Elmの概要
        - Elmの言語的仕様
        - The Elm Architecture
        - Elmでアプリを作ってみよう！
        - 発展的事項
        - メリデメ
        - おわりに
        """


-- #####################
-- 始める少し前に
-- #####################
slide_bitpre =
    Slides.md "# 始める少し前に"


slide_bitpre_hasegawa =
    Slides.md """
    ## Elmと私
    私は、Elmからフロントを書き始めたと言っても過言ではありません。

    もちろんElmを知る以前からHTMLやCSSやJavaScriptについては知っていましたが、何かを書いたということは特にありません。

    [Elm-jp](https://elm-lang.jp/)が開催したElm勉強会に参加した時に

    「この言語で書いてみたい！」

    と思って、実際に**何かを作った**という感覚になったのはElmが最初です。

    またプロダクションでも使おうとしましたが、結局使いませんでした。。これについては後述します。
    """


slide_bitpre_question =
    Slides.mdFragments
        [ "## 質問（認識合わせのため / 単なる興味）"
        , "- Elmという言語は知っていますか？"
        , "- 純粋な関数型言語で何か書いたことがありますか？"
        , "- 関数型と聞いてどのようなことをイメージしますか？"
        ]

-- #####################
-- 概要
-- #####################
slide_overview_what =
    Slides.md """
    # Elmの概要

    ## Elmって何？
    """


slide_overview_what_frontend =
    Slides.md """
    ### Elmはフロントエンドの言語です。

    > Elm は JavaScript にコンパイルできる関数型プログラミング言語です。

    > ウェブサイトやウェブアプリケーションを作るツールという面では React のようなプロジェクトだと言えます。

    by [Elm公式](https://guide.elm-lang.jp/)
    """


slide_overview_what_function =
    Slides.md """
    ### Elmは関数型言語です。

    Elmは関数型言語を採用しています。

    関数型言語を利用している理由（[Elm公式](https://guide.elm-lang.jp/)より）

    > - 実用上ランタイムエラーがでないし、nullもないし、undefinedが関数だなんて話はありえません
    > - とてもわかりやすい親切なエラーメッセージによってより素早くあなたのコードに機能を追加できます
    > - コードの規模が大きくなっても全体の設計が壊れることがありません
    > - すべてのElmパッケージにおいて、決められたルールに則って自動的にバージョン番号が付与されています
    """

slide_overview_what_architecture =
    Slides.md """
    ### Elmはアーキテクチャでもあります。

    **The Elm Architecture**と呼ばれるフレームワークによってアプリケーションを構築します。

    > The Elm Architecture は、ウェブアプリケーションを構築するためのシンプルなパターンです。モジュール性やコードの再利用性、テストのしやすさなどに優れています。つまり、複雑なアプリケーションを作るときでも、安心してリファクタリングしたり機能を追加できるようにしてくれるのです。

    （by Elm公式）

    ※The Elm Architectureについては後述します。
    """


slide_overview_what_all_elm =
    Slides.md """
    ### Elmでは基本的に全てをElmで書きます。

    ビュー（Html部分）もロジック（JavaScript部分）もスタイル（CSS部分）もすべてElmで書きます。

    ※スタイルに関してはCSSファイルを利用するのも主流です。（CSS in Elmで後述します。）
    """

slide_overview_what_personally =
    Slides.md """
    ### 結局Elmってなんなのか（私の意見）

    Webアプリケーション構築に特化したツールです。
    JavaScriptのように何にでも使えるものではなく、

    > Webアプリケーション構築のベストプラクティスを集めたらElmができた

    的なものです。
    """

slide_overview_history =
    Slides.md """
    # Elmの概要

    ## Elmの歴史
    """

slide_overview_history_evancz =
    Slides.md """
    ### Elmの作者

    Evan Czaplicki

    ![evancz](https://esl-conf-static.s3.eu-central-1.amazonaws.com/media/files/000/000/091/thumbnail/evancz.jpeg?1463139393)

    彼の修士論文として最初に設計された（2012年）
    """

slide_overview_history_frp =
    Slides.md """
    ### はじめはFRPの言語だった

    Elmは発表当時はFRP（関数型リアクティブプログラミング）の言語として発表されました（※）
    
    FRPと言うのは、、

    - Observerパターンに代わるもの。「リスナー」「コールバック」とも。
    - イベント駆動型ロジックをコーディングするための、合成可能なモジュール型の手法。
    - プログラムをその入力に対する反応として表現するもの。

    Reactive Extentions（Rx）をご存知でしたら、それです。

    ※: [My Thesis is Finally Complete! "Elm: Concurrent FRP for functional GUIs"](https://www.reddit.com/r/haskell/comments/rkyoa/my_thesis_is_finally_complete_elm_concurrent_frp/)
    
    """

slide_overview_history_017 =
    Slides.md """
    ### FRPとバイバイした

    Elmは、Elm 0.17でFRPとバイバイ（※）して、代わりにsubscriptionsというメソッドを定義しました。

    ***Elmは時々互換性のない破壊的な変更を行います。***

    （95%は変更する必要ないと言っていますが。。）
    
    ※: [A Farewell to FRP](https://elm-lang.org/news/farewell-to-frp)
    """

slide_overview_history_019 =
    Slides.md """
    ### elm-langパッケージが廃止された

    Elm 0.19（最新バージョン）では、コンパイル時間が100分の1になるなどの改善があった（※）一方、

    これまでelm-langで公開されていたパッケージが***一切使えなくなって***、代わりにelmという名前空間で公開されるようになりました。

    （移行期間はかなりの混乱があったように思います。最近はだいぶマシになりました。）

    ***Elmは時々互換性のない破壊的な変更を行います。***
    
    ※: [Small Assets without the Headache](https://elm-lang.org/news/small-assets-without-the-headache)
    """

slide_overview_history_why =
    Slides.md """
    ### Elmの考え方

    ※これは個人的な意見です。

    Elmの考え方の根底には、

    ***「あらゆる機能をまんべんなく」よりも「Webアプリに必要なものを確実に」***

    という考えで作られていると思います。
    そのために不要な機能はどんどん削除するのだと思います。
    
    作者であるEvanも
    > Use Elm if it matches your needs. Use something else otherwise!
    
    と[ツイート](https://twitter.com/czaplic/status/925886519511879680)しています。
    """

-- #####################
-- Elmの言語的仕様
-- #####################

slide_lang =
    Slides.md """
    # Elmの言語的仕様

    ここでは、[Elmの公式サイト](https://guide.elm-lang.jp/)をもとに、
    
    - [言語の基礎](https://guide.elm-lang.jp/core_language.html)
    - [型](https://guide.elm-lang.jp/types/)

    を一緒にみましょう。
    """

slide_lang_importance = 
    Slides.md """
    # 言語仕様で重要な点をまとめます
    - Elmにおいて再代入可能な変数を定義することはできません
    - 型（直積・直和）を自分で作成することができます
    - パターンマッチによって型を判断してロジックを書くことができます
    """

-- #####################
-- Elmアーキテクチャ
-- #####################

slide_architecture =
    Slides.md """
    # The Elm Architecture

    - [The Elm Architecture](https://guide.elm-lang.jp/architecture/)

    を一緒にみましょう。
    """

slide_architecture_importance = 
    Slides.md
    """
    ## The Elm Architectureで重要な点をまとめます
    - Model, Update, Viewから構成される
    - （Viewから）Msgが発火される
    - Updateは、Msgを受け取ってModelを変える
    - Modelを元にしてViewは作成
    """

-- #####################
-- ワークショップ
-- #####################
slide_workshop = 
    Slides.md """
    # Elmでアプリを作ろう！

    ここでは実際に手を動かしながら実装していきます。

    みなさんもローカルにelmをインストールするか、

    ```
    npm install -g elm
    ```

    [Ellie](https://ellie-app.com/)でやってみてください！

    """

-- #####################
-- 発展的事項
-- #####################

slide_next =
    Slides.md """
    # 発展的事項

    ※ 時間があれば話します。

    フロントに関係する話
    - JSとの連携方法（port）
    - CSS in Elm
    
    関数型に関係する話
    - 関数（カリー化、部分適応）
    - 代数的データ型
    """

slide_next_port = 
    Slides.md """
    # JSとの連携方法（port）
    """

-- #####################
-- メリデメ
-- #####################

slide_merit_demerit =
    Slides.md """
    # メリデメ
    """
slide_merit = 
    Slides.md """
    # メリット（いいところ）
    - コミュニティーが狭い => 何かしらコミュニティーにいくと界隈のすごい人にあえる（みんな優しい）
    - 教育的にいいのかも？ => Elm自体は簡単
    - 関数型に慣れる最初に
    - コミットしほうだい
    """

slide_demerit = 
    Slides.md """
    # デメリット（だめなところ）
    - 結局JS使う必要が出てくる場合がある => 「Elmじゃなくても」ってなる
    - エコシステムが弱い
    - ***バージョンアップ時に、破壊的変更が行われることが多い。*** => これな。
    """

slide_when_to_use = 
    Slides.md """
    # 使いどころ

    > SEOや動作速度を気にしないツール系（管理画面）が得意

    らしいので、管理画面から作ってみるのもいいかも。

    """

-- #####################
-- おわりに
-- #####################

slide_last =
    Slides.md """
    # おわりに
    """

slide_last_onegai =
    Slides.md """
    最も学ぶべきでない言語2019の優勝者Elmですが、

    言語自体は素晴らしい言語だと思います。

    関数型の勉強になりますし、ぜひ一度使ってみてください！
    """

slide_last_reference =
    Slides.md """
    ## 参考URL
    """

myOption : Options
myOption =
    { slidesDefaultOptions
        | title = "Elm勉強会"
        , slidePixelSize =
            { height = 1000
            , width = 1500
            }
        , keysToActions =
            [ { action = GotoFirst
              , keys = [ "Home" ]
              }
            , { action = GotoLast
              , keys = [ "End" ]
              }
            , { action = GotoNext
              , keys = [ "ArrowRight" ]
              }
            , { action = GotoPrev
              , keys = [ "ArrowLeft" ]
              }
            , { action = PauseAnimation
              , keys = []
              }
            ]
    }

main =
    Slides.app
        myOption
        [ slide_title
        , slide_pre_title
        , slide_pre_chat
        , slide_pre_perpose
        , slide_pre_caution
        , slide_pre_index
        , slide_bitpre
        , slide_bitpre_hasegawa
        , slide_bitpre_question
        , slide_overview_what
        , slide_overview_what_frontend
        , slide_overview_what_function
        , slide_overview_what_architecture
        , slide_overview_what_all_elm
        , slide_overview_what_personally
        , slide_overview_history
        , slide_overview_history_evancz
        , slide_overview_history_frp
        , slide_overview_history_017
        , slide_overview_history_019
        , slide_overview_history_why
        , slide_lang
        , slide_lang_importance
        , slide_architecture 
        , slide_architecture_importance
        , slide_workshop
        , slide_next
        , slide_merit_demerit
        , slide_merit
        , slide_demerit
        , slide_when_to_use
        , slide_last
        , slide_last_onegai
        , slide_last_reference
        ]
