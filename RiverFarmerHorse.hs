{-# LANGUAGE MonomorphismRestriction #-}

module Main (main) where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

main :: IO ()
main = mainWith riverFarmerHorse

riverFarmerHorse :: Diagram B
riverFarmerHorse =  hut1 <> hut2 <> mirror <> drink <> wrong <> optimal <> suboptimal <> river

river :: Diagram B
river = rect 5 1 # lw none  # fillTexture linear


linear = mkLinearGradient (mkStops [(blue, 0, 1), (white, 1, 1)])
                          (0 ^& 0.5) (0 ^& (-0.5))
                          GradPad

src, dst, aux, cut, mid :: P2 Double
src = p2 (-1, 1.5)
dst = p2 ( 1, 1)
aux = p2 (1, 0)
cut = p2 (1/3, 1/2)
mid = p2 (0, 0.5)

air, optimal, suboptimal :: Diagram B
air = src ~~ dst
optimal = (src ~~ cut # lw thl) <> (cut ~~ dst # lw thl) <> (cut ~~ aux # dashed # lw thl)
suboptimal = (src ~~ mid # lw ll # lc purple) <> (mid ~~ dst # lw ll # lc purple) <> (mid ~~ aux # dashed # lw ll # lc purple)

--thl, ll :: Double
thl = 2
ll = 0.5

ds :: Double
ds = 0.033 -- dot size

hut1, hut2, mirror, drink, wrong :: Diagram B
hut1 = position [(src, circle ds)] # fc red
hut2 = position [(dst, circle ds)] # fc red
mirror = position [(aux, circle ds)] # fc red
drink = position [(cut, circle ds)] # fc red
wrong = position [(mid, circle ds)] # fc red


dashed  = dashingN [0.03,0.03] 0
