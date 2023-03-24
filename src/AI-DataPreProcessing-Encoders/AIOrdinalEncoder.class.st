Class {
	#name : #AIOrdinalEncoder,
	#superclass : #Object,
	#instVars : [
		'categories'
	],
	#category : #'AI-DataPreProcessing-Encoders'
}

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
	categories := aCollection asArrayOfColumns collect: [ :column | column asSet asArray ]
]

{ #category : #accessing }
AIOrdinalEncoder >> fitAndTransform: aCollection [

	^ self
		  fit: aCollection;
		  transform: aCollection
]

{ #category : #api }
AIOrdinalEncoder >> transform: aCollection [

	self ensureIs2D: aCollection.
	^ aCollection collect: [ :subColl | subColl withIndexCollect: [ :element :columnIndex | (self categories at: columnIndex) indexOf: element ] ]
]
