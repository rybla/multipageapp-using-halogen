module App.Content.Root where

import App.Content.Common (website_name)
import App.Template.Common (ExistsComponent(..))
import App.Template.Page as Page
import Halogen (defaultEval, mkComponent, mkEval)
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

main = Page.main
  ( Page.Spec
      { website_name
      , body_component: ExistsComponent body_component
      }
  )

body_component = mkComponent { initialState, eval, render }
  where
  initialState _input = {}

  eval = mkEval defaultEval

  render _state =
    HH.div
      [ HP.style "display: flex; flex-direction: column; gap: 1em; padding: 1em;" ]
      [ HH.div [] [ HH.h1_ [ HH.text website_name ] ]
      , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      -- , HH.div [] [ HH.a [ HP.href "/MyPage.html" ] [ HH.text "MyPage" ] ]
      ]
