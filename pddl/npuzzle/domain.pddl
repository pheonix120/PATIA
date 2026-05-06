(define (domain npuzzle)
  (:requirements :strips :typing)
  
  (:types 
    tile position
  )
  
  (:predicates
    (at ?t - tile ?p - position)     ; tile t is at position p
    (empty ?p - position)             ; position p is empty
    (adjacent ?p1 - position ?p2 - position)  ; positions p1 and p2 are adjacent
  )
  
  (:action move
    :parameters (?t - tile ?from - position ?to - position)
    :precondition (and 
      (at ?t ?from)           ; tile is at the source position
      (empty ?to)             ; destination position is empty
      (adjacent ?from ?to)    ; positions are adjacent
    )
    :effect (and
      (at ?t ?to)             ; tile is now at destination
      (empty ?from)           ; source position is now empty
      (not (at ?t ?from))     ; tile is no longer at source
      (not (empty ?to))       ; destination is no longer empty
    )
  )
)