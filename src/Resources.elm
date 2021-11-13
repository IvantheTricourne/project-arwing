module Resources exposing (..)

import Types exposing (Stage, stageToString)

charIconPath : String -> String
charIconPath characterName =
    "../rsrc/Characters/Stock Icons/" ++ characterName ++ "/Default.png"

stageImgPath : Stage -> String
stageImgPath stage =
    "../rsrc/Stages/Icons/" ++ stageToString stage ++ ".png"