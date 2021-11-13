module Percents exposing (..)

import Dict exposing (..)
import Types exposing (..)

battlefieldPcts : StageInfo
battlefieldPcts = makeStageInfo 
  [ ( Fox
    , fromList [ ("Up-Smash", 89) ] 
    ) 
  ]

dreamlandPcts : StageInfo
dreamlandPcts = makeStageInfo
  [ ( Fox
    , fromList [ ("Up-Smash", 100) ] 
    ) 
  ]

finalDestinationPcts : StageInfo
finalDestinationPcts = makeStageInfo
  [ ( Fox
    , fromList [ ("Up-Smash", 86) ] 
    ) 
  ]

fountainOfDreamsPcts : StageInfo
fountainOfDreamsPcts = makeStageInfo
  [ ( Fox
    , fromList [ ("Up-Smash", 90) ] 
    ) 
  ]

pokemonStadiumPcts : StageInfo
pokemonStadiumPcts = makeStageInfo
  [ ( Fox
    , fromList [ ("Up-Smash", 85) ] 
    ) 
  ]

yoshisStoryPcts : StageInfo
yoshisStoryPcts = makeStageInfo
  [ ( Fox
    , fromList [ ("Up-Smash", 82) ] 
    ) 
  ]