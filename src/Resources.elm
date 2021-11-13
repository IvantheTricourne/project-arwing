module Resources exposing (..)

import Types exposing (..)


charIconPath : Character -> String
charIconPath character =
    "../rsrc/Characters/Stock Icons/" ++ characterToString character ++ "/Default.png"


stageImgPath : Stage -> String
stageImgPath stage =
    "../rsrc/Stages/Icons/" ++ stageToString stage ++ ".png"
