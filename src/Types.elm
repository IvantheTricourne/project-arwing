module Types exposing (..)
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