module App.Static.GenerateHtmlFile where

import Prelude

import Control.Monad.Error.Class (throwError)
import Data.Array as Array
import Data.Maybe (Maybe(..), fromMaybe', maybe')
import Data.String as String
import Effect (Effect)
import Effect.Class.Console as Console
import Effect.Exception (Error, error)
import Node.Encoding as Encoding
import Node.FS.Sync as FS
import Node.Process as Process

main :: Effect Unit
main = do
  { page_js, target_dir } <- Process.argv >>= case _ of
    [ _, _, page_js, target_dir ] -> pure { page_js, target_dir }
    argv -> throwError (error ("invalid arguments: " <> show argv))
  page_js_basename <- page_js
    # String.stripSuffix (String.Pattern ".page.js")
    # maybe' (\_ -> throwError (error ("invalid page_js: " <> page_js))) pure
  let
    html_filename =
      target_dir <> "/" <>
        if page_js == "Root.page.js" then
          "index.html"
        else
          page_js_basename <> ".html"
  FS.writeTextFile Encoding.UTF8 html_filename
    ( """
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    html,
    body {
      margin: 0;
      padding: 0;
    }
  </style>
</head>

<body>
  <script src="./""" <> page_js <>
        """"></script>
</body>

</html>
""" # String.trim
    )
  Console.log ("generated " <> html_filename)
  pure unit

