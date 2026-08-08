module Percents exposing (..)

import Dict exposing (..)
import Types exposing (..)


battlefieldPcts : StageInfo
battlefieldPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 95 )
            , ( "UT UA", 106 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 112 )
            , ( "UT UA", 113 )
            ]
          )
        , ( Falco
          , [ ( "Up-Smash", 102 )
            , ( "UT UA", 116 )
            ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 95 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 90 )
            , ( "UT UA", 88 )
            ]
          )
        , ( Marth
          , [ ( "Up-Smash", 87 )
            , ( "UT UA", 86 )
            ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 80 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 79 )
            , ( "U-Air", 84 )
            ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 61 )
            , ( "UT UA", 53 )
            , ( "Up-tilt", 96 )
            , ( "D-tilt", 116 )
            , ( "B-Air", 119 )
            , ( "FC US", 38 )
            ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 80 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 87 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 87 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 95 ) ]
          )
        , ( Luigi
          , [ ( "Up-Smash", 85 ) ]
          )
        , ( Ganondorf
          , [ ( "Up-Smash", 99 ) ]
          )
        , ( Mario
          , [ ( "Up-Smash", 87 ) ]
          )
        , ( YoungLink
          , [ ( "Up-Smash", 86 ) ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 107 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 97 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 67 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 89 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 77 ) ]
          )
        , ( Zelda
          , [ ( "Up-Smash", 73 ) ]
          )
        , ( Ness
          , [ ( "Up-Smash", 81 ) ]
          )
        , ( Pichu
          , [ ( "Up-Smash", 67 ) ]
          )
        ]


finalDestinationPcts : StageInfo
finalDestinationPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 92 )
            , ( "UT UA", 103 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 109 )
            , ( "UT UA", 108 )
            ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 104 ) ]
          )
        , ( Falco
          , [ ( "Up-Smash", 99 )
            , ( "UT UA", 111 )
            ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 102 ) ]
          )
        , ( Ganondorf
          , [ ( "Up-Smash", 95 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 94 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 92 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 88 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 87 )
            , ( "UT UA", 83 )
            ]
          )
        , ( Mario
          , [ ( "Up-Smash", 84 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 84 ) ]
          )
        , ( Marth
          , [ ( "Up-Smash", 84 )
            , ( "UT UA", 80 )
            ]
          )
        , ( Ness
          , [ ( "Up-Smash", 78 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 84 ) ]
          )
        , ( YoungLink
          , [ ( "Up-Smash", 83 ) ]
          )
        , ( Luigi
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 78 ) ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 77 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 76 )
            , ( "U-Air", 79 )
            ]
          )
        , ( Zelda
          , [ ( "Up-Smash", 70 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 74 ) ]
          )
        , ( Kirby
          , [ ( "Up-Smash", 63 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 64 ) ]
          )
        , ( Pichu
          , [ ( "Up-Smash", 64 ) ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 59 )
            , ( "UT UA", 50 )
            , ( "Up-tilt", 92 )
            , ( "D-tilt", 113 )
            , ( "B-Air", 121 )
            , ( "FC US", 36 )
            ]
          )
        ]


yoshisStoryPcts : StageInfo
yoshisStoryPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 88 )
            , ( "UT UA", 96 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 103 )
            , ( "UT UA", 100 )
            ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 98 ) ]
          )
        , ( Falco
          , [ ( "Up-Smash", 94 )
            , ( "UT UA", 105 )
            ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 96 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 81 )
            , ( "UT UA", 77 )
            ]
          )
        , ( Marth
          , [ ( "Up-Smash", 78 )
            , ( "UT UA", 74 )
            ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 73 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 71 )
            , ( "U-Air", 75 )
            ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 55 )
            , ( "UT UA", 44 )
            , ( "Up-tilt", 88 )
            , ( "D-tilt", 105 )
            , ( "B-Air", 110 )
            , ( "FC US", 33 )
            ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 72 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 78 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 79 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 86 ) ]
          )
        , ( Luigi
          , [ ( "Up-Smash", 76 ) ]
          )
        , ( Ganondorf
          , [ ( "Up-Smash", 90 ) ]
          )
        , ( Mario
          , [ ( "Up-Smash", 79 ) ]
          )
        , ( YoungLink
          , [ ( "Up-Smash", 78 ) ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 98 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 88 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 60 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 83 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 69 ) ]
          )
        , ( Zelda
          , [ ( "Up-Smash", 65 ) ]
          )
        , ( Ness
          , [ ( "Up-Smash", 73 ) ]
          )
        , ( Pichu
          , [ ( "Up-Smash", 60 ) ]
          )
        ]


