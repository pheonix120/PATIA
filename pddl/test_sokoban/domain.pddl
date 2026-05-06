(define (domain sokoban)
  (:requirements :strips :typing)
  
  (:types 
    location direction
  )
  
  (:predicates
    (at-player ?l - location)           ; player is at location l
    (at-box ?b ?l - location)           ; box b is at location l
    (clear ?l - location)               ; location l is not occupied by a box
    (adjacent ?l1 - location ?l2 - location ?d - direction)  ; l2 is adjacent to l1 in direction d
    (goal-location ?l - location)       ; l is a goal
    (box-at-goal ?b - location)         ; box b is at a goal location
  )
  
  (:action move
    :parameters (?from - location ?to - location ?d - direction)
    :precondition (and 
      (at-player ?from)                 ; player is at source location
      (adjacent ?from ?to ?d)           ; locations are adjacent
      (clear ?to)                        ; destination is clear
    )
    :effect (and
      (at-player ?to)                   ; player moves to destination
      (not (at-player ?from))           ; player no longer at source
    )
  )
  
  (:action push
    :parameters (?b - location ?pfrom - location ?boxfrom - location ?boxto - location ?d - direction)
    :precondition (and 
      (at-player ?pfrom)                ; player is at pfrom
      (at-box ?b ?boxfrom)              ; box b is at boxfrom
      (adjacent ?pfrom ?boxfrom ?d)     ; player is adjacent to box
      (adjacent ?boxfrom ?boxto ?d)     ; box destination is in same direction
      (clear ?boxto)                     ; box destination is clear
    )
    :effect (and
      (at-player ?boxfrom)              ; player moves to where box was
      (at-box ?b ?boxto)                ; box moves to new location
      (clear ?pfrom)                     ; player's old location is now clear
      (not (at-player ?pfrom))          ; player no longer at old location
      (not (at-box ?b ?boxfrom))        ; box no longer at old location
      (not (clear ?boxto))              ; box destination no longer clear
      
      
      (when (goal-location ?boxto)
        (box-at-goal ?b))
      (when (not (goal-location ?boxto))
        (not (box-at-goal ?b)))
    )
  )
)