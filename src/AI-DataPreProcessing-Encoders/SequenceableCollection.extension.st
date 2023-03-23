Extension { #name : #SequenceableCollection }

{ #category : #'*AI-DataPreProcessing-Encoders' }
SequenceableCollection >> asArrayOfColumns [
	"Only apply to 2D collections. Return a 2D array with inverted orders."

	| numberOfColumns numberOfRows |
	numberOfColumns := self first size.
	numberOfRows := self size.
	^ (1 to: numberOfColumns) collect: [ :columnIndex | (1 to: numberOfRows) collect: [ :rowIndex | (self at: rowIndex) at: columnIndex ] ]
]
