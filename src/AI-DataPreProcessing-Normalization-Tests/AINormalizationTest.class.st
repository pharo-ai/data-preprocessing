Class {
	#name : #AINormalizationTest,
	#superclass : #TestCase,
	#instVars : [
		'collection',
		'expectedRescaledCollection',
		'expectedStandardizedCollection'
	],
	#category : #'AI-DataPreProcessing-Normalization-Tests'
}

{ #category : #initialization }
AINormalizationTest >> setUp [
	super setUp.
	collection := #(10 -3 4 2 -7 1000 0.1 -4.05).
	
	expectedRescaledCollection := collection collect: [ :x | (x + 7) / 1007 ].
	expectedStandardizedCollection := collection collect: [ :x | (x - 125.25625) / 353.4890152238519 ]
]

{ #category : #tests }
AINormalizationTest >> testNormalized [
	self assert: collection normalized equals: expectedRescaledCollection
]

{ #category : #tests }
AINormalizationTest >> testNormalizedUsing [
	| normalizer standardizedCollection |
	
	normalizer := AIStandardizationNormalizer new.
	standardizedCollection := collection normalizedUsing: normalizer.
	
	standardizedCollection with: expectedStandardizedCollection do: [ :actual :expected |
		self assert: actual closeTo: expected ].
]

{ #category : #tests }
AINormalizationTest >> testRescaled [
	self assert: collection rescaled equals: expectedRescaledCollection
]

{ #category : #tests }
AINormalizationTest >> testRestoreRescaling [
	| normalizer normalizedCollection restoredCollection |
	
	normalizer := AIMinMaxNormalizer new.
	
	normalizedCollection := normalizer normalize: collection.
	restoredCollection := normalizer restore: normalizedCollection.
	
	restoredCollection with: collection do: [ :actual :expected |
		self assert: actual closeTo: expected ].
]

{ #category : #tests }
AINormalizationTest >> testRestoreStandardization [
	| normalizer normalizedCollection restoredCollection |
	
	normalizer := AIStandardizationNormalizer new.
	
	normalizedCollection := normalizer normalize: collection.
	restoredCollection := normalizer restore: normalizedCollection.
	
	restoredCollection with: collection do: [ :actual :expected |
		self assert: actual closeTo: expected ].
]

{ #category : #tests }
AINormalizationTest >> testStandardized [
	| standardizedCollection |
	
	standardizedCollection := collection standardized.
	
	standardizedCollection with: expectedStandardizedCollection do: [ :actual :expected |
		self assert: actual closeTo: expected ].
]
