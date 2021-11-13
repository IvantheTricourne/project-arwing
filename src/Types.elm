module Types exposing (..)
import Json.Decode as D
import Json.Encode as E
import Dict as Dict

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
    Battlefield -> "Battlefield"
    Dreamland -> "Dream Land N64"
    FinalDestination -> "Final Destination"
    FountainOfDreams -> "Fountain of Dreams"
    PokemonStadium -> "Pokémon Stadium"
    YoshisStory -> "Yoshi's Story"

stageEncoder : Stage -> E.Value
stageEncoder = E.string << stageToString

stageDecoder : D.Decoder Stage
stageDecoder =
  D.string 
    |> D.andThen (\str -> 
        case str of
          "Battlefield" -> D.succeed Battlefield
          "Dream Land N64" -> D.succeed Dreamland
          "Final Destination" -> D.succeed FinalDestination
          "Fountain of Dreams" -> D.succeed FountainOfDreams
          "Pokémon Stadium" -> D.succeed PokemonStadium
          "Yoshi's Story" -> D.succeed YoshisStory
          invalidStage -> D.fail ("Unknown stage: " ++ invalidStage)
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
    Bowser -> "Bowser"
    CaptainFalcon -> "Captain Falcon"
    DonkeyKong -> "Donkey Kong"
    DrMario -> "Dr. Mario"
    Falco -> "Falco"
    Fox -> "Fox"
    Ganondorf -> "Ganondorf"
    IceClimbers -> "Ice Climbers"
    JigglyPuff -> "Jigglypuff"
    Kirby -> "Kirby"
    Link -> "Link"
    Luigi -> "Luigi"
    Mario -> "Mario"
    Marth -> "Marth"
    Mewtwo -> "Mewtwo"
    MrGameAndWatch -> "Mr. Game & Watch"
    Ness -> "Ness"
    Peach -> "Peach"
    Pichu -> "Pichu"
    Pikachu -> "Pikachu"
    Roy -> "Roy"
    Samus -> "Samus"
    Sheik -> "Sheik"
    Yoshi -> "Yoshi"
    YoungLink -> "Young Link"
    Zelda -> "Zelda"

characterToInt : Character -> Int
characterToInt character =
  case character of
    Bowser -> 0
    CaptainFalcon -> 1
    DonkeyKong -> 2
    DrMario -> 3
    Falco -> 4
    Fox -> 5
    Ganondorf -> 6
    IceClimbers -> 7
    JigglyPuff -> 8
    Kirby -> 9
    Link -> 10
    Luigi -> 11
    Mario -> 12
    Marth -> 13
    Mewtwo -> 14
    MrGameAndWatch -> 15
    Ness -> 16
    Peach -> 17
    Pichu -> 18
    Pikachu -> 19
    Roy -> 20
    Samus -> 21
    Sheik -> 22
    Yoshi -> 23
    YoungLink -> 24
    Zelda -> 25


type alias KillPcts =
  Dict.Dict String Int
type StageInfo =
  StageInfo (Dict.Dict Int KillPcts)

makeStageInfo : List (Character, KillPcts) -> StageInfo
makeStageInfo charKillPcts =
  List.foldr addCharKillPcts (StageInfo Dict.empty) charKillPcts

getCharKillPcts : Character -> StageInfo -> Maybe KillPcts
getCharKillPcts character (StageInfo dict) =
  Dict.get (characterToInt character) dict

addCharKillPcts : (Character, KillPcts) -> StageInfo -> StageInfo
addCharKillPcts (character, killPcts) (StageInfo dict) =
  StageInfo (Dict.insert (characterToInt character) killPcts dict)
