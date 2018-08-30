#lang scribble/manual
@require[@for-label[breadcrumb
                    racket/base
                    racket/gui]]

@title[#:style 'toc]{breadcrumb}
@author{Philippe MECHAI}

@defmodule[breadcrumb]

A @racket[breadcrumb%] control is a navigational control that allows users to keep track
of their location.

Sample usage:

@codeblock{
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
}

@linebreak{}

@defclass[breadcrumb% editor-canvas% ()]{

Creates a @racket[breadcrumb%] control. Each element of the path is clickable.

@defconstructor[([callback (-> list? any/c)]
                 [separator string? "❯"])]{
Creates the control.

The @racket[callback] is called when an element of the path is clicked.
The argument to the @racket[callback] is a list of elements up to the clicked one.

The @racket[separator] is used to separate the path elements in the control.}

@defmethod[(set-path! [path list?]) void?]{
Sets the path to be displayed by the control}

}
