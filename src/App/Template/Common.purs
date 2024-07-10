module App.Template.Common where

import Effect.Aff (Aff)
import Halogen (Component)

newtype ExistsComponent = ExistsComponent (forall query input output. Component query input output Aff)

