module TypesTest exposing (suite)

import Expect
import Json.Decode as D
import Set
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


suite : Test
suite =
    describe "Types"
        [ describe "stage encode/decode round-trip"
            (List.map
                (\stage ->
                    test (stageToString stage) <|
                        \_ ->
                            stageEncoder stage
                                |> D.decodeValue stageDecoder
                                |> Expect.equal (Ok stage)
                )
                allStagesList
            )
        , describe "character encode/decode round-trip"
            (List.map
                (\character ->
                    test (characterToString character) <|
                        \_ ->
                            characterEncoder character
                                |> D.decodeValue characterDecoder
                                |> Expect.equal (Ok character)
                )
                allCharactersList
            )
        , test "stageDecoder fails (not crashes) on an unrecognized string" <|
            \_ ->
                D.decodeString stageDecoder "\"NotARealStage\""
                    |> Expect.err
        , test "characterDecoder fails (not crashes) on an unrecognized string" <|
            \_ ->
                D.decodeString characterDecoder "\"NotARealCharacter\""
                    |> Expect.err
        , test "characterToInt is injective across all characters" <|
            \_ ->
                allCharactersList
                    |> List.map characterToInt
                    |> Set.fromList
                    |> Set.size
                    |> Expect.equal (List.length allCharactersList)
        ]
