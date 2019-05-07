{-# LANGUAGE RecordWildCards #-}

module Reader where

import Control.Monad.Reader
import Control.Monad.Trans.Reader (ReaderT)
import Control.Monad.IO.Class (liftIO)

data Config = Config { flag :: Bool, field :: String }

type ConfigM = ReaderT Config IO ()

readerMain :: IO ()
readerMain = runReaderT work $ Config True "Field22"

work :: ConfigM
work = f1

f1 :: ConfigM
f1 = f11

f11 :: ConfigM
f11 = do
  Config { .. } <- ask
  liftIO $ do
    print flag
    print field
  pure ()
