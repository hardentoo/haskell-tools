module Refactor.RenameDefinition.MergeFields_RenameY where

data A = B { x :: Double } | C { y :: Double }

f a = case a of B {} -> x a
                C {} -> y a
