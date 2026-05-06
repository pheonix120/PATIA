(define (problem sokoban1)
  (:domain sokoban)
  
  (:objects
    
    pos1-1 pos1-2 pos1-3 pos1-4 pos1-5
    pos2-1 pos2-2 pos2-3 pos2-4 pos2-5
    pos3-1 pos3-2 pos3-3 pos3-4 pos3-5
    pos4-1 pos4-2 pos4-3 pos4-4 pos4-5
    pos5-1 pos5-2 pos5-3 pos5-4 pos5-5 - location
    
    box1 box2 - location  ; Boxes 
    
    up down left right - direction
  )
  
  (:init
    ; Player start position
    (at-player pos2-2)
    
    ; Boxes positions
    (at-box box1 pos3-3)
    (at-box box2 pos3-4)
    
    ; Goal locations
    (goal-location pos4-4)
    (goal-location pos4-5)
    
    ; Clear locations (all except player and boxes)
    (clear pos1-1) (clear pos1-2) (clear pos1-3) (clear pos1-4) (clear pos1-5)
    (clear pos2-1) (clear pos2-3) (clear pos2-4) (clear pos2-5)
    (clear pos3-1) (clear pos3-2) (clear pos3-5) (clear pos4-1) (clear pos4-2) (clear pos4-3) (clear pos4-4) (clear pos4-5)
    (clear pos5-1) (clear pos5-2) (clear pos5-3) (clear pos5-4) (clear pos5-5)    

    ; Set possible moves
    (adjacent pos1-1 pos1-2 right) (adjacent pos1-2 pos1-1 left)
    (adjacent pos1-2 pos1-3 right) (adjacent pos1-3 pos1-2 left)
    (adjacent pos1-3 pos1-4 right) (adjacent pos1-4 pos1-3 left)
    (adjacent pos1-4 pos1-5 right) (adjacent pos1-5 pos1-4 left)
    
    (adjacent pos2-1 pos2-2 right) (adjacent pos2-2 pos2-1 left)
    (adjacent pos2-2 pos2-3 right) (adjacent pos2-3 pos2-2 left)
    (adjacent pos2-3 pos2-4 right) (adjacent pos2-4 pos2-3 left)
    (adjacent pos2-4 pos2-5 right) (adjacent pos2-5 pos2-4 left)
    
    (adjacent pos3-1 pos3-2 right) (adjacent pos3-2 pos3-1 left)
    (adjacent pos3-2 pos3-3 right) (adjacent pos3-3 pos3-2 left)
    (adjacent pos3-3 pos3-4 right) (adjacent pos3-4 pos3-3 left)
    (adjacent pos3-4 pos3-5 right) (adjacent pos3-5 pos3-4 left)
    
    (adjacent pos4-1 pos4-2 right) (adjacent pos4-2 pos4-1 left)
    (adjacent pos4-2 pos4-3 right) (adjacent pos4-3 pos4-2 left)
    (adjacent pos4-3 pos4-4 right) (adjacent pos4-4 pos4-3 left)
    (adjacent pos4-4 pos4-5 right) (adjacent pos4-5 pos4-4 left)
    
    (adjacent pos5-1 pos5-2 right) (adjacent pos5-2 pos5-1 left)
    (adjacent pos5-2 pos5-3 right) (adjacent pos5-3 pos5-2 left)
    (adjacent pos5-3 pos5-4 right) (adjacent pos5-4 pos5-3 left)
    (adjacent pos5-4 pos5-5 right) (adjacent pos5-5 pos5-4 left)    
  
    (adjacent pos1-1 pos2-1 down) (adjacent pos2-1 pos1-1 up)
    (adjacent pos1-2 pos2-2 down) (adjacent pos2-2 pos1-2 up)
    (adjacent pos1-3 pos2-3 down) (adjacent pos2-3 pos1-3 up)
    (adjacent pos1-4 pos2-4 down) (adjacent pos2-4 pos1-4 up)
    (adjacent pos1-5 pos2-5 down) (adjacent pos2-5 pos1-5 up)
    
    (adjacent pos2-1 pos3-1 down) (adjacent pos3-1 pos2-1 up)
    (adjacent pos2-2 pos3-2 down) (adjacent pos3-2 pos2-2 up)
    (adjacent pos2-3 pos3-3 down) (adjacent pos3-3 pos2-3 up)
    (adjacent pos2-4 pos3-4 down) (adjacent pos3-4 pos2-4 up)
    (adjacent pos2-5 pos3-5 down) (adjacent pos3-5 pos2-5 up)
    
    (adjacent pos3-1 pos4-1 down) (adjacent pos4-1 pos3-1 up)
    (adjacent pos3-2 pos4-2 down) (adjacent pos4-2 pos3-2 up)
    (adjacent pos3-3 pos4-3 down) (adjacent pos4-3 pos3-3 up)
    (adjacent pos3-4 pos4-4 down) (adjacent pos4-4 pos3-4 up)
    (adjacent pos3-5 pos4-5 down) (adjacent pos4-5 pos3-5 up)
    
    (adjacent pos4-1 pos5-1 down) (adjacent pos5-1 pos4-1 up)
    (adjacent pos4-2 pos5-2 down) (adjacent pos5-2 pos4-2 up)
    (adjacent pos4-3 pos5-3 down) (adjacent pos5-3 pos4-3 up)
    (adjacent pos4-4 pos5-4 down) (adjacent pos5-4 pos4-4 up)
    (adjacent pos4-5 pos5-5 down) (adjacent pos5-5 pos4-5 up)
  )
  
  (:goal
    (and
      (box-at-goal box1)
      (box-at-goal box2)
    )
  )
)