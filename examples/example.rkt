#lang racket/gui

(require breadcrumb)

(define f (new frame% [label "Breadcrumb Sample"] [width 600] [height 400]))
(define p (new vertical-panel% [parent f]))
(define b (new breadcrumb%
               [parent p]
               [callback (lambda (path)
                           (send m set-label (~a "Selected path: " path)))]))
(define m (new message%
               [parent p]
               [label "Select a path in the breadcrumb"]))
(send f show #t)

(send b set-path! '(foo bar baz))