module MainTest exposing (suite)

import Expect
import Json.Decode as D
import Main exposing (Model, Msg(..), allStages, decoder, encode, stageSwitcherOptions, update)
import Test exposing (..)
import Types exposing (Character(..), Stage(..))


emptyModel : Model
emptyModel =
    { currentStage = Nothing
    , currentCharacter = Nothing
    , stageMenuOpen = False
    }


suite : Test
suite =
    describe "Main"
        [ describe "update"
            [ test "SelectStage sets currentStage and closes the menu" <|
                \_ ->
                    let
                        model =
                            { emptyModel | stageMenuOpen = True }

                        ( newModel, _ ) =
                            update (SelectStage Battlefield) model
                    in
                    Expect.equal newModel
                        { model
                            | currentStage = Just Battlefield
                            , stageMenuOpen = False
                        }
            , test "SelectChar sets currentCharacter" <|
                \_ ->
                    let
                        ( newModel, _ ) =
                            update (SelectChar Fox) emptyModel
                    in
                    Expect.equal newModel.currentCharacter (Just Fox)
            , test "ToggleStageMenu flips the bool from False to True" <|
                \_ ->
                    let
                        ( newModel, _ ) =
                            update ToggleStageMenu emptyModel
                    in
                    Expect.equal newModel.stageMenuOpen True
            , test "ToggleStageMenu flips the bool from True to False" <|
                \_ ->
                    let
                        model =
                            { emptyModel | stageMenuOpen = True }

                        ( newModel, _ ) =
                            update ToggleStageMenu model
                    in
                    Expect.equal newModel.stageMenuOpen False
            , test "Back with stage and character set clears only the character" <|
                \_ ->
                    let
                        model =
                            { currentStage = Just Battlefield
                            , currentCharacter = Just Fox
                            , stageMenuOpen = True
                            }

                        ( newModel, _ ) =
                            update Back model
                    in
                    Expect.equal newModel
                        { currentStage = Just Battlefield
                        , currentCharacter = Nothing
                        , stageMenuOpen = False
                        }
            , test "Back with only stage set clears the stage" <|
                \_ ->
                    let
                        model =
                            { currentStage = Just Battlefield
                            , currentCharacter = Nothing
                            , stageMenuOpen = True
                            }

                        ( newModel, _ ) =
                            update Back model
                    in
                    Expect.equal newModel
                        { currentStage = Nothing
                        , currentCharacter = Nothing
                        , stageMenuOpen = False
                        }
            , test "Reset clears both selections and closes the menu" <|
                \_ ->
                    let
                        model =
                            { currentStage = Just Battlefield
                            , currentCharacter = Just Fox
                            , stageMenuOpen = True
                            }

                        ( newModel, _ ) =
                            update Reset model
                    in
                    Expect.equal newModel emptyModel
            , test "NoOp is a true no-op" <|
                \_ ->
                    let
                        model =
                            { currentStage = Just Battlefield
                            , currentCharacter = Just Fox
                            , stageMenuOpen = True
                            }

                        ( newModel, _ ) =
                            update NoOp model
                    in
                    Expect.equal newModel model
            ]
        , describe "encode/decoder round-trip"
            [ test "both Nothing" <|
                \_ ->
                    encode emptyModel
                        |> D.decodeValue decoder
                        |> Expect.equal (Ok emptyModel)
            , test "both Just" <|
                \_ ->
                    let
                        model =
                            { currentStage = Just Battlefield
                            , currentCharacter = Just Fox
                            , stageMenuOpen = True
                            }
                    in
                    encode model
                        |> D.decodeValue decoder
                        |> Expect.equal
                            (Ok
                                { currentStage = Just Battlefield
                                , currentCharacter = Just Fox
                                , stageMenuOpen = False
                                }
                            )
            , test "mixed - stage set, character not" <|
                \_ ->
                    let
                        model =
                            { currentStage = Just Dreamland
                            , currentCharacter = Nothing
                            , stageMenuOpen = True
                            }
                    in
                    encode model
                        |> D.decodeValue decoder
                        |> Expect.equal
                            (Ok
                                { currentStage = Just Dreamland
                                , currentCharacter = Nothing
                                , stageMenuOpen = False
                                }
                            )
            ]
        , describe "stageSwitcherOptions"
            (List.map
                (\stage ->
                    describe (Debug.toString stage)
                        [ test "has exactly 5 options" <|
                            \_ ->
                                stageSwitcherOptions stage
                                    |> List.length
                                    |> Expect.equal 5
                        , test "does not contain the selected stage" <|
                            \_ ->
                                stageSwitcherOptions stage
                                    |> List.member stage
                                    |> Expect.equal False
                        ]
                )
                allStages
            )
        ]
