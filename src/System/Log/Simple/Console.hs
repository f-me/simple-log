module System.Log.Simple.Console(
    console,
    consoleErr
    ) where

import Data.Text (Text)
import qualified Data.Text.IO as T
import System.Log.Simple.Base
import System.IO

console :: Consumer Text
console = Consumer withConsole where
    withConsole f = do
        hSetEncoding stdout utf8
        f T.putStrLn


-- | Console consumer which uses 'stderr' stream.
consoleErr :: Consumer Text
consoleErr = Consumer withConsole where
    withConsole f = do
        hSetEncoding stderr utf8
        f $ T.hPutStrLn stderr
