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
	encoder := AIOrdinalEncoder new
]

{ #category : #tests }
AIOrdinalEncoderTest >> testFit [

	collection := #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	encoder fit: collection.

	self assert: encoder categories size equals: 2.
	self assertCollection: encoder categories first hasSameElements: #( 'Female' 'Male' ).
	self assertCollection: encoder categories second hasSameElements: #( 3 1 2 )
]

{ #category : #tests }
AIOrdinalEncoderTest >> testFitAndTransform [

	| result |
	collection := #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	result := encoder fitAndTransform: collection.
	self assert: result size equals: collection size.
	result doWithIndex: [ :subCollection :index | self assert: subCollection size equals: (collection at: index) size ].
	self assert: ((result at: 1) at: 1) equals: ((result at: 3) at: 1).
	self deny: ((result at: 1) at: 1) equals: ((result at: 2) at: 1)
]

{ #category : #tests }
AIOrdinalEncoderTest >> testTransform [

	collection := #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	encoder categories: #( #( 'Female' 'Male' ) #( 3 1 2 ) ).

	self assert: (encoder transform: #( #( 'Male' 1 ) #( 'Female' 2 ) )) equals: #( #( 2 2 ) #( 1 3 ) )
]
