"
I can normalize the numeric collection by transforming all numbers to a scale of [0, 1]. I do not modify the existing collection but create a new one.

Given a numeric collection $ x = \\{x_i\\}_{i=1}^{n} $, I returned a normalized collection $ x' = \\{x_i'\\}_{i=1}^{n} $ in which each element is defined as

$ x_i' = \\frac{x_i - x_{min}}{x_{max} - x_{min}} $
"
Class {
	#name : #AIMinMaxNormalizer,
	#superclass : #AINormalizer,
	#instVars : [
		'min',
		'max'
	],
	#category : #'AI-DataPreProcessing-Normalization'
}

{ #category : #normalization }
AIMinMaxNormalizer >> normalize: aCollection [

	"Normalize the numeric collection by transforming all numbers to a scale of [0, 1]"

	min ifNil: [ min := aCollection min ].
	max ifNil: [ max := aCollection max ].

	^ aCollection collect: [ :each | each - min / (max - min) ]
]

{ #category : #normalization }
AIMinMaxNormalizer >> restore: aCollection [

	"Restores the normalized collection to its original state using the min and max values that were saved during the normalization"

	^ aCollection collect: [ :each | each * (max - min) + min ]
]
