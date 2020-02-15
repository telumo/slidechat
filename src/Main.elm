module Main exposing (main)

import Browser
import Html exposing (Html)
-- import Html.Attributes exposing ()
import Html.Events as Events

type alias Model =
    { count : Int
    }


init : flags -> ( Model, Cmd Msg )
init _ =
    ( { count = 0 }, Cmd.none )


type Msg
    = Increment
    | Decrement


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.button [ Events.onClick Increment ] [ Html.text "カウントアップ"]
        , Html.div [ ] [ Html.text <| String.fromInt model.count ]
        , Html.button [ Events.onClick Decrement ] [ Html.text "カウントダウン"]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | count = model.count + 1 }, Cmd.none )

        Decrement ->
            ( { model | count = model.count - 1 }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
