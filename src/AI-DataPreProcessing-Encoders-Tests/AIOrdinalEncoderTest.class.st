Class {
	#name : #AIOrdinalEncoderTest,
	#superclass : #TestCase,
	#instVars : [
		'collection',
		'encoder'
	],
	#category : #'AI-DataPreProcessing-Encoders-Tests'
}

{ #category : #running }
AIOrdinalEncoderTest >> setUp [

	super setUp.
	collection := #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	encoder := AIOrdinalEncoder new
]

{ #category : #tests }
AIOrdinalEncoderTest >> testFit [

	encoder fit: collection.

	self assert: encoder categories size equals: 2.
	self assertCollection: encoder categories first hasSameElements: #( 'Female' 'Male' ).
	self assertCollection: encoder categories second hasSameElements: #( 3 1 2 )
]

{ #category : #tests }
AIOrdinalEncoderTest >> testFit1DColl [

	collection := #( 1 2 nil ).
	self should: [ encoder fit: collection ] raise: AssertionFailure
]

{ #category : #tests }
AIOrdinalEncoderTest >> testFitAndTransform [

	| result |
	result := encoder fitAndTransform: collection.
	self assert: result size equals: collection size.
	result doWithIndex: [ :subCollection :index | self assert: subCollection size equals: (collection at: index) size ].
	self assert: ((result at: 1) at: 1) equals: ((result at: 3) at: 1).
	self deny: ((result at: 1) at: 1) equals: ((result at: 2) at: 1)
]

{ #category : #tests }
AIOrdinalEncoderTest >> testTransform [

	encoder categories: #( #( 'Female' 'Male' ) #( 3 1 2 ) ).

	self assert: (encoder transform: #( #( 'Male' 1 ) #( 'Female' 2 ) )) equals: #( #( 2 2 ) #( 1 3 ) )
]

{ #category : #tests }
AIOrdinalEncoderTest >> testTransform1DColl [

	collection := #( 'Female' 'Male' 'Female' ).
	encoder categories: #( #( 'Female' 'Male' ) ).
	self should: [ encoder transform: collection ] raise: AssertionFailure
]

{ #category : #tests }
AIOrdinalEncoderTest >> testTransformWithMissingValue [

	encoder categories: #( #( 'Female' 'Male' ) #( 3 1 2 ) ).

	self should: [ encoder transform: #( #( 'Male' 1 ) #( 'NB' 2 ) ) ] raise: AIMissingCategory
]
