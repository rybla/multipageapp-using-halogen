module App.Template.Page where

import Prelude

import App.Content.Common (website_name)
import App.Template.Common (ExistsComponent(..))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Halogen (defaultEval, liftEffect, mkComponent, mkEval)
import Halogen.Aff (awaitBody, runHalogenAff)
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.VDom.Driver (runUI)
import Type.Proxy (Proxy(..))
import Web.HTML as Web.HTML
import Web.HTML.HTMLDocument as Web.HTML.HTMLDocument
import Web.HTML.Window as Web.HTML.Window

newtype Spec = Spec
  { website_name :: String
  , body_component :: ExistsComponent
  }

data PageAction = InitializePageAction

main :: Spec -> Effect Unit
main
  ( Spec
      { website_name
      , body_component: ExistsComponent body_component
      }
  ) =
  runHalogenAff do
    runUI page_component unit =<< awaitBody

  where
  page_component = mkComponent { initialState, eval, render }
    where
    initialState _input = {}

    eval = mkEval defaultEval
      { initialize = Just InitializePageAction
      , handleAction = case _ of
          InitializePageAction -> do
            win <- Web.HTML.window # liftEffect
            doc <- Web.HTML.Window.document win # liftEffect
            doc # Web.HTML.HTMLDocument.setTitle website_name # liftEffect
            pure unit
      }

    render _state =
      HH.div
        [ HP.style "width: 100vw; min-height: 100vh; display: flex; flex-direction: column; align-items: center; content-align: center;" ]
        [ -- header
          HH.div
            [ HP.style header_style ]
            [ HH.div [] [ HH.text "Header" ]
            , HH.div [] [ HH.a [ HP.href "/" ] [ HH.text website_name ] ]
            ]
        , -- body
          HH.div
            [ HP.style "flex-grow: 1;" ]
            [ HH.slot_ _body unit body_component unit ]
        , -- footer
          HH.div
            [ HP.style header_style ]
            [ HH.div [] [ HH.text "Footer" ]
            , HH.div [] [ HH.a [ HP.href "/" ] [ HH.text website_name ] ]
            ]
        ]

header_style = "width: 100%; display: flex; flex-direction: column; align-items: center; content-align: center; gap: 1em; padding: 1em; background-color: coral;"

_body = Proxy :: Proxy "body"
