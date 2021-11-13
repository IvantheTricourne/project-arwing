module Types exposing (..)

import Dict as Dict
import Json.Decode as D
import Json.Encode as E


type Stage
    = Battlefield
    | Dreamland
    | FinalDestination
    | FountainOfDreams
    | PokemonStadium
    | YoshisStory


stageToString : Stage -> String
stageToString stage =
    case stage of
        Battlefield ->
            "Battlefield"

        Dreamland ->
            "Dream Land N64"

        FinalDestination ->
            "Final Destination"

        FountainOfDreams ->
            "Fountain of Dreams"

        PokemonStadium ->
            "Pokémon Stadium"

        YoshisStory ->
            "Yoshi's Story"


stageEncoder : Stage -> E.Value
stageEncoder =
    E.string << stageToString


stageDecoder : D.Decoder Stage
stageDecoder =
    D.string
        |> D.andThen
            (\str ->
                case str of
                    "Battlefield" ->
                        D.succeed Battlefield

                    "Dream Land N64" ->
                        D.succeed Dreamland

                    "Final Destination" ->
                        D.succeed FinalDestination

                    "Fountain of Dreams" ->
                        D.succeed FountainOfDreams

                    "Pokémon Stadium" ->
                        D.succeed PokemonStadium

                    "Yoshi's Story" ->
                        D.succeed YoshisStory

                    _ ->
                        D.fail ("Unknown stage: " ++ str)
            )


type Character
    = Bowser
    | CaptainFalcon
    | DonkeyKong
    | DrMario
    | Falco
    | Fox
    | Ganondorf
    | IceClimbers
    | JigglyPuff
    | Kirby
    | Link
    | Luigi
    | Mario
    | Marth
    | Mewtwo
    | MrGameAndWatch
    | Ness
    | Peach
    | Pichu
    | Pikachu
    | Roy
    | Samus
    | Sheik
    | Yoshi
    | YoungLink
    | Zelda


characterToString : Character -> String
characterToString character =
    case character of
        Bowser ->
            "Bowser"

        CaptainFalcon ->
            "Captain Falcon"

        DonkeyKong ->
            "Donkey Kong"

        DrMario ->
            "Dr. Mario"

        Falco ->
            "Falco"

        Fox ->
            "Fox"

        Ganondorf ->
            "Ganondorf"

        IceClimbers ->
            "Ice Climbers"

        JigglyPuff ->
            "Jigglypuff"

        Kirby ->
            "Kirby"

        Link ->
            "Link"

        Luigi ->
            "Luigi"

        Mario ->
            "Mario"

        Marth ->
            "Marth"

        Mewtwo ->
            "Mewtwo"

        MrGameAndWatch ->
            "Mr. Game & Watch"

        Ness ->
            "Ness"

        Peach ->
            "Peach"

        Pichu ->
            "Pichu"

        Pikachu ->
            "Pikachu"

        Roy ->
            "Roy"

        Samus ->
            "Samus"

        Sheik ->
            "Sheik"

        Yoshi ->
            "Yoshi"

        YoungLink ->
            "Young Link"

        Zelda ->
            "Zelda"


characterEncoder : Character -> E.Value
characterEncoder =
    E.string << characterToString


characterDecoder : D.Decoder Character
characterDecoder =
    D.string
        |> D.andThen
            (\str ->
                case str of
                    "Bowser" ->
                        D.succeed Bowser

                    "Captain Falcon" ->
                        D.succeed CaptainFalcon

                    "Donkey Kong" ->
                        D.succeed DonkeyKong

                    "Dr. Mario" ->
                        D.succeed DrMario

                    "Falco" ->
                        D.succeed Falco

                    "Fox" ->
                        D.succeed Fox

                    "Ganondorf" ->
                        D.succeed Ganondorf

                    "Ice Climbers" ->
                        D.succeed IceClimbers

                    "Jigglypuff" ->
                        D.succeed JigglyPuff

                    "Kirby" ->
                        D.succeed Kirby

                    "Link" ->
                        D.succeed Link

                    "Luigi" ->
                        D.succeed Luigi

                    "Mario" ->
                        D.succeed Mario

                    "Marth" ->
                        D.succeed Marth

                    "Mewtwo" ->
                        D.succeed Mewtwo

                    "Mr. Game & Watch" ->
                        D.succeed MrGameAndWatch

                    "Ness" ->
                        D.succeed Ness

                    "Peach" ->
                        D.succeed Peach

                    "Pichu" ->
                        D.succeed Pichu

                    "Pikachu" ->
                        D.succeed Pikachu

                    "Roy" ->
                        D.succeed Roy

                    "Samus" ->
                        D.succeed Samus

                    "Sheik" ->
                        D.succeed Sheik

                    "Yoshi" ->
                        D.succeed Yoshi

                    "Young Link" ->
                        D.succeed YoungLink

                    "Zelda" ->
                        D.succeed Zelda

                    _ ->
                        D.fail ("Unknown character: " ++ str)
            )


characterToInt : Character -> Int
characterToInt character =
    case character of
        Bowser ->
            0

        CaptainFalcon ->
            1

        DonkeyKong ->
            2

        DrMario ->
            3

        Falco ->
            4

        Fox ->
            5

        Ganondorf ->
            6

        IceClimbers ->
            7

        JigglyPuff ->
            8

        Kirby ->
            9

        Link ->
            10

        Luigi ->
            11

        Mario ->
            12

        Marth ->
            13

        Mewtwo ->
            14

        MrGameAndWatch ->
            15

        Ness ->
            16

        Peach ->
            17

        Pichu ->
            18

        Pikachu ->
            19

        Roy ->
            20

        Samus ->
            21

        Sheik ->
            22

        Yoshi ->
            23

        YoungLink ->
            24

        Zelda ->
            25


type alias KillPcts =
    Dict.Dict String Int


type StageInfo
    = StageInfo (Dict.Dict Int KillPcts)


makeStageInfo : List ( Character, List ( String, Int ) ) -> StageInfo
makeStageInfo charKillPcts =
    List.foldr addCharKillPcts (StageInfo Dict.empty) charKillPcts


getCharKillPcts : Character -> StageInfo -> Maybe KillPcts
getCharKillPcts character (StageInfo dict) =
    Dict.get (characterToInt character) dict


addCharKillPcts : ( Character, List ( String, Int ) ) -> StageInfo -> StageInfo
addCharKillPcts ( character, killPcts ) (StageInfo dict) =
    StageInfo (Dict.insert (characterToInt character) (Dict.fromList killPcts) dict)
