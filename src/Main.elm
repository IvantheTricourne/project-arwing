port module Main exposing (..)

import Browser
import Dict
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)
import Json.Decode as D
import Json.Encode as E
import List as L
import Percents exposing (..)
import Resources
import Types exposing (Character(..), Stage(..))



-- model


type alias Model =
    { currentStage : Maybe Types.Stage
    , currentCharacter : Maybe Types.Character
    }



-- update


type Msg
    = SelectStage Types.Stage
    | SelectChar Types.Character
    | NoOp
    | Back
    | Reset


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectStage stage ->
            ( { model | currentStage = Just stage }, Cmd.none )

        SelectChar char ->
            ( { model | currentCharacter = Just char }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

        Back ->
            ( if model.currentCharacter /= Nothing then
                { model | currentCharacter = Nothing }

              else
                { model | currentStage = Nothing }
            , Cmd.none
            )

        Reset ->
            ( { model | currentStage = Nothing, currentCharacter = Nothing }, Cmd.none )



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- view


maxContentWidth : Int
maxContentWidth =
    480


charIconSize : Int
charIconSize =
    52


stageIconWidth : Int
stageIconWidth =
    120


stageIconHeight : Int
stageIconHeight =
    105


view : Model -> Html Msg
view model =
    Element.layout
        [ Background.color black
        , Font.color white
        , width fill
        , height fill
        ]
    <|
        el
            [ width fill
            , height fill
            ]
        <|
            column
                [ centerX
                , centerY
                , width (fill |> maximum maxContentWidth)
                , paddingXY 16 24
                , spacing 24
                ]
                [ case model.currentStage of
                    Nothing ->
                        viewStageSelect model

                    Just stage ->
                        case model.currentCharacter of
                            Nothing ->
                                viewCharacterSelect stage

                            Just char ->
                                viewKillPcts stage char
                ]


header : Bool -> String -> Element Msg
header canGoBack title =
    column
        [ width fill
        , spacing 12
        ]
        [ row
            [ width fill ]
            [ if canGoBack then
                navButton Back "‹ Back"

              else
                el [ width (px 72) ] none
            , el
                [ centerX
                , Font.extraBold
                , Font.italic
                , Font.size 20
                ]
                (text title)
            , el [ width (px 72) ] none
            ]
        , el
            [ width fill
            , height (px 2)
            , Background.color white
            ]
            none
        ]


navButton : Msg -> String -> Element Msg
navButton msg label =
    Input.button
        [ Font.size 15
        , Font.semiBold
        , Background.color grey
        , Border.rounded 8
        , Border.width 1
        , Border.color lightGrey
        , paddingXY 12 10
        ]
        { onPress = Just msg
        , label = text label
        }


viewStageSelect : Model -> Element Msg
viewStageSelect model =
    let
        makeStageImg stage =
            iconButton (SelectStage stage)
                stageIconWidth
                stageIconHeight
                (Resources.stageImgPath stage)
                (Types.stageToString stage)
    in
    column
        [ centerX
        , spacing 24
        , width fill
        ]
        [ header False "Choose a Stage"
        , wrappedRow
            [ spacing 12
            , centerX
            ]
            [ makeStageImg Battlefield
            , makeStageImg Dreamland
            , makeStageImg FinalDestination
            , makeStageImg FountainOfDreams
            , makeStageImg PokemonStadium
            , makeStageImg YoshisStory
            ]
        ]


viewCharacterSelect : Types.Stage -> Element Msg
viewCharacterSelect stage =
    let
        makeCharImg char =
            iconButton (SelectChar char)
                charIconSize
                charIconSize
                (Resources.charIconPath char)
                (Types.characterToString char)

        allChars =
            [ Mario
            , DrMario
            , Luigi
            , Bowser
            , Peach
            , Yoshi
            , DonkeyKong
            , CaptainFalcon
            , Ganondorf
            , Falco
            , Fox
            , Ness
            , IceClimbers
            , Kirby
            , Samus
            , Zelda
            , Sheik
            , Link
            , YoungLink
            , Pichu
            , Pikachu
            , JigglyPuff
            , Mewtwo
            , MrGameAndWatch
            , Marth
            , Roy
            ]
    in
    column
        [ centerX
        , spacing 24
        , width fill
        ]
        [ header True (Types.stageToString stage)
        , wrappedRow
            [ spacing 10
            , centerX
            ]
            (L.map makeCharImg allChars)
        , el [ centerX ] (navButton Reset "Reset")
        ]


viewKillPcts : Types.Stage -> Types.Character -> Element Msg
viewKillPcts stage char =
    column
        [ centerX
        , spacing 24
        , width fill
        ]
        [ header True (Types.stageToString stage)
        , image
            [ centerX
            , width (px 80)
            , height (px 80)
            , Border.rounded 6
            , Background.color white
            ]
            { src = Resources.charIconPath char
            , description = Types.characterToString char
            }
        , el
            [ centerX
            , Font.size 17
            ]
            (case getStageCharacterKillPcts stage char of
                Nothing ->
                    text "none yet ;("

                Just killPcts ->
                    column
                        [ spacing 8 ]
                        (L.map
                            (\( moveName, killpct ) ->
                                row
                                    [ centerX
                                    , spacing 16
                                    , width (fill |> maximum 320)
                                    ]
                                    [ el [ width fill ] (text moveName)
                                    , el
                                        [ Font.italic
                                        , Font.bold
                                        , alignRight
                                        ]
                                        (text <| String.fromInt killpct ++ "%")
                                    ]
                            )
                            (L.sortBy Tuple.second << Dict.toList <| killPcts)
                        )
            )
        , el [ centerX ] (navButton Reset "Reset")
        ]


iconButton : Msg -> Int -> Int -> String -> String -> Element Msg
iconButton msg w h src description =
    image
        [ Background.color white
        , Border.rounded 6
        , Border.width 2
        , Border.color grey
        , Events.onClick msg
        , pointer
        , width (px w)
        , height (px h)
        , padding 2
        ]
        { src = src
        , description = description
        }


black =
    rgb255 0 0 0


white =
    rgb255 255 255 255


grey =
    rgb255 25 25 25


lightGrey =
    rgb255 90 90 90


red =
    rgb255 255 0 0



-- local storage


port setStorage : E.Value -> Cmd msg


updateWithStorage : Msg -> Model -> ( Model, Cmd Msg )
updateWithStorage msg oldModel =
    let
        ( newModel, cmds ) =
            update msg oldModel
    in
    ( newModel
    , Cmd.batch [ setStorage (encode newModel), cmds ]
    )



-- JSON ENCODE/DECODE


encode : Model -> E.Value
encode model =
    E.object
        [ ( "currentStage"
          , case model.currentStage of
                Nothing ->
                    E.null

                Just stage ->
                    Types.stageEncoder stage
          )
        , ( "currentCharacter"
          , case model.currentCharacter of
                Nothing ->
                    E.null

                Just char ->
                    Types.characterEncoder char
          )
        ]


decoder : D.Decoder Model
decoder =
    D.map2 Model
        (D.field "currentStage" <| D.nullable Types.stageDecoder)
        (D.field "currentCharacter" <| D.nullable Types.characterDecoder)



-- main


init : E.Value -> ( Model, Cmd Msg )
init flags =
    ( case D.decodeValue decoder flags of
        Ok model ->
            model

        Err _ ->
            { currentStage = Nothing
            , currentCharacter = Nothing
            }
    , Cmd.none
    )


main =
    Browser.element
        { init = init
        , update = updateWithStorage
        , view = view
        , subscriptions = subscriptions
        }
