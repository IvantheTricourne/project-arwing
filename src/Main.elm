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

        Reset ->
            ( { model | currentStage = Nothing, currentCharacter = Nothing }, Cmd.none )



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- view


view : Model -> Html Msg
view model =
    Element.layout
        [ Background.color black
        ]
    <|
        row
            [ centerX
            , centerY
            , spacing 3
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


viewStageSelect model =
    let
        makeStageImg stage =
            image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectStage stage
                , scale 1.1
                , padding 1
                ]
                { src = Resources.stageImgPath stage
                , description = Types.stageToString stage
                }
    in
    column
        [ centerX
        , centerY
        , spacing 20
        ]
        [ el
            [ Font.extraBold
            , Font.color white
            , centerX
            , above <|
                el
                    [ centerX
                    , Font.italic
                    , moveDown 10
                    ]
                    (text "Choose a stage")
            ]
            (text "______________________")
        , row
            [ spacing 10
            , centerX
            ]
            [ makeStageImg Battlefield
            , makeStageImg Dreamland
            , makeStageImg FinalDestination
            ]
        , row
            [ spacing 10
            , centerX
            ]
            [ makeStageImg FountainOfDreams
            , makeStageImg PokemonStadium
            , makeStageImg YoshisStory
            ]
        ]


viewCharacterSelect stage =
    let
        makeCharImg char =
            image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar char
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath char
                , description = Types.characterToString char
                }
    in
    column
        [ centerX
        , centerY
        , spacing 20
        ]
        [ el
            [ Font.extraBold
            , Font.color white
            , centerX
            , above <|
                el
                    [ centerX
                    , Font.italic
                    , moveDown 10
                    ]
                    (text "Choose a character")
            ]
            (text "______________________")
        , row
            [ spacing 10
            , centerX
            ]
            [ makeCharImg DrMario
            , makeCharImg Mario
            , makeCharImg Luigi
            , makeCharImg Bowser
            , makeCharImg Peach
            , makeCharImg Yoshi
            , makeCharImg DonkeyKong
            , makeCharImg CaptainFalcon
            , makeCharImg Ganondorf
            ]
        , row
            [ spacing 10
            , centerX
            ]
            [ makeCharImg Falco
            , makeCharImg Fox
            , makeCharImg Ness
            , makeCharImg IceClimbers
            , makeCharImg Kirby
            , makeCharImg Samus
            , makeCharImg Zelda
            , makeCharImg Sheik
            , makeCharImg Link
            , makeCharImg YoungLink
            ]
        , row
            [ spacing 10
            , centerX
            ]
            [ makeCharImg Pichu
            , makeCharImg Pikachu
            , makeCharImg JigglyPuff
            , makeCharImg Mewtwo
            , makeCharImg MrGameAndWatch
            , makeCharImg Marth
            , makeCharImg Roy
            ]
        , image
            [ Background.color white
            , Font.color white
            , Border.rounded 3
            , centerX
            , scale 0.75
            , padding 1
            , inFront <|
                el
                    [ Font.extraBold
                    , Background.color grey
                    , Border.rounded 3
                    , Events.onClick Reset
                    , alpha 0.65
                    , centerX
                    , centerY
                    , paddingXY 2 20
                    ]
                    (text "Reset")
            ]
            { src = Resources.stageImgPath stage
            , description = Types.stageToString stage
            }
        ]


viewKillPcts stage char =
    column
        [ centerX
        , centerY
        , spacing 20
        ]
        [ el
            [ Font.extraBold
            , Font.color white
            , centerX
            , above <|
                el
                    [ centerX
                    , Font.italic
                    , moveDown 10
                    ]
                    (text <| Types.stageToString stage)
            ]
            (text "______________________")
        , image
            [ Font.color white
            , Border.rounded 3
            , scale 1.1
            , padding 1
            , centerX
            ]
            { src = Resources.charIconPath char
            , description = Types.characterToString char
            }
        , el
            [ Font.color white
            , centerX
            ]
            (case getStageCharacterKillPcts stage char of
                Nothing ->
                    text "none yet ;("

                Just killPcts ->
                    column
                        [ spacing 5 ]
                        (L.map
                            (\( moveName, killpct ) ->
                                row
                                    [ centerX
                                    , spacing 10
                                    ]
                                    [ column [] [ text moveName ]
                                    , column [ Font.italic ] [ text <| String.fromInt killpct ++ "%" ]
                                    ]
                            )
                            (L.sortBy Tuple.second << Dict.toList <| killPcts)
                        )
            )
        , image
            [ Background.color white
            , Font.color white
            , Border.rounded 3
            , centerX
            , scale 0.75
            , padding 1
            , inFront <|
                el
                    [ Font.extraBold
                    , Background.color grey
                    , Border.rounded 3
                    , Events.onClick Reset
                    , alpha 0.65
                    , centerX
                    , centerY
                    , paddingXY 2 20
                    ]
                    (text "Reset")
            ]
            { src = Resources.stageImgPath stage
            , description = Types.stageToString stage
            }
        ]


black =
    rgb255 0 0 0


white =
    rgb255 255 255 255


grey =
    rgb255 25 25 25


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
