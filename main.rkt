#lang racket/gui

(provide breadcrumb%)

(define breadcrumb%
  (class editor-canvas%
    (init-field callback)

    (define editor (new text%))
    
    ;; Private methods
    (define/private (add-path-button label path)
      (define start (send editor last-position))
      (send editor insert label)
      (send editor set-clickback start (send editor last-position)
            (λ (t s e) (callback path))))
    
    (define/private (insert-path-separator)
      (send editor insert " ❯ ")) ;; ▶
    
    ;; Public methods
    (define/public (set-path! path)
      (send editor erase)
      (for ([elt path]
            [count (in-naturals 1)])
           (when (> count 1)
             (insert-path-separator))
           (add-path-button (~a elt) (take path count))))
    
    ;; New
    (super-new [editor editor]
               [style '(no-border no-focus no-vscroll no-hscroll)]
               [vertical-inset 0]
               [line-count 1]
               [stretchable-height #f])
    (send editor set-cursor (make-object cursor% 'arrow))))

