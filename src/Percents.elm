module Percents exposing (..)

import Dict exposing (..)
import Types exposing (..)


battlefieldPcts : StageInfo
battlefieldPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 89 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 88 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 105 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 88 )
            ]
          )
        , ( Falco
          , [ ( "Up-Smash", 95 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 88 )
            ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 95 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 84 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 88 )
            ]
          )
        , ( Marth
          , [ ( "Up-Smash", 82 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 88 )
            ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 84 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 82 )
            , ( "U-Air", 84 )
            ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 57 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 88 )
            , ( "Up-tilt", 96 )
            , ( "D-tilt", 116 )
            , ( "B-Air", 119 )
            , ( "FC US", 38 )
            ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 75 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 89 ) ]
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
          , [ ( "Up-Smash", 100 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 91 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 62 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 80 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 72 ) ]
          )
        , ( Zelda
          , [ ( "Up-Smash", 73 ) ]
          )
        , ( Ness
          , [ ( "Up-Smash", 81 ) ]
          )
        , ( Pichu
          , [ ( "Up-Smash", 62 ) ]
          )
        ]
        |> addPlatformKillPcts SidePlatform
            [ ( Fox
              , [ ( "UT UA (0 SDI)", 104 )
                , ( "UT UA (1.5 SDI)", 78 )
                , ( "UT UA (TAS)", 78 )
                ]
              )
            , ( CaptainFalcon
              , [ ( "UT UA (0 SDI)", 104 )
                , ( "UT UA (1.5 SDI)", 78 )
                , ( "UT UA (TAS)", 78 )
                ]
              )
            , ( Falco
              , [ ( "UT UA (0 SDI)", 104 )
                , ( "UT UA (1.5 SDI)", 78 )
                , ( "UT UA (TAS)", 78 )
                ]
              )
            , ( Sheik
              , [ ( "UT UA (0 SDI)", 104 )
                , ( "UT UA (1.5 SDI)", 78 )
                , ( "UT UA (TAS)", 78 )
                ]
              )
            , ( Marth
              , [ ( "UT UA (0 SDI)", 104 )
                , ( "UT UA (1.5 SDI)", 78 )
                , ( "UT UA (TAS)", 78 )
                ]
              )
            , ( JigglyPuff
              , [ ( "UT UA (0 SDI)", 104 )
                , ( "UT UA (1.5 SDI)", 78 )
                , ( "UT UA (TAS)", 78 )
                ]
              )
            ]
        |> addPlatformKillPcts TopPlatform
            [ ( Fox
              , [ ( "UT UA (0 SDI)", 94 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            , ( CaptainFalcon
              , [ ( "UT UA (0 SDI)", 94 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            , ( Falco
              , [ ( "UT UA (0 SDI)", 94 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            , ( Sheik
              , [ ( "UT UA (0 SDI)", 94 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            , ( Marth
              , [ ( "UT UA (0 SDI)", 94 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            , ( JigglyPuff
              , [ ( "UT UA (0 SDI)", 94 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            ]


finalDestinationPcts : StageInfo
finalDestinationPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 86 )
            , ( "UT UA (0 SDI)", 108 )
            , ( "UT UA (1.5 SDI)", 82 )
            , ( "UT UA (TAS)", 83 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 113 )
            , ( "UT UA (0 SDI)", 108 )
            , ( "UT UA (1.5 SDI)", 82 )
            , ( "UT UA (TAS)", 83 )
            ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 97 ) ]
          )
        , ( Falco
          , [ ( "Up-Smash", 93 )
            , ( "UT UA (0 SDI)", 108 )
            , ( "UT UA (1.5 SDI)", 82 )
            , ( "UT UA (TAS)", 83 )
            ]
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
          , [ ( "Up-Smash", 81 )
            , ( "UT UA (0 SDI)", 108 )
            , ( "UT UA (1.5 SDI)", 82 )
            , ( "UT UA (TAS)", 83 )
            ]
          )
        , ( Mario
          , [ ( "Up-Smash", 79 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 79 ) ]
          )
        , ( Marth
          , [ ( "Up-Smash", 79 )
            , ( "UT UA (0 SDI)", 108 )
            , ( "UT UA (1.5 SDI)", 82 )
            , ( "UT UA (TAS)", 83 )
            ]
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
          , [ ( "Up-Smash", 77 ) ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 73 ) ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 72 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 80 )
            , ( "U-Air", 79 )
            ]
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
          , [ ( "Up-Smash", 55 )
            , ( "UT UA (0 SDI)", 108 )
            , ( "UT UA (1.5 SDI)", 82 )
            , ( "UT UA (TAS)", 83 )
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
          , [ ( "Up-Smash", 82 )
            , ( "UT UA (0 SDI)", 101 )
            , ( "UT UA (1.5 SDI)", 76 )
            , ( "UT UA (TAS)", 76 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 96 )
            , ( "UT UA (0 SDI)", 101 )
            , ( "UT UA (1.5 SDI)", 76 )
            , ( "UT UA (TAS)", 76 )
            ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 91 ) ]
          )
        , ( Falco
          , [ ( "Up-Smash", 98 )
            , ( "UT UA (0 SDI)", 101 )
            , ( "UT UA (1.5 SDI)", 76 )
            , ( "UT UA (TAS)", 76 )
            ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 96 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 76 )
            , ( "UT UA (0 SDI)", 101 )
            , ( "UT UA (1.5 SDI)", 76 )
            , ( "UT UA (TAS)", 76 )
            ]
          )
        , ( Marth
          , [ ( "Up-Smash", 73 )
            , ( "UT UA (0 SDI)", 101 )
            , ( "UT UA (1.5 SDI)", 76 )
            , ( "UT UA (TAS)", 76 )
            ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 68 ) ]
          )
        , ( Peach
          , [ ( "Up-Smash", 74 )
            , ( "U-Air", 75 )
            ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 57 )
            , ( "UT UA (0 SDI)", 101 )
            , ( "UT UA (1.5 SDI)", 76 )
            , ( "UT UA (TAS)", 76 )
            , ( "Up-tilt", 88 )
            , ( "D-tilt", 105 )
            , ( "B-Air", 110 )
            , ( "FC US", 33 )
            ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 67 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 73 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 74 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 81 ) ]
          )
        , ( Luigi
          , [ ( "Up-Smash", 71 ) ]
          )
        , ( Ganondorf
          , [ ( "Up-Smash", 84 ) ]
          )
        , ( Mario
          , [ ( "Up-Smash", 74 ) ]
          )
        , ( YoungLink
          , [ ( "Up-Smash", 73 ) ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 91 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 83 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 56 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 77 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 64 ) ]
          )
        , ( Zelda
          , [ ( "Up-Smash", 65 ) ]
          )
        , ( Ness
          , [ ( "Up-Smash", 73 ) ]
          )
        , ( Pichu
          , [ ( "Up-Smash", 56 ) ]
          )
        ]
        |> addPlatformKillPcts SidePlatform
            [ ( Fox
              , [ ( "UT UA (0 SDI)", 93 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            , ( CaptainFalcon
              , [ ( "UT UA (0 SDI)", 93 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            , ( Falco
              , [ ( "UT UA (0 SDI)", 93 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            , ( Sheik
              , [ ( "UT UA (0 SDI)", 93 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            , ( Marth
              , [ ( "UT UA (0 SDI)", 93 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            , ( JigglyPuff
              , [ ( "UT UA (0 SDI)", 93 )
                , ( "UT UA (1.5 SDI)", 66 )
                , ( "UT UA (TAS)", 68 )
                ]
              )
            ]
        |> addPlatformKillPcts TopPlatform
            [ ( Fox
              , [ ( "UT UA (0 SDI)", 87 )
                , ( "UT UA (1.5 SDI)", 57 )
                , ( "UT UA (TAS)", 61 )
                ]
              )
            , ( CaptainFalcon
              , [ ( "UT UA (0 SDI)", 87 )
                , ( "UT UA (1.5 SDI)", 57 )
                , ( "UT UA (TAS)", 61 )
                ]
              )
            , ( Falco
              , [ ( "UT UA (0 SDI)", 87 )
                , ( "UT UA (1.5 SDI)", 57 )
                , ( "UT UA (TAS)", 61 )
                ]
              )
            , ( Sheik
              , [ ( "UT UA (0 SDI)", 87 )
                , ( "UT UA (1.5 SDI)", 57 )
                , ( "UT UA (TAS)", 61 )
                ]
              )
            , ( Marth
              , [ ( "UT UA (0 SDI)", 87 )
                , ( "UT UA (1.5 SDI)", 57 )
                , ( "UT UA (TAS)", 61 )
                ]
              )
            , ( JigglyPuff
              , [ ( "UT UA (0 SDI)", 87 )
                , ( "UT UA (1.5 SDI)", 57 )
                , ( "UT UA (TAS)", 61 )
                ]
              )
            ]


fountainOfDreamsPcts : StageInfo
fountainOfDreamsPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 90 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 89 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 106 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 89 )
            ]
          )
        , ( Falco
          , [ ( "Up-Smash", 96 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 89 )
            ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 96 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 85 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 89 )
            ]
          )
        , ( Marth
          , [ ( "Up-Smash", 82 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 89 )
            ]
          )
        , ( Peach
          , [ ( "Up-Smash", 83 )
            , ( "U-Air", 85 )
            ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 58 )
            , ( "UT UA (0 SDI)", 112 )
            , ( "UT UA (1.5 SDI)", 87 )
            , ( "UT UA (TAS)", 89 )
            , ( "Up-tilt", 96 )
            , ( "D-tilt", 114 )
            , ( "B-Air", 119 )
            , ( "FC US", 38 )
            ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 79 ) ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 76 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 83 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 90 ) ]
          )
        , ( Luigi
          , [ ( "Up-Smash", 80 ) ]
          )
        , ( Ganondorf
          , [ ( "Up-Smash", 93 ) ]
          )
        , ( Mario
          , [ ( "Up-Smash", 83 ) ]
          )
        , ( YoungLink
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 101 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 92 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 63 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 86 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 72 ) ]
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
        |> addPlatformKillPcts TopPlatform
            [ ( Fox
              , [ ( "UT UA (0 SDI)", 99 )
                , ( "UT UA (1.5 SDI)", 72 )
                , ( "UT UA (TAS)", 74 )
                ]
              )
            , ( CaptainFalcon
              , [ ( "UT UA (0 SDI)", 99 )
                , ( "UT UA (1.5 SDI)", 72 )
                , ( "UT UA (TAS)", 74 )
                ]
              )
            , ( Falco
              , [ ( "UT UA (0 SDI)", 99 )
                , ( "UT UA (1.5 SDI)", 72 )
                , ( "UT UA (TAS)", 74 )
                ]
              )
            , ( Sheik
              , [ ( "UT UA (0 SDI)", 99 )
                , ( "UT UA (1.5 SDI)", 72 )
                , ( "UT UA (TAS)", 74 )
                ]
              )
            , ( Marth
              , [ ( "UT UA (0 SDI)", 99 )
                , ( "UT UA (1.5 SDI)", 72 )
                , ( "UT UA (TAS)", 74 )
                ]
              )
            , ( JigglyPuff
              , [ ( "UT UA (0 SDI)", 99 )
                , ( "UT UA (1.5 SDI)", 72 )
                , ( "UT UA (TAS)", 74 )
                ]
              )
            ]


dreamlandPcts : StageInfo
dreamlandPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 100 )
            , ( "UT UA (0 SDI)", 132 )
            , ( "UT UA (1.5 SDI)", 102 )
            , ( "UT UA (TAS)", 102 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 118 )
            , ( "UT UA (0 SDI)", 132 )
            , ( "UT UA (1.5 SDI)", 102 )
            , ( "UT UA (TAS)", 102 )
            ]
          )
        , ( Falco
          , [ ( "Up-Smash", 106 )
            , ( "UT UA (0 SDI)", 132 )
            , ( "UT UA (1.5 SDI)", 102 )
            , ( "UT UA (TAS)", 102 )
            ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 108 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 95 )
            , ( "UT UA (0 SDI)", 132 )
            , ( "UT UA (1.5 SDI)", 102 )
            , ( "UT UA (TAS)", 102 )
            ]
          )
        , ( Marth
          , [ ( "Up-Smash", 93 )
            , ( "UT UA (0 SDI)", 132 )
            , ( "UT UA (1.5 SDI)", 102 )
            , ( "UT UA (TAS)", 102 )
            ]
          )
        , ( Peach
          , [ ( "Up-Smash", 94 )
            , ( "U-Air", 101 )
            ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 66 )
            , ( "UT UA (0 SDI)", 132 )
            , ( "UT UA (1.5 SDI)", 102 )
            , ( "UT UA (TAS)", 102 )
            , ( "Up-tilt", 107 )
            , ( "D-tilt", 129 )
            , ( "B-Air", 132 )
            , ( "FC US", 45 )
            ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 86 ) ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 86 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 94 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 94 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 102 ) ]
          )
        , ( Luigi
          , [ ( "Up-Smash", 91 ) ]
          )
        , ( Ganondorf
          , [ ( "Up-Smash", 105 ) ]
          )
        , ( Mario
          , [ ( "Up-Smash", 94 ) ]
          )
        , ( YoungLink
          , [ ( "Up-Smash", 92 ) ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 113 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 103 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 72 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 96 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 82 ) ]
          )
        , ( Zelda
          , [ ( "Up-Smash", 84 ) ]
          )
        , ( Ness
          , [ ( "Up-Smash", 92 ) ]
          )
        ]
        |> addPlatformKillPcts SidePlatform
            [ ( Fox
              , [ ( "UT UA (0 SDI)", 126 )
                , ( "UT UA (1.5 SDI)", 93 )
                , ( "UT UA (TAS)", 94 )
                ]
              )
            , ( CaptainFalcon
              , [ ( "UT UA (0 SDI)", 126 )
                , ( "UT UA (1.5 SDI)", 93 )
                , ( "UT UA (TAS)", 94 )
                ]
              )
            , ( Falco
              , [ ( "UT UA (0 SDI)", 126 )
                , ( "UT UA (1.5 SDI)", 93 )
                , ( "UT UA (TAS)", 94 )
                ]
              )
            , ( Sheik
              , [ ( "UT UA (0 SDI)", 126 )
                , ( "UT UA (1.5 SDI)", 93 )
                , ( "UT UA (TAS)", 94 )
                ]
              )
            , ( Marth
              , [ ( "UT UA (0 SDI)", 126 )
                , ( "UT UA (1.5 SDI)", 93 )
                , ( "UT UA (TAS)", 94 )
                ]
              )
            , ( JigglyPuff
              , [ ( "UT UA (0 SDI)", 126 )
                , ( "UT UA (1.5 SDI)", 93 )
                , ( "UT UA (TAS)", 94 )
                ]
              )
            ]
        |> addPlatformKillPcts TopPlatform
            [ ( Fox
              , [ ( "UT UA (0 SDI)", 117 )
                , ( "UT UA (1.5 SDI)", 86 )
                , ( "UT UA (TAS)", 87 )
                ]
              )
            , ( CaptainFalcon
              , [ ( "UT UA (0 SDI)", 117 )
                , ( "UT UA (1.5 SDI)", 86 )
                , ( "UT UA (TAS)", 87 )
                ]
              )
            , ( Falco
              , [ ( "UT UA (0 SDI)", 117 )
                , ( "UT UA (1.5 SDI)", 86 )
                , ( "UT UA (TAS)", 87 )
                ]
              )
            , ( Sheik
              , [ ( "UT UA (0 SDI)", 117 )
                , ( "UT UA (1.5 SDI)", 86 )
                , ( "UT UA (TAS)", 87 )
                ]
              )
            , ( Marth
              , [ ( "UT UA (0 SDI)", 117 )
                , ( "UT UA (1.5 SDI)", 86 )
                , ( "UT UA (TAS)", 87 )
                ]
              )
            , ( JigglyPuff
              , [ ( "UT UA (0 SDI)", 117 )
                , ( "UT UA (1.5 SDI)", 86 )
                , ( "UT UA (TAS)", 87 )
                ]
              )
            ]


pokemonStadiumPcts : StageInfo
pokemonStadiumPcts =
    makeStageInfo
        [ ( Fox
          , [ ( "Up-Smash", 85 )
            , ( "UT UA (0 SDI)", 105 )
            , ( "UT UA (1.5 SDI)", 80 )
            , ( "UT UA (TAS)", 81 )
            ]
          )
        , ( CaptainFalcon
          , [ ( "Up-Smash", 99 )
            , ( "UT UA (0 SDI)", 105 )
            , ( "UT UA (1.5 SDI)", 80 )
            , ( "UT UA (TAS)", 81 )
            ]
          )
        , ( Falco
          , [ ( "Up-Smash", 91 )
            , ( "UT UA (0 SDI)", 105 )
            , ( "UT UA (1.5 SDI)", 80 )
            , ( "UT UA (TAS)", 81 )
            ]
          )
        , ( Bowser
          , [ ( "Up-Smash", 90 ) ]
          )
        , ( Sheik
          , [ ( "Up-Smash", 79 )
            , ( "UT UA (0 SDI)", 105 )
            , ( "UT UA (1.5 SDI)", 80 )
            , ( "UT UA (TAS)", 81 )
            ]
          )
        , ( Marth
          , [ ( "Up-Smash", 77 )
            , ( "UT UA (0 SDI)", 105 )
            , ( "UT UA (1.5 SDI)", 80 )
            , ( "UT UA (TAS)", 81 )
            ]
          )
        , ( Peach
          , [ ( "Up-Smash", 78 )
            , ( "U-Air", 78 )
            ]
          )
        , ( JigglyPuff
          , [ ( "Up-Smash", 53 )
            , ( "UT UA (0 SDI)", 105 )
            , ( "UT UA (1.5 SDI)", 80 )
            , ( "UT UA (TAS)", 81 )
            , ( "Up-tilt", 90 )
            , ( "D-tilt", 109 )
            , ( "B-Air", 119 )
            , ( "FC US", 36 )
            ]
          )
        , ( IceClimbers
          , [ ( "Up-Smash", 70 ) ]
          )
        , ( Pikachu
          , [ ( "Up-Smash", 71 ) ]
          )
        , ( Samus
          , [ ( "Up-Smash", 76 ) ]
          )
        , ( DrMario
          , [ ( "Up-Smash", 77 ) ]
          )
        , ( Yoshi
          , [ ( "Up-Smash", 84 ) ]
          )
        , ( Luigi
          , [ ( "Up-Smash", 74 ) ]
          )
        , ( Ganondorf
          , [ ( "Up-Smash", 87 ) ]
          )
        , ( Mario
          , [ ( "Up-Smash", 77 ) ]
          )
        , ( YoungLink
          , [ ( "Up-Smash", 76 ) ]
          )
        , ( DonkeyKong
          , [ ( "Up-Smash", 95 ) ]
          )
        , ( Link
          , [ ( "Up-Smash", 86 ) ]
          )
        , ( MrGameAndWatch
          , [ ( "Up-Smash", 58 ) ]
          )
        , ( Roy
          , [ ( "Up-Smash", 80 ) ]
          )
        , ( Mewtwo
          , [ ( "Up-Smash", 67 ) ]
          )
        , ( Zelda
          , [ ( "Up-Smash", 68 ) ]
          )
        , ( Ness
          , [ ( "Up-Smash", 76 ) ]
          )
        ]
        |> addPlatformKillPcts SidePlatform
            [ ( Fox
              , [ ( "UT UA (0 SDI)", 96 )
                , ( "UT UA (1.5 SDI)", 73 )
                , ( "UT UA (TAS)", 71 )
                ]
              )
            , ( CaptainFalcon
              , [ ( "UT UA (0 SDI)", 96 )
                , ( "UT UA (1.5 SDI)", 73 )
                , ( "UT UA (TAS)", 71 )
                ]
              )
            , ( Falco
              , [ ( "UT UA (0 SDI)", 96 )
                , ( "UT UA (1.5 SDI)", 73 )
                , ( "UT UA (TAS)", 71 )
                ]
              )
            , ( Sheik
              , [ ( "UT UA (0 SDI)", 96 )
                , ( "UT UA (1.5 SDI)", 73 )
                , ( "UT UA (TAS)", 71 )
                ]
              )
            , ( Marth
              , [ ( "UT UA (0 SDI)", 96 )
                , ( "UT UA (1.5 SDI)", 73 )
                , ( "UT UA (TAS)", 71 )
                ]
              )
            , ( JigglyPuff
              , [ ( "UT UA (0 SDI)", 96 )
                , ( "UT UA (1.5 SDI)", 73 )
                , ( "UT UA (TAS)", 71 )
                ]
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


getStageCharacterKillPcts : Stage -> Platform -> Character -> Maybe KillPcts
getStageCharacterKillPcts stage platform character =
    getCharKillPcts character platform (getStageStageInfo stage)
