Extension { #name : #DataFrame }

{ #category : #'*AI-DataPreProcessing-Encoders' }
DataFrame >> dataPreProcessingEncodeWith: anEncoder [
	"This method is here to speed up pharo-ai/data-preprocessing algos without coupling both projects."

	| copy cache |
	copy := self copy.
	cache := IdentityDictionary new.
	self columns doWithIndex: [ :dataSerie :columnIndex |
		| category |
		category := cache at: columnIndex ifAbsentPut: [ ((anEncoder categories at: columnIndex) collectWithIndex: [ :elem :index | elem -> index ]) asDictionary ].
		dataSerie doWithIndex: [ :element :rowIndex |
			copy at: rowIndex at: columnIndex put: (category at: element ifAbsent: [ AIMissingCategory signalFor: element ]) ] ].

	^ copy
]
