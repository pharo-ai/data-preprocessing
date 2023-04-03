"
I am an error raised when an Encoder has to transform a value that has no category associated. 

This happens when #fit: was call without the value to fit present.
"
Class {
	#name : #AIMissingCategory,
	#superclass : #Error,
	#instVars : [
		'element'
	],
	#category : #'AI-DataPreProcessing-Encoders'
}

{ #category : #signalling }
AIMissingCategory class >> signalFor: anElement [

	^ self new
		  element: anElement;
		  signal
]

{ #category : #accessing }
AIMissingCategory >> element [

	^ element
]

{ #category : #accessing }
AIMissingCategory >> element: anObject [

	element := anObject
]

{ #category : #accessing }
AIMissingCategory >> messageText [

	^ self element printString , ' has no category associated and way missing from fitting.'
]
