(defmacro if (arg truebody falsebody)
  (concat
   "if (" (translate arg) ") {"
   (indent (translate truebody))
   "} else {"
   (indent (translate falsebody))
   "}"))

(defmacro when (arg body)
  (concat
   "if (" (translate arg) ") {"
   (indent (translate body))
   "}"))

(defmacro > (lhs rhs)
  (concat "(" (translate lhs) " > " (translate rhs) ")"))

(defmacro < (lhs rhs)
  (concat "(" (translate lhs) " < " (translate rhs) ")"))

(defmacro = (lhs rhs)
  (concat "(" (translate lhs) " === " (translate rhs) ")"))

(defmacro != (lhs rhs)
  (concat "(" (translate lhs) " !== " (translate rhs) ")"))

(defmacro not (exp)
  (concat "(!" (translate exp) ")"))

(defmacro join (arr glue)
  (concat "(" (translate arr) ").join(" (translate glue) ")"))

(defmacro send (object method &rest args)
  (concat (translate object) "." (translate method)
	  "(" (join args ", ") ")")