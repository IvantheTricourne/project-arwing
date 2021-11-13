module Percents exposing (..)

import Dict exposing (..)
import Types exposing (..)


battlefieldPcts : StageInfo
battlefieldPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 89 ) ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 105 ) ]
          )
        , ( Falco
          , [ ( "Up-Smash", 95 ) ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 95 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 84 ) ]
          )
        , ( Marth
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 84 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 57 ) ]
          )
        ]


dreamlandPcts : StageInfo
dreamlandPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 100 ) ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 118 ) ]
          )
        , ( Falco
          , [ ( "Up-Smash", 106 ) ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 108 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 95 ) ]
          )
        , ( Marth
          , [ ( "Up-Smash", 93 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 85 ) ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 66 ) ]
          )
        ]


finalDestinationPcts : StageInfo
finalDestinationPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 86 ) ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 113 ) ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 97 ) ]
          )
        , ( Falco
          , [ ( "Up-Smash", 93 ) ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 102 ) ]
          )
        , ( Ganondorf
          , [ ( "Up-Smash", 89 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 88 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 86 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 85 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 81 ) ]
          )
        , ( Mario
          , [ ( "Up-Smash", 79 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 79 ) ]
          )
        , ( Marth
          , [ ( "Up-Smash", 79 ) ]
          )
        , ( Ness
          , [ ( "Up-Smash", 78 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 78 ) ]
          )
        , ( YoungLink
          , [ ( "Up-Smash", 78 ) ]
          )
        , ( Luigi
          , [ ( "Up-Smash", 76 ) ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 73 ) ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 72 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 80 ) ]
          )
        , ( Zelda
          , [ ( "Up-Smash", 70 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 69 ) ]
          )
        , ( Kirby
          , [ ( "Up-Smash", 63 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 60 ) ]
          )
        , ( Pichu
          , [ ( "Up-Smash", 60 ) ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 55 ) ]
          )
        ]


fountainOfDreamsPcts : StageInfo
fountainOfDreamsPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 90 ) ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 106 ) ]
          )
        , ( Falco
          , [ ( "Up-Smash", 96 ) ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 96 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 85 ) ]
          )
        , ( Marth
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 75 ) ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 58 ) ]
          )
        ]


pokemonStadiumPcts : StageInfo
pokemonStadiumPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 85 ) ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 99 ) ]
          )
        , ( Falco
          , [ ( "Up-Smash", 91 ) ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 90 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 79 ) ]
          )
        , ( Marth
          , [ ( "Up-Smash", 77 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 69 ) ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 53 ) ]
          )
        ]


yoshisStoryPcts : StageInfo
yoshisStoryPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 96 ) ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 91 ) ]
          )
        , ( Falco
          , [ ( "Up-Smash", 98 ) ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 96 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 76 ) ]
          )
        , ( Marth
          , [ ( "Up-Smash", 73 ) ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 68 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 66 ) ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 57 ) ]
          )
        ]


getStageStageInfo : Stage -> StageInfo
getStageStageInfo stage =
    case stage of
        Battlefield ->
            battlefieldPcts

        Dreamland ->
            dreamlandPcts

        FinalDestination ->
            finalDestinationPcts

        FountainOfDreams ->
            fountainOfDreamsPcts

        PokemonStadium ->
            pokemonStadiumPcts

        YoshisStory ->
            pokemonStadiumPcts


getStageCharacterKillPcts : Stage -> Character -> Maybe KillPcts
getStageCharacterKillPcts stage character =
    getCharKillPcts character (getStageStageInfo stage)
