port module Main exposing (..)

import Browser
import Debug exposing (toString)
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
    | Reset


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectStage stage ->
            ( { model | currentStage = Just stage }, Cmd.none )

        SelectChar char ->
            ( { model | currentCharacter = Just char }, Cmd.none )

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
            [ image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectStage Battlefield
                , scale 1.1
                , padding 1
                ]
                { src = Resources.stageImgPath Battlefield
                , description = "Battlefield"
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectStage Dreamland
                , scale 1.1
                , padding 1
                ]
                { src = Resources.stageImgPath Dreamland
                , description = "Dreamland"
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectStage FinalDestination
                , scale 1.1
                , padding 1
                ]
                { src = Resources.stageImgPath FinalDestination
                , description = "Final Destination"
                }
            ]
        , row
            [ spacing 10
            , centerX
            ]
            [ image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectStage FountainOfDreams
                , scale 1.1
                , padding 1
                ]
                { src = Resources.stageImgPath FountainOfDreams
                , description = "Fountain Of Dreams"
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectStage PokemonStadium
                , scale 1.1
                , padding 1
                ]
                { src = Resources.stageImgPath PokemonStadium
                , description = "Pokémon Stadium"
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectStage YoshisStory
                , scale 1.1
                , padding 1
                ]
                { src = Resources.stageImgPath YoshisStory
                , description = "Yoshi's Story"
                }
            ]
        ]


viewCharacterSelect stage =
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
            [ image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar DrMario
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath DrMario
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Mario
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Mario
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Luigi
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Luigi
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Bowser
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Bowser
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Peach
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Peach
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Yoshi
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Yoshi
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar DonkeyKong
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath DonkeyKong
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar CaptainFalcon
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath CaptainFalcon
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Ganondorf
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Ganondorf
                , description = ""
                }
            ]
        , row
            [ spacing 10
            , centerX
            ]
            [ image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Falco
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Falco
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Fox
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Fox
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Ness
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Ness
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar IceClimbers
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath IceClimbers
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Kirby
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Kirby
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Samus
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Samus
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Zelda
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Zelda
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Link
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Link
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar YoungLink
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath YoungLink
                , description = ""
                }
            ]
        , row
            [ spacing 10
            , centerX
            ]
            [ image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Pichu
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Pichu
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Pikachu
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Pikachu
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar JigglyPuff
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath JigglyPuff
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Mewtwo
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Mewtwo
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar MrGameAndWatch
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath MrGameAndWatch
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Marth
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Marth
                , description = ""
                }
            , image
                [ Background.color white
                , Font.color white
                , Border.rounded 3
                , Events.onClick <| SelectChar Roy
                , scale 1.1
                , padding 1
                ]
                { src = Resources.charIconPath Roy
                , description = ""
                }
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
            , description = ""
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
                        []
                        (L.map
                            (\( moveName, killpct ) ->
                                row
                                    []
                                    [ text moveName
                                    , text " "
                                    , el [ Font.italic ] (text <| toString killpct ++ "%")
                                    ]
                            )
                            (Dict.toList killPcts)
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


btnElement str msg =
    Input.button
        [ Background.color black
        , Element.focused
            [ Background.color black
            ]
        , Element.mouseOver
            [ Font.color white
            ]
        , Font.color black
        , Font.semiBold
        , Font.family
            [ Font.external
                { name = "Roboto"
                , url = "https://fonts.googleapis.com/css?family=Roboto"
                }
            , Font.monospace
            ]
        , padding 10
        ]
        { onPress = Just msg
        , label = text str
        }



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