fountainOfDreamsPcts : StageInfo
fountainOfDreamsPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 96 )
            , ( "UT UA", 107 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 113 )
            , ( "UT UA", 114 )
            ]
          )
        , ( Falco
          , [ ( "Up-Smash", 103 )
            , ( "UT UA", 116 )
            ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 96 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 90 )
            , ( "UT UA", 88 )
            ]
          )
        , ( Marth
          , [ ( "Up-Smash", 88 )
            , ( "UT UA", 86 )
            ]
          )
        , ( Peach
          , [ ( "Up-Smash", 80 )
            , ( "U-Air", 85 )
            ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 62 )
            , ( "UT UA", 54 )
            , ( "Up-tilt", 96 )
            , ( "D-tilt", 114 )
            , ( "B-Air", 119 )
            , ( "FC US", 38 )
            ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 81 ) ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 81 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 87 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 88 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 96 ) ]
          )
        , ( Luigi
          , [ ( "Up-Smash", 85 ) ]
          )
        , ( Ganondorf
          , [ ( "Up-Smash", 99 ) ]
          )
        , ( Mario
          , [ ( "Up-Smash", 88 ) ]
          )
        , ( YoungLink
          , [ ( "Up-Smash", 87 ) ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 108 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 98 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 67 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 92 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 77 ) ]
          )
        , ( Zelda
          , [ ( "Up-Smash", 73 ) ]
          )
        , ( Ness
          , [ ( "Up-Smash", 81 ) ]
          )
        , ( Pichu
          , [ ( "Up-Smash", 63 ) ]
          )
        ]


dreamlandPcts : StageInfo
dreamlandPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 106 )
            , ( "UT UA", 127 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 125 )
            , ( "UT UA", 127 )
            ]
          )
        , ( Falco
          , [ ( "Up-Smash", 113 )
            , ( "UT UA", 136 )
            ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 108 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 102 )
            , ( "UT UA", 104 )
            ]
          )
        , ( Marth
          , [ ( "Up-Smash", 99 )
            , ( "UT UA", 100 )
            ]
          )
        , ( Peach
          , [ ( "Up-Smash", 90 )
            , ( "U-Air", 101 )
            ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 71 )
            , ( "UT UA", 66 )
            , ( "Up-tilt", 107 )
            , ( "D-tilt", 129 )
            , ( "B-Air", 132 )
            , ( "FC US", 45 )
            ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 91 ) ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 91 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 100 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 100 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 108 ) ]
          )
        , ( Luigi
          , [ ( "Up-Smash", 97 ) ]
          )
        , ( Ganondorf
          , [ ( "Up-Smash", 112 ) ]
          )
        , ( Mario
          , [ ( "Up-Smash", 100 ) ]
          )
        , ( YoungLink
          , [ ( "Up-Smash", 98 ) ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 120 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 110 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 76 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 103 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 87 ) ]
          )
        , ( Zelda
          , [ ( "Up-Smash", 84 ) ]
          )
        , ( Ness
          , [ ( "Up-Smash", 92 ) ]
          )
        ]


pokemonStadiumPcts : StageInfo
pokemonStadiumPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 91 )
            , ( "UT UA", 101 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 106 )
            , ( "UT UA", 106 )
            ]
          )
        , ( Falco
          , [ ( "Up-Smash", 95 )
            , ( "UT UA", 111 )
            ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 90 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 85 )
            , ( "UT UA", 81 )
            ]
          )
        , ( Marth
          , [ ( "Up-Smash", 82 )
            , ( "UT UA", 78 )
            ]
          )
        , ( Peach
          , [ ( "Up-Smash", 74 )
            , ( "U-Air", 78 )
            ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 57 )
            , ( "UT UA", 47 )
            , ( "Up-tilt", 90 )
            , ( "D-tilt", 109 )
            , ( "B-Air", 119 )
            , ( "FC US", 36 )
            ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 75 ) ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 76 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 81 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 90 ) ]
          )
        , ( Luigi
          , [ ( "Up-Smash", 79 ) ]
          )
        , ( Ganondorf
          , [ ( "Up-Smash", 93 ) ]
          )
        , ( Mario
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( YoungLink
          , [ ( "Up-Smash", 81 ) ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 102 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 92 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 62 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 86 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 72 ) ]
          )
        , ( Zelda
          , [ ( "Up-Smash", 68 ) ]
          )
        , ( Ness
          , [ ( "Up-Smash", 76 ) ]
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
            yoshisStoryPcts


getStageCharacterKillPcts : Stage -> Character -> Maybe KillPcts
getStageCharacterKillPcts stage character =
    getCharKillPcts character (getStageStageInfo stage)
