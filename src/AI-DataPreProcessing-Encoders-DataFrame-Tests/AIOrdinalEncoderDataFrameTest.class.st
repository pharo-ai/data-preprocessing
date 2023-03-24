"
This class contains tests
"
Class {
	#name : #AIOrdinalEncoderDataFrameTest,
	#superclass : #TestCase,
	#instVars : [
		'collection',
		'encoder'
	],
	#category : #'AI-DataPreProcessing-Encoders-DataFrame-Tests'
}

{ #category : #running }
AIOrdinalEncoderDataFrameTest >> setUp [

	super setUp.
	collection := DataFrame withRows: #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	encoder := AIOrdinalEncoder new
]

{ #category : #tests }
AIOrdinalEncoderDataFrameTest >> testFit [

	encoder fit: collection.

	self assert: encoder categories size equals: 2.
	self assertCollection: encoder categories first hasSameElements: #( 'Female' 'Male' ).
	self assertCollection: encoder categories second hasSameElements: #( 3 1 2 )
]

{ #category : #tests }
AIOrdinalEncoderDataFrameTest >> testFitAndTransform [

	| result |
	result := encoder fitAndTransform: collection.
	self assert: result size equals: collection size.
	result doWithIndex: [ :subCollection :index | self assert: subCollection size equals: (collection at: index) size ].
	self assert: ((result at: 1) at: 1) equals: ((result at: 3) at: 1).
	self deny: ((result at: 1) at: 1) equals: ((result at: 2) at: 1)
]

{ #category : #tests }
AIOrdinalEncoderDataFrameTest >> testTransform [

	encoder categories: #( #( 'Female' 'Male' ) #( 3 1 2 ) ).

	self assert: (encoder transform: (DataFrame withRows: #( #( 'Male' 1 ) #( 'Female' 2 ) ))) equals: (DataFrame withRows: #( #( 2 2 ) #( 1 3 ) ))
]
