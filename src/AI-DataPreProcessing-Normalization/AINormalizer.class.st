"
I am an abstract class. My subclasses define different ways to normalize a numeric collection.
"
Class {
	#name : #AINormalizer,
	#superclass : #Object,
	#category : #'AI-DataPreProcessing-Normalization'
}

{ #category : #normalization }
AINormalizer >> normalize: aCollection [
	"Normalize a numeric collection. Subclasses should override this method to define different normalization strategies"
	self subclassResponsibility
]

{ #category : #normalization }
AINormalizer >> restore: aCollection [
	"Restores the normalized collection to its original state. Subclasses should override this method based on the different normalization strategies"
	self subclassResponsibility
]
