module Main exposing (..)

import Slides exposing (md, mdFragments, slidesDefaultOptions, Options, Action(..))


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


slide_pre_perpose =
    Slides.mdFragments
        [ "## 勉強会の目的"
        , "- Elmの言語仕様を理解する"
        , "- Elmアーキテクチャを理解する"
        , "- Elmを通して関数型のニュアンスをなんとなくつかむ"
        , "ざっくり言うと、、、"
        , "Elmを中心に説明しつつ、できれば関数型言語のパラダイムへの理解の手助けになればと思っています。"
        ]


slide_pre_caution =
    Slides.mdFragments
        [ "## 注意事項"
        , "- 私はElmが好きです。多少バイアスがかかった状態で話すことがあると思いますのでご注意ください。"
        , "- 事実と私の個人的な見解がごっちゃになる場合があります。"
        , "- あらゆる技術は手段です。どんなにElmが素晴らしいと思ったとしても、使いどころを間違えると失敗します。"
        , "- ***Elmが好きすぎる病***が発症する可能性があります。"
        , "- ***全てがモナドに見える病***が発症する可能性はありません。（今日は、圏論やHaskellの話はしません。）"
        ]


slide_pre_index =
    Slides.md """
        ## 今日の内容
        - 始める少し前に
        - Elmの概要
        - Elmの言語的仕様
        - The Elm Architecture
        - Elmでアプリを作ってみよう！
        - 発展的事項
        - おわりに
        """


slide_bitpre =
    Slides.md "# 始める少し前に"


slide_bitpre_hasegawa =
    Slides.md """
    ## Elmと長谷川
    私は、Elmからフロントを書き始めたと言っても過言ではありません。

    もちろんElmを知る以前からHTMLやCSSやJavaScriptについては知っていましたが、何かを書いたということは特にありません。

    [Elm-jp](https://elm-lang.jp/)が開催したElm勉強会に参加した時に

    「この言語で書いてみたい！」

    と思って、実際に**何かを作った**という感覚になったのはElmが最初です。

    またプロダクションでも使おうとしましたが、結局使いませんでした。。これについては後述します。
    """


slide_bitpre_question =
    Slides.mdFragments
        [ "## 質問（認識合わせのため）"
        , "- 関数型というパラダイムを知っていますか？使ったことがありますか？"
        , "- 関数型と聞いてどのようなことをイメージしますか？"
        ]


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
    
    FRPと言うのは、、TODO

    ※: [My Thesis is Finally Complete! "Elm: Concurrent FRP for functional GUIs"](https://www.reddit.com/r/haskell/comments/rkyoa/my_thesis_is_finally_complete_elm_concurrent_frp/)
    
    """

slide_overview_history_017 =
    Slides.md """
    ### FRPとバイバイした

    Elmは、Elm 0.17でFRPとバイバイ（※）して、代わりにsubscriptionというメソッドを定義しました。

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
    ### Elmの歴史からみるElmの考え方

    ※これは個人的な意見です。

    Elmの考え方の根底には、

    ***「あらゆる機能をまんべんなく」よりも「Webアプリに必要な*ど真ん中*を確実に」***

    という考えで作られていると思います。
    そのために不要な機能はどんどん削除するのだと思います。
    
    作者であるEvanも
    > Use Elm if it matches your needs. Use something else otherwise!
    
    と[ツイート](https://twitter.com/czaplic/status/925886519511879680)しています。
    """

slide_lang =
    Slides.md "# Elmの言語的仕様"

slide_lang_value_string =
    Slides.md """
    # 文字列

    文字列は一般的な言語と同様にダブルクォーテーション（`"`）で囲んで作成します。

    文字列の連結は`++`で行います。

    ```elm
    > "hello"
    "hello"

    > "hello" ++ "world"
    "helloworld"

    > "hello" ++ " world"
    "hello world"
    ```

    """

slide_lang_value_number =
    Slides.md """
    # 数値

    数値も一般的な言語と同様に利用できます。つまらないですね。

    ```elm
    > 2 + 3 * 4
    14

    > (2 + 3) * 4
    20

    > 9 / 2
    4.5

    > 9 // 2
    4
    ```

    """

slide_lang_value_function_1 =
    Slides.md """
    # 関数

    関数の利用方法を詳しく見てみましょう。

    ```elm
    > isNegative n = n < 0
    <function>

    > isNegative 4
    False

    > isNegative -71                                                                    
    True

    > isNegative (-3 * -4)
    False
    ```

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
        , slide_lang_value_string
        , slide_lang_value_number
        , slide_lang_value_function_1
        ]
