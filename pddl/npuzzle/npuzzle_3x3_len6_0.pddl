;1 2 0
;3 4 5
;6 7 8 

(define (problem npuzzle6)
  (:domain npuzzle)
  
  (:objects
    tile1 tile2 tile3 tile4 tile5 tile6 tile7 tile8 - tile
    pos1-1 pos1-2 pos1-3
    pos2-1 pos2-2 pos2-3
    pos3-1 pos3-2 pos3-3 - position
  )
  
  (:init

    (at tile1 pos1-1)
    (at tile2 pos1-2)
    (empty pos1-3)
    (at tile3 pos2-1) 
    (at tile4 pos2-2)   
    (at tile5 pos2-3)
    (at tile6 pos3-1)
    (at tile7 pos3-2)
    (at tile8 pos3-3)    

    (adjacent pos1-1 pos1-2) (adjacent pos1-2 pos1-1)
    (adjacent pos1-2 pos1-3) (adjacent pos1-3 pos1-2)
    (adjacent pos1-1 pos2-1) (adjacent pos2-1 pos1-1)
    (adjacent pos1-2 pos2-2) (adjacent pos2-2 pos1-2)
    (adjacent pos1-3 pos2-3) (adjacent pos2-3 pos1-3)
    

    (adjacent pos2-1 pos2-2) (adjacent pos2-2 pos2-1)
    (adjacent pos2-2 pos2-3) (adjacent pos2-3 pos2-2)
    (adjacent pos2-1 pos3-1) (adjacent pos3-1 pos2-1)
    (adjacent pos2-2 pos3-2) (adjacent pos3-2 pos2-2)
    (adjacent pos2-3 pos3-3) (adjacent pos3-3 pos2-3)
    

    (adjacent pos3-1 pos3-2) (adjacent pos3-2 pos3-1)
    (adjacent pos3-2 pos3-3) (adjacent pos3-3 pos3-2)
  )
  
  (:goal
    (and      
      (at tile1 pos1-1)
      (at tile2 pos1-2)
      (at tile3 pos1-3)
      (at tile4 pos2-1)
      (at tile5 pos2-2)
      (at tile6 pos2-3)
      (at tile7 pos3-1)
      (at tile8 pos3-2)
      (empty pos3-3)
    )
  )
)