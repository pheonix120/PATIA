(define (problem hanoi-01)
(:domain hanoi)
(:objects emplacement1 emplacement2 emplacement3 disk1 disk2 disk3)
(:init  
    (small_on disk1 disk2) (small_on disk1 disk3) (small_on disk2 disk3)
    (small_on disk1 emplacement1) (small_on disk1 emplacement2) (small_on disk1 emplacement3)
    (small_on disk2 emplacement1) (small_on disk2 emplacement2) (small_on disk2 emplacement3)
    (small_on disk3 emplacement1) (small_on disk3 emplacement2) (small_on disk3 emplacement3)
    (on disk3 emplacement1) (on disk2 disk3 ) (on disk1 disk2 ) (clear disk1)         
    (clear emplacement2) (clear emplacement3) )
(:goal (and (on disk3 emplacement3 ) (on disk2 disk3) (on disk1 disk2) (clear disk1))))


