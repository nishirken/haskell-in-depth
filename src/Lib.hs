module Lib
    ( someFunc
    ) where

import qualified Reader

someFunc :: IO ()
someFunc = Reader.readerMain
