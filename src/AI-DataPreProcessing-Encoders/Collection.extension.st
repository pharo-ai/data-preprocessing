Extension { #name : #Collection }

{ #category : #'*AI-DataPreProcessing-Encoders' }
Collection >> dataPreProcessingEncodeWith: anEncoder [

	| cache |
	cache := IdentityDictionary new.
	^ self collect: [ :subColl |
		  subColl withIndexCollect: [ :element :columnIndex |
			  | category |
			  category := cache at: columnIndex ifAbsentPut: [ ((anEncoder categories at: columnIndex) collectWithIndex: [ :elem :index | elem -> index ]) asDictionary ].
			  category at: element ifAbsent: [ AIMissingCategory signalFor: element ] ] ]
]
