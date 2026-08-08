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
            List.filterMap (getStageCharacterKillPcts stage Ground) allCharactersList
        )
        allStagesList


allPlatformKillPcts : List KillPcts
allPlatformKillPcts =
    List.concatMap
        (\stage ->
            List.concatMap
                (\platform ->
                    List.filterMap (getStageCharacterKillPcts stage platform) allCharactersList
                )
                allPlatforms
        )
        allStagesList


suite : Test
suite =
    describe "Percents"
        [ test "Battlefield + Ground + Fox has data" <|
            \_ ->
                getStageCharacterKillPcts Battlefield Ground Fox
                    |> Expect.notEqual Nothing
        , test "Dreamland + Ground + Kirby has no data" <|
            \_ ->
                getStageCharacterKillPcts Dreamland Ground Kirby
                    |> Expect.equal Nothing
        , test "Battlefield + Side Platform + Fox has data" <|
            \_ ->
                getStageCharacterKillPcts Battlefield SidePlatform Fox
                    |> Expect.notEqual Nothing
        , test "Final Destination + Side Platform + Fox has no data" <|
            \_ ->
                getStageCharacterKillPcts FinalDestination SidePlatform Fox
                    |> Expect.equal Nothing
        , test "Battlefield + Side Platform + Bowser has no data (not a top-6 character)" <|
            \_ ->
                getStageCharacterKillPcts Battlefield SidePlatform Bowser
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
        , test "every platform kill percent value in the dataset is in a sane range (1-999)" <|
            \_ ->
                allPlatformKillPcts
                    |> List.concatMap Dict.values
                    |> List.all (\pct -> pct >= 1 && pct <= 999)
                    |> Expect.equal True
        ]
