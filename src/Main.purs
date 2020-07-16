module Main where

import Prelude
import Control.Monad.State.Trans (StateT, class MonadState, runStateT, modify_, get)
import Data.Generic.Rep (class Generic)
{-- import Data.Generic.Rep.Show (genericShow) --}
import Data.Newtype (class Newtype)
import Data.Map (Map)
import Data.Map as Map
import Data.Tuple.Nested ((/\),  type (/\))
import Effect (Effect)
import Effect.Class (class MonadEffect, liftEffect)
import Effect.Console (log)

data AppState = AppState (Map String String)



-- TODO - Exception handling exceptT
newtype App a = App (StateT AppState Effect a)

derive instance genericApp :: Generic (App a) _

derive instance newtypeApp :: Newtype (App a) _

derive newtype instance functorApp :: Functor App

derive newtype instance applyApp :: Apply App

derive newtype instance applicativeApp :: Applicative App

derive newtype instance bindApp :: Bind App

derive newtype instance monadApp :: Monad App

derive newtype instance monadstateApp :: MonadState AppState App

derive newtype instance monadeffectApp :: MonadEffect App

runApp :: Effect Unit
runApp = do
  let (App st) = application
  _ <- runStateT st $ AppState Map.empty
  pure unit

main :: Effect Unit
main = do
  runApp

application :: App Unit
application = do
  liftEffect $ log "hello"
  (AppState state) <- get
  liftEffect $ log $ show state
  modify_ (\(AppState state) -> AppState $ Map.insert "hello" "how are you" state)
  (AppState state') <- get
  liftEffect $ log $ show state'


  -- state testing
  -- start






--- Today we're doing a new project

-- key value store!

{-- HTTP Server - Rest routes, CRUD --}

-- state mgmt
-- state persistence?
-- publish javascript interface
-- publish purescript library
-- Testing


-- parsing limited query




