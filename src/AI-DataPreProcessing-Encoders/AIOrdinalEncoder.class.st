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

{ #category : #api }
AIOrdinalEncoder >> fit: aCollection [

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

	^ aCollection collect: [ :subColl | subColl withIndexCollect: [ :element :columnIndex | (self categories at: columnIndex) indexOf: element ] ]
]
