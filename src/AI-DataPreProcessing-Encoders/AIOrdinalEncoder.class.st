"
I am a simple encoder whose responsibility is to associate a number to each unique value of a 2D collection. (Can be a DataFrame)

I can be fitted with a collection to compute the categories to use and then transform another collection (possibily the same one).
All values of the collection to transform must be present in the collection used to fit the datas or an AIMissingCategory exception will be raised.

I can be use like this:

```st
	| collection |
	collection := #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	
	AIOrdinalEncoder new
		fit: collection;
		transform: collection.  ""#(#(2 3) #(1 1) #(2 2))""
```

Or:

```st
	| collection |
	collection := #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	
	AIOrdinalEncoder new
		fitAndTransform: collection.  ""#(#(2 3) #(1 1) #(2 2))""
```

The user can also give directly the categories to use like this:

```st
	| collection |
	collection := #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	
	AIOrdinalEncoder new
		categories: #( #( 'Female' 'Male' ) #( 3 1 2 ) );
		transform: collection. 	""#(#(1 1) #(2 2) #(1 3))""
```

In that case, the index of each elements will be used as a category.
"
Class {
	#name : #AIOrdinalEncoder,
	#superclass : #Object,
	#instVars : [
		'categories'
	],
	#category : #'AI-DataPreProcessing-Encoders'
}

{ #category : #accessing }
AIOrdinalEncoder class >> fitAndTransform: aCollection [

	^ self new fitAndTransform: aCollection
]

{ #category : #accessing }
AIOrdinalEncoder >> categories [
	^ categories
]

{ #category : #accessing }
AIOrdinalEncoder >> categories: anObject [
	categories := anObject
]

{ #category : #accessing }
AIOrdinalEncoder >> categoryAt: anIndex [

	self categories at: anIndex
]

{ #category : #private }
AIOrdinalEncoder >> ensureIs2D: aCollection [

	self assert: aCollection isCollection description: 'Imputer can only work on 2D collections.'.
	aCollection do: [ :coll | self assert: (coll isString not and: [ coll isCollection ]) description: 'Imputer can only work on 2D collections.' ]
]

{ #category : #api }
AIOrdinalEncoder >> fit: aCollection [

	self ensureIs2D: aCollection.
	self privateFit: aCollection
]

{ #category : #accessing }
AIOrdinalEncoder >> fitAndTransform: aCollection [

	^ self
		  ensureIs2D: aCollection;
		  privateFit: aCollection;
		  privateTransform: aCollection
]

{ #category : #api }
AIOrdinalEncoder >> privateFit: aCollection [

	categories := aCollection asArrayOfColumns collect: [ :column | column asSet asArray ]
]

{ #category : #api }
AIOrdinalEncoder >> privateTransform: aCollection [

	^ aCollection dataPreProcessingEncodeWith: self
]

{ #category : #api }
AIOrdinalEncoder >> transform: aCollection [

	self ensureIs2D: aCollection.
	^ self privateTransform: aCollection
]
