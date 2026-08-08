module PercentsTest exposing (suite)

import Dict
import Expect
import Percents exposing (getStageCharacterKillPcts)
import Test exposing (..)
import Types exposing (..)


allStagesList : List Stage
allStagesList =
    [ Battlefield
    , Dreamland
    , FinalDestination
    , FountainOfDreams
    , PokemonStadium
    , YoshisStory
    ]


allCharactersList : List Character
allCharactersList =
    [ Bowser
    , CaptainFalcon
    , DonkeyKong
    , DrMario
    , Falco
    , Fox
    , Ganondorf
    , IceClimbers
    , JigglyPuff
    , Kirby
    , Link
    , Luigi
    , Mario
    , Marth
    , Mewtwo
    , MrGameAndWatch
    , Ness
    , Peach
    , Pichu
    , Pikachu
    , Roy
    , Samus
    , Sheik
    , Yoshi
    , YoungLink
    , Zelda
    ]


allKillPcts : List KillPcts
allKillPcts =
    List.concatMap
        (\stage ->
            List.filterMap (getStageCharacterKillPcts stage) allCharactersList
        )
        allStagesList


suite : Test
suite =
    describe "Percents"
        [ test "Battlefield + Fox has data" <|
            \_ ->
                getStageCharacterKillPcts Battlefield Fox
                    |> Expect.notEqual Nothing
        , test "Dreamland + Kirby has no data" <|
            \_ ->
                getStageCharacterKillPcts Dreamland Kirby
                    |> Expect.equal Nothing
        , test "every kill percent value in the dataset is in a sane range (1-999)" <|
            \_ ->
                allKillPcts
                    |> List.concatMap Dict.values
                    |> List.all (\pct -> pct >= 1 && pct <= 999)
                    |> Expect.equal True
        , test "no present KillPcts dict is empty" <|
            \_ ->
                allKillPcts
                    |> List.all (\killPcts -> not (Dict.isEmpty killPcts))
                    |> Expect.equal True
        ]
