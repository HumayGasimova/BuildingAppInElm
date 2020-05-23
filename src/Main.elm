module Main exposing (..)

import Browser exposing (Document, UrlRequest)
import Browser.Navigation exposing (Key)
import Html exposing (Html)
import Url exposing (Url)

-- MODEL

type alias Flags = 
    {}

type Token = Token String

type alias Model = 
    { token: Maybe Token
    , navigationKey: Key }

type Msg 
    = NoOp

init : Flags -> Url -> Key -> (Model, Cmd Msg)
init flags url1 key = 
    let 
        --mock the url
        url = 
            { fragment = Nothing
            , host = "localhost"
            , path = "/signin/527hfr8ufvsd723ruijufr9`"
            , port_ = Just 3000
            , protocol = "Http1"
            , query = Nothing 
            }

        token = 
            url.path
            |> String.split "/"
            |> List.reverse
            |> List.head
            |> Maybe.map Token


        -- parts =  
        --     Debug.log "parts" ( String.split "/" url.path )

        -- token = Maybe.map Token (List.reverse parts |> List.head)


        -- token =
        --     case List.reverse parts |> List.head of
        --         Nothing -> 
        --             Nothing
        --         Just tok -> 
        --             Just (Token tok)


        newModel = 
            {token = token
            ,navigationKey = key
            }

        _=Debug.log "newModel" newModel
    in
    ( newModel , Cmd.none )

-- VIEW

view : Model -> Document Msg
view model = 
    { title = "Distinctly Average"
    , body = 
        [ Html.p [] [Html.text "hello world"]
        ]
    }

-- UPDATE

onUrlRequest : UrlRequest -> Msg
onUrlRequest urlRequest = 
    NoOp

onUrlChange : Url -> Msg
onUrlChange url = 
    NoOp

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of 
        NoOp -> 
            ( model, Cmd.none )


-- MAIN

main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = onUrlRequest
        , onUrlChange = onUrlChange
        }      

