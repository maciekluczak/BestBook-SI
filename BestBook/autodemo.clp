
;;;======================================================
;;;   Automotive Expert System
;;;
;;;     This expert system diagnoses some simple
;;;     problems with a car.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;     For use with the Auto Demo Example
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

;;; POPULAR FICTION

(defrule determine-popular-fiction ""

   (logical (start))

   =>

   (assert (UI-state (display Popular_Question)
                     (relation-asserted popular-fiction)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-thrillers ""

   (logical (popular-fiction Yes))

   =>

   (assert (UI-state (display PopularThrillers_Question)
                     (relation-asserted thrillers)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-mystery ""

	(logical (thrillers No))
	
	=>
	
	(assert (UI-state (display PopularMystery_Question)
					  (relation-asserted mystery)
					  (response No)
					  (valid-answers No Yes))))

(defrule determine-family ""

	(logical (mystery No))
	
	=>
	
	(assert (UI-state (display PopularFamily_Question)
					  (relation-asserted family)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-fantasy-horror ""

	(logical (family No))
	
	=>
	
	(assert (UI-state (display PopularFantasy/Horror_Question)
					  (relation-asserted fantasy-horror)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-romance ""

	(logical (fantasy-horror No))
	
	=>
	
	(assert (UI-state (display PopularRomance_Question)
					  (relation-asserted romance)
					  (response No)
					  (valid-answers No Yes))))
					  
(define determine-time-travel ""

	(logical (romance No))
	
	=>
	
	(assert (UI-state (display PopularTimeTravel_Question)
					  (relation-asserted time-travel)
					  (response No)
					  (valid-answers No Yes))))
					  
;;; LITERARY FICTION

(defrule determine-literary-fiction ""

   (logical (popular-fiction No))

   =>

   (assert (UI-state (display Literary_Question)
                     (relation-asserted literary)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-dystopia ""

	(logical (literary Yes))
	
	=>
	
	(assert (UI-state (display LiteraryDystopia_Question)
					  (relation-asserted dystopia)
					  (response No)
					  (valid-answers No Yes))))

(defrule determine-fantasy ""

	(logical (dystopia No))
	
	=>
	
	(assert (UI-state (display LiteraryFantasy_Question)
					  (relation-asserted fantasy)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-identity ""

	(logical (fantasy No))
	
	=>
	
	(assert (UI-state (display LiteraryIdentity_Question)
					  (relation-asserted identity)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-magical-realism ""

	(logical (identity No))
	
	=>
	
	(assert (UI-state (display LiteraryMagicalRealism_Question)
					  (relation-asserted magical-realism)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-comic-books ""

	(logical (magical-realism No))
	
	=>
	
	(assert (UI-state (display LiteraryComicBooks_Question)
					  (relation-asserted comic-books)
					  (response No)
					  (valid-answers No Yes))))
					 
(defrule determine-crime ""

	(logical (comic-books No))
	
	=>
	
	(assert (UI-state (display LiteraryCrime_Question)
					  (relation-asserted crime)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-history ""

	(logical (crime No))
	
	=>
	
	(assert (UI-state (display LiteraryHistory_Question)
					  (relation-asserted history)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-lit-family ""

	(logical (history No))
	
	=>
	
	(assert (UI-state (display LiteraryFamily_Question)
					  (relation-asserted lit-family)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-lit-mystery ""

	(logical (lit-family No))
	
	=>
	
	(assert (UI-state (display LiteraryMystery_Question)
					  (relation-asserted lit-mystery)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-baseball ""

	(logical (lit-mystery No))
	
	=>
	
	(assert (UI-state (display LiteraryBaseball_Question)
					  (relation-asserted baseball)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-new-culture ""

	(logical (baseball No))
	
	=>
	
	(assert (UI-state (display LiteraryNewCulture_Question)
					  (relation-asserted new-culture)
					  (response No)
					  (valid-answers No Yes))))

;;; FICTION FOR KIDS					  

(defrule determine-fiction-for-kids	""

	(logical (literary No))
	
	=>
	
	(assert (UI-state (display KidsQuestion)
					  (relation-asserted kids)
					  (response No)
					  (valid-answers No Yes))))			  
				
(defrule determine-young-adults	""

	(logical (kids Yes))
	
	=>
	
	(assert (UI-state (display KidsYoungAdults_Question)
					  (relation-asserted young-adults)
					  (response No)
					  (valid-answers No Yes))))	
					  
(defrule determine-childrens ""

	(logical (young-adults No))
	
	=>
	
	(assert (UI-state (display KidsChildren_Question)
					  (relation-asserted children)
					  (response No)
					  (valid-answers No Yes))))	
					  
;;; NONFICTION

(defrule determine-nonfiction ""

	(logical (literary No))
	
	=>
	
	(assert (UI-state (display Nonfiction_Question)
					  (relation-asserted nonfiction)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-memoirs ""

	(logical (nonfiction Yes))
	
	=>
	
	(assert (UI-state (display NonfictionMemoirs_Question)
					  (relation-asserted memoirs)
					  (response No)
					  (valid-answers No Yes))))	
					  
(defrule determine-food ""

	(logical (memoirs No))
	
	=>
	
	(assert (UI-state (display NonfictionFood_Question)
					  (relation-asserted food)
					  (response No)
					  (valid-answers No Yes))))	
					  
(defrule determine-business ""

	(logical (food No))
	
	=>
	
	(assert (UI-state (display NonfictionBusiness_Question)
					  (relation-asserted business)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-biography ""

	(logical (business No))
	
	=>
	
	(assert (UI-state (display NonfictionBiography_Question)
					  (relation-asserted biography)
					  (response No)
					  (valid-answers No Yes))))									  				  					  				
					  									  				  					  				
(defrule determine-grammar ""

	(logical (biography No))
	
	=>
	
	(assert (UI-state (display NonfictionGrammar_Question)
					  (relation-asserted grammar)
					  (response No)
					  (valid-answers No Yes))))	
					  
(defrule determine-non-history ""

	(logical (grammar No))
	
	=>
	
	(assert (UI-state (display NonfictionHistory_Question)
					  (relation-asserted non-history)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-humor ""

	(logical (non-history No))
	
	=>
	
	(assert (UI-state (display NonfictionHumor_Question)
					  (relation-asserted humor)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-inspiration ""

	(logical (humor No))
	
	=>
	
	(assert (UI-state (display NonfictionInspiration_Qustion)
					  (relation-asserted inspiration)
					  (response No)
					  (valid-answers No Yes))))						  
					  						  
(defrule determine-government ""

	(logical (inspiration No))
	
	=>
	
	(assert (UI-state (display NonfictionGovernment_Question)
					  (relation-asserted government)
					  (response No)
					  (valid-answers No Yes))))	
					  
;;; SELF-HELP					  	
					  
(defrule determine-relationships ""

	(logical (nonfiction No))
	
	=>
	
	(assert (UI-state (display SelfHelpRelationships_Question)
					  (relation-asserted relationships)
					  (response No)
					  (valid-answers No Yes))))					  				  						  						  

(defrule determine-inspirational ""

	(logical (relationships No))
	
	=>
	
	(assert (UI-state (display SelfHelpInspirational_Question)
					  (relation-asserted inspirational)
					  (response No)
					  (valid-answers No Yes))))	

;;;****************
;;;* RECOMMENDATION RULES *
;;;****************

;;; POPULAR FICTION RESULTS

(defrule result-thrillers ""

	(logical (thrillers Yes))
	
	=>
	
	(assert (UI-state (display PopularThrillers_Result)
					  (state final))))
					  
(defrule result-mystery ""

	(logical (mystery Yes))
	
	=>
	
	(assert (UI-state (display PopularMystery_Result)
					  (state final))))
					  
(defrule result-family ""

	(logical (family Yes))
	
	=>
	
	(assert (UI-state (display PopularFamily_Result)
					  (state final))))
					  
(defrule result-fantasy-horror ""

	(logical (fantasy-horror Yes))
	
	=>
	
	(assert (UI-state (display PopularFantasy/Horror_Result)
					  (state final))))
	
(defrule result-romance ""

	(logical (romance Yes))
	
	=>
	
	(assert (UI-state (display PopularRomance_Result)
					  (state final))))
					  
(defrule result-time-travel ""

	(logical (time-travel Yes))
	
	=>
	
	(assert (UI-state (display PopularTimeTravel_Result)
					  (state final))))
					  
(defrule result-suspense ""

	(logical (time-travel No))
	
	=>
	
	(assert (UI-state (display PopularSuspense_Result)
					  (state final))))

;;; LITERARY FICTION RESULTS

(defrule result-dystopia ""

	(logical (dystopia Yes))
	
	=>
	
	(assert (UI-state (display LiteraryDystopia_Result)
					  (state final))))
					  
(defrule result-fantasy ""

	(logical (fantasy Yes))
	
	=>
	
	(assert (UI-state (display LiteraryFantasy_Result)
					  (state final))))

(defrule result-identity ""

	(logical (identity Yes))
	
	=>
	
	(assert (UI-state (display LiteraryIdentity_Result)
					  (state final))))

(defrule result-magical-realism ""

	(logical (magical-realism Yes))
	
	=>
	
	(assert (UI-state (display LiteraryMagicalRealism_Result)
					  (state final))))
					  
(defrule result-comic-books ""

	(logical (comic-books Yes))
	
	=>
	
	(assert (UI-state (display LiteraryComicBooks_Result)
					  (state final))))

(defrule result-crime ""

	(logical (crime Yes))
	
	=>
	
	(assert (UI-state (display LiteraryCrime_Result)
					  (state final))))
                    
(defrule result-history ""

	(logical (history Yes))
	
	=>
	
	(assert (UI-state (display LiteraryHistory_Result)
					  (state final))))
					  
(defrule result-lit-family ""

	(logical (lit-family Yes))
	
	=>
	
	(assert (UI-state (display LiteraryFamily_Result)
					  (state final))))
					  
(defrule result-lit-mystery ""

	(logical (lit-mystery Yes))
	
	=>
	
	(assert (UI-state (display LiteraryMystery_Result)
					  (state final))))
					  
(defrule result-baseball ""

	(logical (baseball Yes))
	
	=>
	
	(assert (UI-state (display LiteraryBaseball_Result)
					  (state final))))
					  
(defrule result-new-culture ""

	(logical (new-culture Yes))
	
	=>
	
	(assert (UI-state (display LiteraryNewCulture_Result)
					  (state final))))
					  
(defrule result-good-fantasy ""

	(logical (new-culture No))
	
	=>
	
	(assert (UI-state (display LiteraryFantasy2_Result)
					  (state final))))
					  
;;; FICTION FOR KIDS RESULTS

(defrule result-young-adults ""

	(logical (young-adults Yes))
	
	=>
	
	(assert (UI-state (display KidsYoungAdults_Result)
					  (state final))))	
					  
(defrule result-children ""

	(logical (children Yes))
	
	=>
	
	(assert (UI-state (display KidsChildren_Result)
					  (state final))))	
					  
(defrule result-teen ""

	(logical (children No))
	
	=>
	
	(assert (UI-state (display KidsTeen_Result)
					  (state final))))		
					  
;;; NONFICTION RESULTS

(defrule result-memoirs ""

	(logical (memoirs Yes))
	
	=>
	
	(assert (UI-state (display NonfictionMemoirs_Result)
					  (state final))))	
					  
(defrule result-food ""

	(logical (food Yes))
	
	=>
	
	(assert (UI-state (display NonfictionFood_Result)
					  (state final))))	
					  
(defrule result-business ""

	(logical (business Yes))
	
	=>
	
	(assert (UI-state (display NonfictionBusiness_Result)
					  (state final))))						  					  				  
					  
(defrule result-biography ""

	(logical (biography Yes))
	
	=>
	
	(assert (UI-state (display NonfictionBiography_Result)
					  (state final))))	
					  
(defrule result-grammar ""

	(logical (grammar Yes))
	
	=>
	
	(assert (UI-state (display NonfictionGrammar_Result)
					  (state final))))	
					  
(defrule result-non-history ""

	(logical (non-history Yes))
	
	=>
	
	(assert (UI-state (display NonFictionHistory_Result)
					  (state final))))	
					  
(defrule result-humor ""

	(logical (humor Yes))
	
	=>
	
	(assert (UI-state (display NonfictionHumor_Result)
					  (state final))))	
					  
(defrule result-memoirs ""

	(logical (inspiration Yes))
	
	=>
	
	(assert (UI-state (display NonfictionInspiration_Result)
					  (state final))))	
					  
(defrule result-government ""

	(logical (government Yes))
	
	=>
	
	(assert (UI-state (display NonfictionGovernment_Result)
					  (state final))))	
					  
(defrule result-nutrition ""

	(logical (government No))
	
	=>
	
	(assert (UI-state (display NonfictionNutrition_Result)
					  (state final))))	
					  
;;; SELF-HELP RESULTS

(defrule result-relationships ""

	(logical (relationships Yes))
	
	=>
	
	(assert (UI-state (display SelfHelpRelationships_Result)
					  (state final))))	
					  
(defrule result-inspirational ""

	(logical (inspirational Yes))
	
	=>
	
	(assert (UI-state (display SelfHelpInspirational_Result)
					  (state final))))	
					  
(defrule result-sh-Business ""

	(logical (inspirational No))
	
	=>
	
	(assert (UI-state (display SelfHelpBusiness_Result)
					  (state final))))					  				  				  					  					  					  					  					  					  					  			  				  				  

;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
