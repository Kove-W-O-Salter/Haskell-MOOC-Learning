@BeatrizFernandez.

foldl takes a Function, an
Accumulator (Base Value)
and a List. Then traverses
the List from left to right,
applying the Accumulator and
the current Element of the
List to the Function. Here
is a simple definition:

> foldl' :: (b -> a -> b) -> b -> [a] -> b
> foldl' _ acc []     = acc
> foldl' f acc (x:xs) = foldl' (f) newacc xs
>   where newacc = f acc x

Cons (:) is an operator that takes
a value (Left operand) and a List
(Right operand) and prepends the
value to the List. 

So if we did:

> foldl' (flip' (:)) [] "Hello"

we would get a result of "olleH".

NOTE: flip takes a binary function
and returns that function with it's
paramaters in the oposite order.
Here is a definition of it:

> flip' :: (a -> b -> c) -> (b -> a -> c)
> flip' f = (\x y -> f y x)
