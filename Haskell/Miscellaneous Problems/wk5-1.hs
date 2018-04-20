maybeApply :: (a -> b) -> Maybe a -> Maybe b

maybeApply func Nothing = Nothing
maybeApply func (Just x) = Just (func x)