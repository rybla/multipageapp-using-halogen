module App.Build.Main where

import Prelude

import Effect (Effect)
import Effect.Class.Console as Console

main :: Effect Unit
main = do
  Console.log "[build]"

