module Viewer exposing (Viewer, credentials, decoder)

{-| The logged-in user currently viewing this page. It stores enough data to
be able to render the menu bar (username and avatar), along with Cred so it's
impossible to have a Viewer if you aren't logged in.
-}

import Api exposing (Cred)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (custom, hardcoded)
import Username exposing (Username)



-- TYPES


type Viewer
    = Viewer Cred


decoder : Decoder (Cred -> Viewer)
decoder =
    Decode.succeed Viewer


store : Viewer -> Cmd msg
store (Viewer credVal) =
    Cmd.none


credentials : Viewer -> Cred
credentials (Viewer c) =
    c
