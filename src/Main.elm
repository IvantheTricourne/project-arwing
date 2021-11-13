port module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)
import Json.Decode as D
import Json.Encode as E
import Types
import Resources
import Types exposing (Stage(..))
import Percents exposing (..)

-- model

type alias Model =
  { currentStage : Maybe Types.Stage
  }

-- update

type Msg
  = SelectStage Types.Stage
  | Reset

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of
    SelectStage stage -> ( { model | currentStage = Just stage }, Cmd.none )
    Reset -> ( { model | currentStage = Nothing }, Cmd.none )

-- subscriptions
subscriptions : Model -> Sub Msg
subscriptions _ = Sub.none

-- view

view : Model -> Html Msg
view model =
  Element.layout [ Background.color black
                 ] <|
  row [ centerX
      , centerY
      , spacing 3
      ]
      [ case model.currentStage of
         Nothing -> viewStageSelect model
         Just stage -> viewCharacterSelect stage model
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
        , scale 1.1
        , padding 1
        ]
        { src = Resources.stageImgPath YoshisStory
        , description = "Yoshi's Story"
        }
      ]
    ]

viewCharacterSelect stage model = 
  row [ centerX
      , centerY
      , spacing 3
      ]
      [
      ]

black = rgb255 0 0 0
white = rgb255 255 255 255
grey = rgb255 25 25 25
red = rgb255 255 0 0

btnElement str msg =
  Input.button [ Background.color black
               , Element.focused [ Background.color black
                                 ]
               , Element.mouseOver [ Font.color white
                                   ]
               , Font.color black
               , Font.semiBold
               , Font.family [ Font.external
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

infoElement msg modelField =
  Input.multiline [ Background.color white
                  , Element.focused [ Background.color white
                                    ]
                  , Font.color grey
                  , Font.extraBold
                  , Font.center
                  , Font.family [ Font.external
                                 { name = "Roboto"
                                 , url = "https://fonts.googleapis.com/css?family=Roboto"
                                 }
                                , Font.sansSerif
                                ]
                  , Font.size 28
                  , Border.rounded 5
                  , Border.color black
                  ]
  { onChange = msg
  , text = modelField
  , placeholder = Nothing
  , label = Input.labelHidden ""
  , spellcheck = False
  }

-- local storage

port setStorage : E.Value -> Cmd msg

updateWithStorage : Msg -> Model -> ( Model, Cmd Msg )
updateWithStorage msg oldModel =
  let
    ( newModel, cmds ) = update msg oldModel
  in
  ( newModel
  , Cmd.batch [ setStorage (encode newModel), cmds ]
  )

-- JSON ENCODE/DECODE

encode : Model -> E.Value
encode model =
  E.object
    [ ("currentStage"
      , case model.currentStage of
          Nothing -> E.null
          Just stage -> Types.stageEncoder stage
      )
    ]


decoder : D.Decoder Model
decoder =
  D.map Model
    (D.field "currentStage" <| D.nullable Types.stageDecoder)

-- main

init : E.Value -> ( Model, Cmd Msg )
init flags =
  ( case D.decodeValue decoder flags of
      Ok model -> model
      Err _ ->
        { currentStage = Nothing
        }
  , Cmd.none
  )

main = Browser.element
  { init = init
  , update = updateWithStorage
  , view = view
  , subscriptions = subscriptions
  }