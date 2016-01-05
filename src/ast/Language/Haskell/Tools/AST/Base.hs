-- | Simple AST elements of Haskell
module Language.Haskell.Tools.AST.Base where
  
import Language.Haskell.Tools.AST.Ann
  
-- | Possible qualified names. Contains also implicit names.
-- Linear implicit parameter: @%x@. Non-linear implicit parameter: @?x@.
data Name a = Name { qualifiers      :: AnnList SimpleName a
                   , unqualifiedName :: Ann SimpleName a 
                   } 
         
-- | Parts of a qualified name.         
data SimpleName a 
  = SimpleName { simplNameStr :: String } 
               
-- | Program elements formatted as string literals (import packages, pragma texts)
data StringNode a
  = StringNode { stringNodeStr :: String }
                   
-- | The @data@ or the @newtype@ keyword to define ADTs.
data DataOrNewtypeKeyword a
  = DataKeyword
  | NewtypeKeyword
    
-- | Keywords @do@ or @mdo@ to start a do-block
data DoKind a
  = DoKeyword
  | MDoKeyword
  
-- | The @type@ keyword used to qualify that the type and not the constructor of the same name is referred
data TypeKeyword a = TypeKeyword
  
-- | Recognised overlaps for overlap pragmas. Can be applied to class declarations and class instance declarations.    
data OverlapPragma a
  = EnableOverlap     -- ^ @OVERLAP@ pragma
  | DisableOverlap    -- ^ @NO_OVERLAP@ pragma
  | Overlappable      -- ^ @OVERLAPPABLE@ pragma
  | Overlapping       -- ^ @OVERLAPPING@ pragma
  | Overlaps          -- ^ @OVERLAPS@ pragma
  | IncoherentOverlap -- ^ @INCOHERENT@ pragma
  
-- | Call conventions of foreign functions
data CallConv a
  = StdCall
  | CCall
  | CPlusPlus
  | DotNet
  | Jvm
  | Js
  | JavaScript
  | CApi
  
data ArrowAppl a
  = LeftAppl
  | RightAppl
  | LeftHighApp
  | RightHighApp
  
data Safety a
  = Safe
  | ThreadSafe
  | Unsafe
  | Interruptible

-- | Associativity of an operator.
data Assoc a
  = AssocNone  -- ^ non-associative operator (declared with @infix@)
  | AssocLeft  -- ^ left-associative operator (declared with @infixl@)
  | AssocRight -- ^ right-associative operator (declared with @infixr@)
  
-- | Numeric precedence of an operator
data Precedence a
  = Precedence { precedenceValue :: Int } 
     
-- | Controls the activation of a rewrite rule
data PhaseControl a
  = PhaseControl { phaseInvert :: AnnMaybe PhaseInvert a
                 , phaseNumber :: Ann PhaseNumber a
                 } 

data PhaseNumber a = PhaseNumber { phaseNum :: Integer }

-- | A tilde that marks the inversion of the phase number
data PhaseInvert a = PhaseInvert