-- (c) Kove W. Ochre-Salter 2018.
module DataSimpleNum
  where {
    import Data.Char;

    data SimpleNum = One | Two | Many
            deriving (Show, Read, Eq, Ord, Enum);

    -- The Typeclass.
    class (Eq a, Ord a) => ConvertSimpleNum a
      where {
        convert :: a -> Maybe SimpleNum;
      };

    -- Int instance.
    instance ConvertSimpleNum Int
      where {
        convert x
          | one       = Just One
          | two       = Just Two
          | many      = Just Many
          | otherwise = Nothing
          where {
            one  = x == 1;
            two  = x == 2;
            many = x >  2;
          };
      };

    -- Char instance.
    instance ConvertSimpleNum Char
      where {
        -- NOTE: the starting point is ASCII 1 ('\01' as a String). 
        convert char = convert numchar
          where {
            numchar :: Int;
            numchar = ord char;
          };
      };

    -- List instance.
    instance (Eq a, Ord a) => ConvertSimpleNum [a]
      where {
        convert xs
          | one       = Just One
          | two       = Just Two
          | many      = Just Many
          | otherwise = Nothing
          where {
            lengthxs = length xs;
            one      = lengthxs == 1;
            two      = lengthxs == 2;
            many     = lengthxs >  2;
          };
      };
  }
