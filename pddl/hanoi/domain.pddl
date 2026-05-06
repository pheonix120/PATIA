(define (domain hanoi)
  (:requirements :strips) 
  (:predicates (clear ?x) (on ?x ?y) (small_on ?x ?y) )

  (:action pick-up
	:parameters (?disk ?src ?dest )
	:precondition (and (clear ?disk) 
		 					(clear ?dest )
							(on ?disk ?src)
							(small_on ?disk ?dest) )
	:effect (and (not (on ?disk ?src))
		   (on ?disk ?dest)
			(clear ?src)
			(not (clear ?dest))
		   )))

  
