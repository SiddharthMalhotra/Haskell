import Data.Char
import Data.List

stringToLower :: String -> String
stringToLower str = map toLower str

stringletters :: String -> String
stringletters str = filter isAlpha str

stringLowerLetters :: String -> String
stringLowerLetters = stringToLower.stringletters

isPalindrome :: String -> Bool
isPalindrome str = s1 == reverse(s1)
  where s1 = stringLowerLetters str