Class {
	#name : #AIOrdinalEncoder,
	#superclass : #Object,
	#instVars : [
		'categories'
	],
	#category : #'AI-DataPreProcessing-Encoders'
}

{ #category : #accessing }
AIOrdinalEncoder class >> fitAndTransform: aCollection [

	^ self new fitAndTransform: aCollection
]

{ #category : #accessing }
AIOrdinalEncoder >> categories [
	^ categories
]

{ #category : #accessing }
AIOrdinalEncoder >> categories: anObject [
	categories := anObject
]

{ #category : #private }
AIOrdinalEncoder >> ensureIs2D: aCollection [

	self assert: aCollection isCollection description: 'Imputer can only work on 2D collections.'.
	aCollection do: [ :coll | self assert: (coll isString not and: [ coll isCollection ]) description: 'Imputer can only work on 2D collections.' ]
]

{ #category : #api }
AIOrdinalEncoder >> fit: aCollection [

	self ensureIs2D: aCollection.
	self privateFit: aCollection
]

{ #category : #accessing }
AIOrdinalEncoder >> fitAndTransform: aCollection [

	^ self
		  ensureIs2D: aCollection;
		  privateFit: aCollection;
		  privateTransform: aCollection
]

{ #category : #api }
AIOrdinalEncoder >> privateFit: aCollection [

	categories := aCollection asArrayOfColumns collect: [ :column | column asSet asArray ]
]

{ #category : #api }
AIOrdinalEncoder >> privateTransform: aCollection [

	^ aCollection dataPreProcessingEncodeWith: self
]

{ #category : #api }
AIOrdinalEncoder >> transform: aCollection [

	self ensureIs2D: aCollection.
	^ self privateTransform: aCollection
]
