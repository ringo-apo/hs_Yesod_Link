{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
import Yesod
 
data HelloWorld = HelloWorld
 
mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
/page1 Page1R GET
|]
 
instance Yesod HelloWorld

getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet|
Hello world!<br>
<a href=@{Page1R}>Go to page1
|]

getPage1R :: Handler Html
getPage1R = defaultLayout [whamlet|
これはpage1です。<br>
<a href=@{HomeR}>Go to home
|]

main :: IO ()
main = warp 3000 HelloWorld